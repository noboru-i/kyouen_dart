import 'package:test/test.dart';

import 'package:kyouen/kyouen.dart';

void main() {
  group('getY', () {
    test('should return 5', () {
      var result =
          Line.fromPoints(KyouenPoint(1, 1), KyouenPoint(2, 3)).getY(3);
      expect(result, 5);
    });
  });

  group('getX', () {
    test('should return 4', () {
      var result =
          Line.fromPoints(KyouenPoint(0, 0), KyouenPoint(-2, 1)).getX(-2);
      expect(result, 4);
    });
  });

  group('calculateIntersection', () {
    test('should return (1, 2)', () {
      final line2 = Line.fromPoints(KyouenPoint(0, 3), KyouenPoint(4, -1));
      final result = Line.fromPoints(KyouenPoint(0, 0), KyouenPoint(0.5, 1))
          .calculateIntersection(line2);
      expect(result, KyouenPoint(1, 2));
    });
  });
}
