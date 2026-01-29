import 'package:flutter/material.dart';
import 'dashed_line_widget.dart';

enum DashedLineStyle {
  solid,
  rounded,
}

// Pre-configured DashedLine widgets
class DashedLineDivider extends StatelessWidget {
  final double length;
  final Axis direction;
  final Color color;
  final double thickness;
  final EdgeInsets? margin;

  const DashedLineDivider({
    super.key,
    required this.length,
    this.direction = Axis.horizontal,
    this.color = Colors.grey,
    this.thickness = 1.0,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return DashedLine(
      length: length,
      thickness: thickness,
      color: color.withOpacity(0.5),
      dashPattern: [8, 4],
      direction: direction,
      margin: margin ?? const EdgeInsets.symmetric(vertical: 16),
      style: DashedLineStyle.rounded,
    );
  }
}

class DashedBorderLine extends StatelessWidget {
  final double length;
  final Color color;
  final double thickness;
  final List<double> dashPattern;

  const DashedBorderLine({
    Key? key,
    required this.length,
    this.color = Colors.blue,
    this.thickness = 2.0,
    this.dashPattern = const [10, 5],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DashedLine(
      length: length,
      thickness: thickness,
      color: color,
      dashPattern: dashPattern,
      style: DashedLineStyle.solid,
      borderRadius: 4,
    );
  }
}

class DashedProgressLine extends StatelessWidget {
  final double length;
  final Color color;
  final double progress; // 0.0 to 1.0

  const DashedProgressLine({
    Key? key,
    required this.length,
    this.color = Colors.green,
    this.progress = 0.5,
  })  : assert(progress >= 0.0 && progress <= 1.0,
  'Progress must be between 0.0 and 1.0'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background dashed line
        DashedLine(
          length: length,
          thickness: 3,
          color: Colors.grey[300]!,
          dashPattern: [5, 3],
        ),
        // Progress dashed line
        SizedBox(
          width: length * progress,
          child: DashedLine(
            length: length * progress,
            thickness: 3,
            color: color,
            dashPattern: [5, 3],
          ),
        ),
      ],
    );
  }
}