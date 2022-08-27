import 'package:flutter_build_mode/src/build_mode.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('#when', () {
    test('should return function result that depends on build mode', () {
      final actual = BuildMode.when(
        release: () => 'release',
        profile: () => 'profile',
        debug: () => 'debug',
      );
      const expected = 'debug';

      expect(actual, expected);
    });
  });

  group('#maybeWhen', () {
    group('when build mode is debug mode and debug parameter is present', () {
      test('should return result of debug function', () {
        final actual = BuildMode.maybeWhen(
          debug: () => 'debug',
          orElse: () => 'orElse',
        );
        const expected = 'debug';

        expect(actual, expected);
      });
    });

    group('when build mode is debug mode and debug parameter is not present', () {
      test('should return result of orElse function', () {
        final actual = BuildMode.maybeWhen(
          release: () => 'release',
          orElse: () => 'orElse',
        );
        const expected = 'orElse';

        expect(actual, expected);
      });
    });
  });
}
