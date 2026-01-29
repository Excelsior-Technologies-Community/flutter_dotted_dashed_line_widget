import 'package:flutter/material.dart';
import 'dotted_line_types.dart';

class DottedLine extends StatelessWidget {
  final double length;
  final double strokeWidth;
  final Color color;
  final double dashLength;
  final double dashSpacing;
  final Axis direction;
  final DottedLineStyle style;
  final EdgeInsets? padding;

  const DottedLine({
    Key? key,
    required this.length,
    this.strokeWidth = 1.0,
    this.color = Colors.black,
    this.dashLength = 5.0,
    this.dashSpacing = 3.0,
    this.direction = Axis.horizontal,
    this.style = DottedLineStyle.solid,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: SizedBox(
        width: direction == Axis.horizontal ? length : strokeWidth,
        height: direction == Axis.vertical ? length : strokeWidth,
        child: CustomPaint(
          painter: _DottedLinePainter(
            strokeWidth: strokeWidth,
            color: color,
            dashLength: dashLength,
            dashSpacing: dashSpacing,
            direction: direction,
            style: style,
          ),
        ),
      ),
    );
  }
}

class _DottedLinePainter extends CustomPainter {
  final double strokeWidth;
  final Color color;
  final double dashLength;
  final double dashSpacing;
  final Axis direction;
  final DottedLineStyle style;

  _DottedLinePainter({
    required this.strokeWidth,
    required this.color,
    required this.dashLength,
    required this.dashSpacing,
    required this.direction,
    required this.style,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..strokeCap = style == DottedLineStyle.rounded
          ? StrokeCap.round
          : StrokeCap.square
      ..style = PaintingStyle.stroke;

    final totalLength = direction == Axis.horizontal ? size.width : size.height;
    final dashCount = (totalLength / (dashLength + dashSpacing)).ceil();

    for (var i = 0; i < dashCount; i++) {
      final start = i * (dashLength + dashSpacing);
      final end = start + dashLength;

      if (direction == Axis.horizontal) {
        final startX = start;
        final endX = end.clamp(0.0, totalLength);

        if (startX < totalLength) {
          canvas.drawLine(
            Offset(startX, size.height / 2),
            Offset(endX, size.height / 2),
            paint,
          );
        }
      } else {
        final startY = start;
        final endY = end.clamp(0.0, totalLength);

        if (startY < totalLength) {
          canvas.drawLine(
            Offset(size.width / 2, startY),
            Offset(size.width / 2, endY),
            paint,
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate is _DottedLinePainter &&
        (oldDelegate.strokeWidth != strokeWidth ||
            oldDelegate.color != color ||
            oldDelegate.dashLength != dashLength ||
            oldDelegate.dashSpacing != dashSpacing ||
            oldDelegate.direction != direction ||
            oldDelegate.style != style);
  }
}