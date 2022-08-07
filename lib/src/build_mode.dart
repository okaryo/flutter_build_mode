enum _BuildModeKind { debug, release, profile }

class BuildMode {
  static bool get isDebug => _buildMode == _BuildModeKind.debug;

  static bool get isRelease => _buildMode == _BuildModeKind.release;

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
