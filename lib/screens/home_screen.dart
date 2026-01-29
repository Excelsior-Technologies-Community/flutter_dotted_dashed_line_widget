import 'package:flutter/material.dart';
import 'package:flutter_dotted_dashed_line_widget/widgets/dashed_line/dashed_line_types.dart';
import 'package:flutter_dotted_dashed_line_widget/widgets/dashed_line/dashed_line_widget.dart';
import 'package:flutter_dotted_dashed_line_widget/widgets/dotted_line/dotted_line_widget.dart';

class DemoScreen extends StatelessWidget {
  DemoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dotted / Dashed Line '),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionTitle('📏 Dotted Lines'),

            _exampleCard(
              'Simple Horizontal Dotted Line',
              DottedLine(
                length: 300,
                strokeWidth: 2,
                color: Colors.blue,
                dashLength: 10,
                dashSpacing: 5,
              ),
            ),

            _exampleCard(
              'Vertical Dotted Line',
              DottedLine(
                length: 120,
                direction: Axis.vertical,
                strokeWidth: 2,
                color: Colors.red,
                dashLength: 8,
                dashSpacing: 4,
              ),
            ),

            _sectionTitle('⚡ Dashed Lines'),

            _exampleCard(
              'Basic Dashed Line',
              DashedLine(
                length: 300,
                thickness: 2,
                color: Colors.green,
                dashPattern: [15, 10],
              ),
            ),

            _exampleCard(
              'Custom Dash Pattern',
              DashedLine(
                length: 300,
                thickness: 3,
                color: Colors.purple,
                dashPattern: [20, 5],
              ),
            ),

            _exampleCard(
              'Rounded Dashed Line',
              DashedLine(
                length: 300,
                thickness: 3,
                color: Colors.orange,
                style: DashedLineStyle.rounded,
                dashPattern: [12, 6],
              ),
            ),

            _sectionTitle('🎨 Mixed Styles'),

            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 2,
              children: [
                _styleTile(
                  'Gray Dotted',
                  DottedLine(length: 100, color: Colors.grey),
                ),
                _styleTile(
                  'Blue Thick',
                  DottedLine(length: 100, strokeWidth: 3, color: Colors.blue),
                ),
                _styleTile(
                  'Red Dashed',
                  DashedLine(length: 100, color: Colors.red, dashPattern: [3, 3]),
                ),
                _styleTile(
                  'Green Dash',
                  DashedLine(length: 100, color: Colors.green, dashPattern: [10, 2]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- UI helpers ----------------

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget _exampleCard(String title, Widget child) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Center(child: child),
          ],
        ),
      ),
    );
  }

  Widget _styleTile(String title, Widget line) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          line,
        ],
      ),
    );
  }
}
