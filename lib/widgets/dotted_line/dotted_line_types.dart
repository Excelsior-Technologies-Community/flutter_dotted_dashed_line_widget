import 'package:flutter/material.dart';
import 'package:flutter_dotted_dashed_line_widget/widgets/dotted_line/dotted_line_widget.dart';

enum DottedLineStyle {
  solid,
  rounded,
}

// Pre-configured DottedLine widgets
class DottedLineDivider extends StatelessWidget {
  final double length;
  final Axis direction;
  final Color color;
  final double strokeWidth;

  const DottedLineDivider({
    Key? key,
    required this.length,
    this.direction = Axis.horizontal,
    this.color = Colors.grey,
    this.strokeWidth = 1.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedLine(
      length: length,
      strokeWidth: strokeWidth,
      color: color.withOpacity(0.6),
      dashLength: 4.0,
      dashSpacing: 3.0,
      direction: direction,
      style: DottedLineStyle.rounded,
    );
  }
}

class DottedLineSeparator extends StatelessWidget {
  final Color color;
  final Axis direction;

  const DottedLineSeparator({
    Key? key,
    this.color = Colors.grey,
    this.direction = Axis.horizontal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final length = direction == Axis.horizontal
            ? constraints.maxWidth
            : constraints.maxHeight;

        return DottedLineDivider(
          length: length,
          direction: direction,
          color: color,
        );
      },
    );
  }
}