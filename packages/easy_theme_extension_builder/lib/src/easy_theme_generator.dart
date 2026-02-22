import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
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
  String? generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    if (element case final ClassElement element
        when element.isAbstract && element.isPrivate) {
      // final meta = annotation.parse(options);
      final generated = Library((l) {
        l.body.addAll([
          _buildClass(element),
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

  Class _buildClass(ClassElement element) {
    final className = element.name!.substring(1);
    final props = element.fields.where((e) => e.isOriginGetterSetter).toList();
    return Class((c) {
      c
        // class
        ..name = className
        ..extend = Reference('ThemeExtension<$className>')
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
        ..fields.addAll(
          props.map((e) {
            return Field((f) {
              f
                ..name = e.name
                ..modifier = .final$
                ..type = Reference(e.type.toString())
                ..annotations.add(const CodeExpression(Code('override')));
            });
          }),
        )
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
                      ..type = Reference(e.type.nullable)
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
                return '${e.name}: ${e.type.nonNull}.lerp(${e.name}, other.${e.name}, t)${e.type.isNullable ? '' : '!'}';
              }).join(',')});''')
            //
            ;
          }),
        ])
      //
      ;
    });
  }

  Extension _buildContextExtension(ClassElement element) {
    final className = element.name!.substring(1);
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

// extension on ConstantReader {
//   EasyTheme parse(BuilderOptions options) {
//     // final map = options.config;
//     return const EasyTheme();
//   }
// }
