import 'dart:math';

import 'package:kyouen/src/point.dart';

/// a*x + b*y + c = 0
class Line {
  final Point<double> p1;
  final Point<double> p2;
  final double a;
  final double b;
  final double c;

  Line._(this.p1, this.p2, this.a, this.b, this.c);

  factory Line.fromPoints(Point<double> p1, Point<double> p2) {
    final a = p1.y - p2.y;
    final b = p2.x - p1.x;
    final c = p1.x * p2.y - p2.x * p1.y;
    return Line._(p1, p2, a, b, c);
  }

  double getY(double x) {
    return -1 * (a * x + c) / b;
  }

  double getX(double y) {
    return -1 * (b * y + c) / a;
  }

  KyouenPoint? calculateIntersection(Line other) {
    final f1 = p2.x - p1.x;
    final g1 = p2.y - p1.y;
    final f2 = other.p2.x - other.p1.x;
    final g2 = other.p2.y - other.p1.y;

    final det = f2 * g1 - f1 * g2;
    if (det == 0) {
      return null;
    }

    final dx = other.p1.x - p1.x;
    final dy = other.p1.y - p1.y;
    final t1 = (f2 * dy - g2 * dx) / det;

    return KyouenPoint(p1.x + f1 * t1, p1.y + g1 * t1);
  }
}
