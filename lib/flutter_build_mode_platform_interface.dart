import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_build_mode_method_channel.dart';

abstract class FlutterBuildModePlatform extends PlatformInterface {
  /// Constructs a FlutterBuildModePlatform.
  FlutterBuildModePlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterBuildModePlatform _instance = MethodChannelFlutterBuildMode();

  /// The default instance of [FlutterBuildModePlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterBuildMode].
  static FlutterBuildModePlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterBuildModePlatform] when
  /// they register themselves.
  static set instance(FlutterBuildModePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
