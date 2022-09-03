[![Test and Lint](https://github.com/okaryo/flutter_build_mode/actions/workflows/test-and-lint.yml/badge.svg)](https://github.com/okaryo/flutter_build_mode/actions/workflows/test-and-lint.yml)

# flutter_build_mode

A package that extends the use of the 3 build modes, release, profile, and debug, for Flutter apps!

## Usage
```dart
import 'package:flutter_build_mode/flutter_build_mode.dart';

// return true if build mode is Release mode.
BuildMode.isRease;

// return true if build mode is Profile mode.
BuildMode.isProfile;

// return true if build mode is Debug mode.
BuildMode.isDebug;

// return the result of a callback that matches the runtime build mode.
BuildMode.when(
  release: () => 'release mode!',
  profile: () => 'profile mode!',
  debug: () => 'debug mode!',
);
```
