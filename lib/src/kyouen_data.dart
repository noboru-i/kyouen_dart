import 'package:kyouen/src/line.dart';
import 'package:kyouen/src/point.dart';

class KyouenData {
  final List<KyouenPoint> points;
  final bool isLineKyouen;
  final KyouenPoint? center;
  final double? radius;
  final Line? line;

  KyouenData.lineKyouen(KyouenPoint p1, KyouenPoint p2, KyouenPoint p3,
      KyouenPoint p4, Line aLine)
      : points = [p1, p2, p3, p4],
        isLineKyouen = true,
        center = null,
        radius = null,
        line = aLine;

  KyouenData.circleKyouen(
    KyouenPoint p1,
    KyouenPoint p2,
    KyouenPoint p3,
    KyouenPoint p4,
    KyouenPoint aCenter,
    double aRadius,
  )   : points = [p1, p2, p3, p4],
        isLineKyouen = false,
        center = aCenter,
        radius = aRadius,
        line = null;
}
