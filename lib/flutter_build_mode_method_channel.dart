import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_build_mode_platform_interface.dart';

/// An implementation of [FlutterBuildModePlatform] that uses method channels.
class MethodChannelFlutterBuildMode extends FlutterBuildModePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_build_mode');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
