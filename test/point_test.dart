import 'package:test/test.dart';

import 'package:kyouen/kyouen.dart';

void main() {
  group('abs', () {
    test('should return 5', () {
      var result = KyouenPoint(3, 4).abs();
      expect(result, 5);
    });
  });

  group('difference', () {
    test('should return (2, -1)', () {
      var result = KyouenPoint(1, 2).difference(KyouenPoint(-1, 3));
      expect(result, KyouenPoint(2, -1));
    });
  });

  group('calculateMidperpendicular', () {
    // y = 2x - 4
    // (1, 3), (5, 1)
    test('should return 2x-y-4=0', () {
      var midperpendicular =
          KyouenPoint(1, 3).calculateMidperpendicular(KyouenPoint(5, 1));
      expect(midperpendicular.getY(1), -2);
      expect(midperpendicular.getY(2), 0);
    });
  });

  group('calculateMidpoint', () {
    test('should return (0, 1)', () {
      var result = KyouenPoint(2, 0).calculateMidpoint(KyouenPoint(-2, 2));
      expect(result, KyouenPoint(0, 1));
    });
  });

  group('calculateDistance', () {
    test('should return 5', () {
      var result = KyouenPoint(4, 3).calculateDistance(KyouenPoint(1, -1));
      expect(result, 5);
    });
  });
}
