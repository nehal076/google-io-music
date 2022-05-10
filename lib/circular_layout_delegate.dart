import 'package:flutter/material.dart';
import 'dart:math' as math;

class CircularLayoutDelegate extends MultiChildLayoutDelegate {
  static const String actionButton = 'BUTTON';
  Offset center = Offset.zero;
  final int itemCount;
  final double radius;

  CircularLayoutDelegate({
    required this.itemCount,
    required this.radius,
  });

  static const double _radiansPerDegree = math.pi / 180;
  final double _startAngle = -90.0 * _radiansPerDegree;
  double _itemSpacing = 0;
  double _calculateItemAngle(int index) {
    return _startAngle + index * _itemSpacing * _radiansPerDegree;
  }

  @override
  void performLayout(Size size) {
    _itemSpacing = 360.0 / itemCount;
    center = Offset(size.width / 2, size.height / 2);
    for (int i = 0; i < itemCount; i++) {
      final String actionButtonId = '$actionButton$i';

      if (hasChild(actionButtonId)) {
        final Size buttonSize =
            layoutChild(actionButtonId, BoxConstraints.loose(size));
        final double itemAngle = _calculateItemAngle(i);

        positionChild(
          actionButtonId,
          Offset(
            (center.dx - buttonSize.width / 2) + (radius) * math.cos(itemAngle),
            (center.dy - buttonSize.height / 2) +
                (radius) * math.sin(itemAngle),
          ),
        );
      }
    }
  }

  @override
  bool shouldRelayout(CircularLayoutDelegate oldDelegate) => true;
}
