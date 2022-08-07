import 'package:flutter/material.dart';
import 'package:flutter_build_mode/flutter_build_mode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('BuildMode example'),
        ),
        body: Center(
          child: Text('Current build mode is ${_currentBuildMode()}'),
        ),
      ),
    );
  }

  String _currentBuildMode() {
    if (BuildMode.isRelease) {
      return 'Release Mode';
    }
    if (BuildMode.isProfile) {
      return 'Profile Mode';
    }

    return 'Debug Mode';
  }
}
