import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_build_mode/flutter_build_mode_method_channel.dart';

void main() {
  MethodChannelFlutterBuildMode platform = MethodChannelFlutterBuildMode();
  const MethodChannel channel = MethodChannel('flutter_build_mode');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
