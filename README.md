[![Test and Lint](https://github.com/okaryo/flutter_build_mode/actions/workflows/test-and-lint.yml/badge.svg)](https://github.com/okaryo/flutter_build_mode/actions/workflows/test-and-lint.yml)

# flutter_build_mode

Get 3 build modes of your Flutter app, release, profile, and debug!

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
