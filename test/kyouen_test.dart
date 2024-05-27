import 'dart:math';

import 'package:kyouen/src/kyouen.dart';
import 'package:kyouen/src/point.dart';
import 'package:test/test.dart';

void main() {
  group('hasKyouen', () {
    test('should return null', () {
      var result =
          Kyouen([KyouenPoint(1, 1), KyouenPoint(2, 3), KyouenPoint(2, 3)])
              .hasKyouen();
      expect(result, null);
    });

    test('should return line kyouen', () {
      var result = Kyouen([
        KyouenPoint(1, 1),
        KyouenPoint(2, 2),
        KyouenPoint(3, 3),
        KyouenPoint(4, 4)
      ]).hasKyouen();
      expect(result?.isLineKyouen, true);
      expect(result?.line?.getY(-1), -1);
    });

    test('should return oval kyouen', () {
      var result = Kyouen([
        KyouenPoint(2, 2),
        KyouenPoint(3, 2),
        KyouenPoint(2, 3),
        KyouenPoint(3, 3)
      ]).hasKyouen();
      expect(result?.isLineKyouen, false);
      expect(result?.center, KyouenPoint(2.5, 2.5));
      expect(result?.radius, 0.5 * sqrt(2));
    });

    test('should return oval kyouen by 5 stones', () {
      var result = Kyouen([
        KyouenPoint(0, 0),
        KyouenPoint(2, 2),
        KyouenPoint(3, 2),
        KyouenPoint(2, 3),
        KyouenPoint(3, 3)
      ]).hasKyouen();
      expect(result?.isLineKyouen, false);
      expect(result?.center, KyouenPoint(2.5, 2.5));
      expect(result?.radius, 0.5 * sqrt(2));
    });

    const kyouenStages = '''000000010000001100001100000000001000
000000000000000100010010001100000000
000000001000010000000100010010001000
001000001000000010010000010100000000
000000001011010000000010001000000010
000100000000101011010000000000000000
000000001010000000010010000000001010
001000000001010000010010000001000000
000000001000010000000010000100001000
000100000010010000000100000010010000
010001000000001010000000010000000000
001010000000010001000010001000000100
000100000010001000000100010010001000
000010000100001000001010010000001000
000000010010000000100010000100001000
000000000100001000010010000000000100
000000010000001010000000010000001010
000010010000000100100000010100000000
001000100001000000010001000000000100
000010010001001000000100000000001000
000000010100000010000000001000010010
000100000000011000001000000010010100
000010000010010000000000100001001000
000000001001010000000000000010000000001000100000100000010000001000001000000000000
010000100000010000001000001000000110
001000010000000000001000000100010001
000000100000000000001000001000010000000000000000101000000000000001010000000000001
000000001000010100000010001000000000
010100000100010000000010001000001000
100000000000010101101000000010010000
000000001100000000110100000000001001
000000010101001000100010010000000010
000000000000000000010100000000000000000001000010000000000001010100000000001000001
101000000000000000000001000000000001000000101001000000000010000000000000000000000
000000000001001000000001001000100000000000000000100000000001000000000000100100000
000000001010000000000000001000000000000000000000100000010000000000000001000000000
100100000000000000010000000000000000000000000000000000000000100000000000000100010
000000000001000000000000000000010001000100000000001000000001000000000000100100001
100001000010010000100010000001001000
000000000000000010010110000010001000
000010000000010101000000001010000000
010011010000000001100000000000001011
011001000000100000000001000000100010
001000000010010000010001000010000101
010010010000000000000000001100000000000000000000000000000000001100000000000000100
000000000000000100000100000000000000001000101000000000000100100000000000000000010
000000100000000000000101010000000000001010010000000000000101000000000000000000000
000010010000001010010100000000000100
111000010101100000000000000000000000
100100000000010000000100000000100101''';
    kyouenStages.split('\n').forEach((stage) {
      test('should $stage has kyouen', () {
        final result = Kyouen(stonesFromString(stage)).hasKyouen();
        expect(result, isNotNull);
      });
    });

    const notKyouenStages = '''000000010000001100001000000000001000
000000000000000100010010000100000000
000000000000010000000100010010001000
001000000000000010010000010100000000
000000000011010000000010001000000010
000100000000100011010000000000000000
000000000010000000010010000000001010
001000000000010000010010000001000000
000000000000010000000010000100001000
000000000010010000000100000010010000''';
    notKyouenStages.split('\n').forEach((stage) {
      test('should not $stage has kyouen', () {
        final result = Kyouen(stonesFromString(stage)).hasKyouen();
        expect(result, isNull);
      });
    });
  });
}

List<KyouenPoint> stonesFromString(stage) {
  final size = sqrt(stage.length).toInt();
  final stoneArray = <KyouenPoint>[];
  for (var x = 0; x < size; x++) {
    for (var y = 0; y < size; y++) {
      final index = x + y * size;
      final char = stage.substring(index, index + 1);
      if (char == '1') {
        stoneArray.add(KyouenPoint(x.toDouble(), y.toDouble()));
      }
    }
  }
  return stoneArray;
}
