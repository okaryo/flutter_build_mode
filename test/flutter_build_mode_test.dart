import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_build_mode/flutter_build_mode.dart';
import 'package:flutter_build_mode/flutter_build_mode_platform_interface.dart';
import 'package:flutter_build_mode/flutter_build_mode_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterBuildModePlatform 
    with MockPlatformInterfaceMixin
    implements FlutterBuildModePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterBuildModePlatform initialPlatform = FlutterBuildModePlatform.instance;

  test('$MethodChannelFlutterBuildMode is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterBuildMode>());
  });

  test('getPlatformVersion', () async {
    FlutterBuildMode flutterBuildModePlugin = FlutterBuildMode();
    MockFlutterBuildModePlatform fakePlatform = MockFlutterBuildModePlatform();
    FlutterBuildModePlatform.instance = fakePlatform;
  
    expect(await flutterBuildModePlugin.getPlatformVersion(), '42');
  });
}
