import 'dart:math';

import 'package:kyouen/kyouen.dart';

typedef KyouenPoint = Point<double>;

extension KyouenPointExtension on KyouenPoint {
  double abs() => sqrt(x * x + y * y);

  KyouenPoint difference(KyouenPoint other) =>
      KyouenPoint(x - other.x, y - other.y);

  Line calculateMidperpendicular(KyouenPoint other) {
    final mid = calculateMidpoint(other);
    final diff = this - other;
    final gradient = KyouenPoint(diff.y, -diff.x);
    return Line.fromPoints(mid, mid + gradient);
  }

  KyouenPoint calculateMidpoint(KyouenPoint other) {
    final x = (this.x + other.x) / 2;
    final y = (this.y + other.y) / 2;
    return Point(x, y);
  }

  double calculateDistance(KyouenPoint other) => (this - other).abs();
}
