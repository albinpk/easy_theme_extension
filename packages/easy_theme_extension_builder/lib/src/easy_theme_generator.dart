import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/src/dart/ast/ast.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:easy_theme_extension/easy_theme_extension.dart';
import 'package:source_gen/source_gen.dart';

/// Generator for [EasyTheme] annotation.
class EasyThemeGenerator extends GeneratorForAnnotation<EasyTheme> {
  /// Generator for [EasyTheme] annotation.
  const EasyThemeGenerator({required this.options});

  final BuilderOptions options;

  @override
  Future<String?> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    if (element case final ClassElement element
        when element.isAbstract && element.isPrivate) {
      // final meta = annotation.parse(options);
      final classCode = await _buildClass(element, buildStep);
      final generated = Library((l) {
        l.body.addAll([
          classCode,
          _buildContextExtension(element),
        ]);
      });

      final emitter = DartEmitter(
        useNullSafetySyntax: true,
        orderDirectives: true,
        allocator: Allocator(),
      );

      return DartFormatter(
        languageVersion: DartFormatter.latestLanguageVersion,
      ).format(generated.accept(emitter).toString());
    }

    return null;
  }

  Future<Class> _buildClass(ClassElement element, BuildStep buildStep) async {
    final className = element.publicName;
    final props = element.getters;

    // Related to the static const field with default values
    final hasDefaultStaticConst = props.every(
      (e) => e.returnType.isNullable || !e.isAbstract,
    );
    final defaultKeyValues = <String>[];
    for (final p in props) {
      if (await buildStep.resolver.astNodeFor(p.firstFragment)
          case MethodDeclaration(:final body)) {
        if (body case final ExpressionFunctionBody exp) {
          defaultKeyValues.add('${p.name}: ${exp.expression.toSource()}');
        } else if (body is EmptyFunctionBody) {
          defaultKeyValues.add('${p.name}: null');
        } else {
          throw Exception(
            'Unsupported body type: ${body.runtimeType}\n '
            '"${body.toSource()}"',
          );
        }
      }
    }

    return Class((c) {
      c
        // class
        ..name = className
        ..extend = Reference('ThemeExtension<$className>')
        ..mixins.add(const Reference('Diagnosticable'))
        ..implements.add(Reference('_$className'))
        ..annotations.add(const CodeExpression(Code('immutable')))
        // constructor
        ..constructors.add(
          Constructor((c) {
            c
              ..constant = true
              ..optionalParameters.addAll(
                props.map((e) {
                  return Parameter((p) {
                    p
                      ..toThis = true
                      ..name = e.name!
                      ..named = true
                      ..required = true;
                  });
                }),
              );
          }),
        )
        // fields
        ..fields.addAll([
          // instance fields
          ...props.map((e) {
            return Field((f) {
              f
                ..name = e.name
                ..modifier = .final$
                ..type = Reference(e.returnType.toString())
                ..annotations.add(const CodeExpression(Code('override')));
            });
          }),

          // default static constant instance
          if (hasDefaultStaticConst)
            Field((f) {
              f
                ..name = r'$default'
                ..modifier = .constant
                ..static = true
                ..assignment = Code(
                  "$className(${defaultKeyValues.join(',')})",
                );
            }),
        ])
        ..methods.addAll([
          // copyWith
          Method((m) {
            m
              ..name = 'copyWith'
              ..annotations.add(const CodeExpression(Code('override')))
              ..returns = Reference(className)
              ..optionalParameters.addAll(
                props.map((e) {
                  return Parameter((p) {
                    p
                      ..name = e.name!
                      ..type = Reference(e.returnType.nullable)
                      ..named = true;
                  });
                }),
              )
              ..lambda = true
              ..body = Code(
                "$className(${props.map((e) {
                  return '${e.name}: ${e.name} ?? this.${e.name}';
                }).join(',')})",
              );
          }),

          // lerp
          Method((m) {
            m
              ..name = 'lerp'
              ..annotations.add(const CodeExpression(Code('override')))
              ..returns = Reference(className)
              ..requiredParameters.addAll([
                Parameter((p) {
                  p
                    ..name = 'other'
                    ..type = Reference('$className?');
                }),
                Parameter((p) {
                  p
                    ..name = 't'
                    ..type = const Reference('double');
                }),
              ])
              ..body = Code('''
                if (other is! $className) return this;
                return $className(${props.map((e) {
                return '${e.name}: ${e.returnType.nonNull}.lerp(${e.name}, other.${e.name}, t)${e.returnType.isNullable ? '' : '!'}';
              }).join(',')});''');
          }),

          // debugFillProperties
          Method.returnsVoid((m) {
            m
              ..name = 'debugFillProperties'
              ..annotations.add(const CodeExpression(Code('override')))
              ..requiredParameters.add(
                Parameter((p) {
                  p
                    ..name = 'properties'
                    ..type = const Reference('DiagnosticPropertiesBuilder');
                }),
              )
              ..body = Code('''
                super.debugFillProperties(properties);
                properties..
                ${props.map((e) {
                return "add(DiagnosticsProperty<${e.returnType.nonNull}>('${e.name}', ${e.name}))";
              }).join('..')};''');
          }),
        ]);
    });
  }

  Extension _buildContextExtension(ClassElement element) {
    final className = element.publicName;
    return Extension((e) {
      e
        ..name = '${className}BuildContextExtension'
        ..on = const Reference('BuildContext')
        ..methods.add(
          Method((f) {
            f
              ..name = className[0].toLowerCase() + className.substring(1)
              ..returns = Reference(className)
              ..type = .getter
              ..lambda = true
              ..body = Code('Theme.of(this).extension<$className>()!');
          }),
        );
    });
  }
}

extension on DartType {
  bool get isNullable => toString().endsWith('?');

  String get nonNull =>
      isNullable ? toString().substring(0, toString().length - 1) : toString();

  String get nullable => isNullable ? toString() : '${toString()}?';
}

extension on ClassElement {
  String get publicName => name!.substring(1);
}

// extension on ConstantReader {
//   EasyTheme parse(BuilderOptions options) {
//     // final map = options.config;
//     return const EasyTheme();
//   }
// }
