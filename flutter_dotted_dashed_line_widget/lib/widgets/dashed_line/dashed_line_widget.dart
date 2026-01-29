import 'package:flutter/material.dart';
import 'dashed_line_types.dart';

class DashedLine extends StatelessWidget {
  final double length;
  final double thickness;
  final Color color;
  final List<double> dashPattern;
  final Axis direction;
  final EdgeInsets? margin;
  final DashedLineStyle style;
  final double borderRadius;

  DashedLine({
    super.key,
    required this.length,
    this.thickness = 1.0,
    this.color = Colors.grey,
    List<double>? dashPattern,
    this.direction = Axis.horizontal,
    this.margin,
    this.style = DashedLineStyle.solid,
    this.borderRadius = 0,
  })  : dashPattern = dashPattern ?? [5, 5] {
    assert(this.dashPattern.length == 2,
    'Dash pattern must have exactly 2 elements');
    assert(this.dashPattern.every((e) => e > 0),
    'Dash pattern values must be positive');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: direction == Axis.horizontal ? length : thickness,
      height: direction == Axis.vertical ? length : thickness,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: CustomPaint(
        painter: _DashedLinePainter(
          color: color,
          thickness: thickness,
          dashPattern: dashPattern,
          direction: direction,
          style: style,
        ),
      ),
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  final Color color;
  final double thickness;
  final List<double> dashPattern;
  final Axis direction;
  final DashedLineStyle style;

  _DashedLinePainter({
    required this.color,
    required this.thickness,
    required this.dashPattern,
    required this.direction,
    required this.style,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = thickness
      ..strokeCap =
      style == DashedLineStyle.rounded ? StrokeCap.round : StrokeCap.square
      ..style = PaintingStyle.stroke;

    final dashWidth = dashPattern[0];
    final dashSpace = dashPattern[1];
    final totalLength =
    direction == Axis.horizontal ? size.width : size.height;

    double start = 0;
    while (start < totalLength) {
      final end = (start + dashWidth).clamp(0.0, totalLength);

      if (direction == Axis.horizontal) {
        canvas.drawLine(
          Offset(start, size.height / 2),
          Offset(end, size.height / 2),
          paint,
        );
      } else {
        canvas.drawLine(
          Offset(size.width / 2, start),
          Offset(size.width / 2, end),
          paint,
        );
      }

      start += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant _DashedLinePainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.thickness != thickness ||
        oldDelegate.dashPattern != dashPattern ||
        oldDelegate.direction != direction ||
        oldDelegate.style != style;
  }
}
