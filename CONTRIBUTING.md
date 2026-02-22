# Contributing

Thank you for contributing to `easy_theme_extension`.

## Project Structure

* `easy_theme_extension` → Annotation and public API
* `easy_theme_extension_builder` → Code generator implementation

## Setup

1. Clone the repository:

```bash
git clone https://github.com/albinpk/easy_theme_extension.git
cd easy_theme_extension
```

2. Install dependencies:

```bash
dart pub get
```

3. Run tests:

```bash
dart test
```

4. Run build_runner when modifying generator logic:

```bash
dart run build_runner build
```

## Guidelines

* Keep the API minimal and declarative.
* Avoid adding unnecessary configuration.
* Ensure generated code remains clean and readable.
* Add or update tests for any behavior changes.
* Do not introduce breaking changes without discussion.

## Pull Requests

* Keep PRs focused and atomic.
* Include a clear explanation of the change.
* Ensure all tests pass before submitting.

---

For major changes, open an issue first to discuss the design.
