import 'package:kyouen/src/kyouen_data.dart';
import 'package:kyouen/src/line.dart';
import 'package:kyouen/src/point.dart';

class Kyouen {
  Kyouen(this.points);

  final List<KyouenPoint> points;

  KyouenData? hasKyouen() {
    if (points.length < 4) {
      return null;
    }

    for (final c in combination<KyouenPoint>(points, 4)) {
      final p1 = c[0];
      final p2 = c[1];
      final p3 = c[2];
      final p4 = c[3];

      final kyouen = isKyouen(p1, p2, p3, p4);
      if (kyouen != null) {
        return kyouen;
      }
    }
    return null;
  }

  KyouenData? isKyouen(
      KyouenPoint p1, KyouenPoint p2, KyouenPoint p3, KyouenPoint p4) {
    final l12 = p1.calculateMidperpendicular(p2);
    final l23 = p2.calculateMidperpendicular(p3);

    final intersection123 = l12.calculateIntersection(l23);
    if (intersection123 == null) {
      // p1, p2, p3 is on the line.
      final l34 = p3.calculateMidperpendicular(p4);
      final intersection234 = l23.calculateIntersection(l34);
      if (intersection234 == null) {
        // p2, p3, p4 is on the line.
        return KyouenData.lineKyouen(p1, p2, p3, p4, Line.fromPoints(p1, p2));
      }
      return null;
    }

    final dist1 = p1.calculateDistance(intersection123);
    final dist2 = p4.calculateDistance(intersection123);
    if ((dist1 - dist2).abs() == 0) {
      return KyouenData.circleKyouen(p1, p2, p3, p4, intersection123, dist1);
    }

    return null;
  }
}

List<List<T>> combination<T>(List<T> list, int n) {
  return n == 1
      ? list.map((el) => [el]).toList()
      : list.asMap().entries.expand((entry) {
          return combination(list.sublist(entry.key + 1), n - 1)
              .map((el) => [entry.value] + el)
              .toList();
        }).toList();
}
