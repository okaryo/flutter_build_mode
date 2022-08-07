enum _BuildModeKind { debug, release, profile }

// Provides Flutter app build mode information.
class BuildMode {
  // return true if app build mode is Debug mode.
  static bool get isDebug => _buildMode == _BuildModeKind.debug;

  // return true if app build mode is Release mode.
  static bool get isRelease => _buildMode == _BuildModeKind.release;

  // return true if app build mode is Profile mode.
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
}
