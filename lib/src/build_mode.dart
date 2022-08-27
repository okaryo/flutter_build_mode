enum _BuildModeKind { debug, release, profile }

/// Provides Flutter app build mode information.
class BuildMode {
  /// return true if app build mode is Debug mode.
  static bool get isDebug => _buildMode == _BuildModeKind.debug;

  /// return true if app build mode is Release mode.
  static bool get isRelease => _buildMode == _BuildModeKind.release;

  /// return true if app build mode is Profile mode.
  static bool get isProfile => _buildMode == _BuildModeKind.profile;

  static final _BuildModeKind _buildMode = (() {
    if (const bool.fromEnvironment('dart.vm.product')) {
      return _BuildModeKind.release;
    }

    var result = _BuildModeKind.profile;
    assert(() {
      result = _BuildModeKind.debug;
      return true;
    }());

    return result;
  })();

  /// A function returns the result of a callback that matches the runtime build mode.
  /// All callbacks are required.
  static R when<R>({
    required R Function() release,
    required R Function() profile,
    required R Function() debug,
  }) {
    switch (_buildMode) {
      case _BuildModeKind.release:
        return release();
      case _BuildModeKind.profile:
        return profile();
      case _BuildModeKind.debug:
        return debug();
    }
  }

  /// A function returns the result of a callback that matches the runtime build mode.
  /// Some callbacks can be omitted, but only `orElse` is required.
  static R maybeWhen<R>({
    R Function()? release,
    R Function()? profile,
    R Function()? debug,
    required R Function() orElse,
  }) {
    if (_buildMode == _BuildModeKind.release && release != null) return release();
    if (_buildMode == _BuildModeKind.profile && profile != null) return profile();
    if (_buildMode == _BuildModeKind.debug && debug != null) return debug();

    return orElse();
  }
}
