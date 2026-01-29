# DottedDashedLineWidget

A simple and reusable Dotted / Dashed Line Widget for Flutter applications.
This widget supports horizontal & vertical lines, dotted & dashed styles, and is built using CustomPainter for smooth rendering.

⚡ Currently implemented as a simple Flutter project widget
🚀 Can be easily converted into a Flutter package later

---
## ✨ Features

* ✅ Dotted line
* ✅ Dashed line
* ✅ Horizontal & Vertical direction
* ✅ Rounded & Square line caps
* ✅ Fully customizable (color, thickness, spacing)
* ✅ Lightweight & performant
* ✅ No third-party dependency

---
## ✨ Preview
![screen-20260129-1730542](https://github.com/user-attachments/assets/6eee4f71-b9ea-4843-9140-6fefee32efe7)

---
## ✨ Installation
Add this to your package's pubspec.yaml file:
```
dependencies:
  flutter_dotted_dashed_line_widgets:
    path: ../flutter_dotted_dashed_line_widgets  # For local development
```
from git:
```
dependencies:
  flutter_dotted_dashed_line_widgets:
    git:
      url: https://github.com/yourusername/flutter_dotted_dashed_line_widgets.git  # Your github path
``` 
Then run:
```
flutter pub get
```
---

## 📂 Project Structure
```
lib/
 ├── main.dart
 ├── widgets/
 │    └── dotted_dashed_line/
 │    │     ├── dotted_dashed_line.dart
 │    │     └── dotted_dashed_line_types.dart
 │    │
 │     └── dashed_line/
 │           ├── dashed_line_types.dart
 │           └── dashed_line_widgets.dart
 │
 ├── screens/
       └── home_screen.dart
```
## 🔧 Line Types & Styles
#### Line Types
```
enum LineType {
  dashed,
  dotted,
}

```
#### Line Cap Styles
```
enum LineCapStyle {
  square,
  round,
}

```
---
## 🧩 DottedDashedLine Widget
#### Constructor
```
DottedDashedLine({
  required double length,
  double thickness = 2,
  Color color = Colors.grey,
  Axis direction = Axis.horizontal,
  LineType lineType = LineType.dashed,
  LineCapStyle capStyle = LineCapStyle.square,
  double dashLength = 6,
  double dashGap = 4,
});

```
---
## 🚀 Usage Examples
#### 1️⃣ Dashed Horizontal Line
```
DottedDashedLine(
  length: 300,
  lineType: LineType.dashed,
  color: Colors.blue,
);

```
#### 2️⃣ Dotted Horizontal Line (Rounded)
```
DottedDashedLine(
  length: 300,
  lineType: LineType.dotted,
  capStyle: LineCapStyle.round,
  thickness: 3,
  color: Colors.red,
);

```
#### 3️⃣ Vertical Dotted Line
```
DottedDashedLine(
  length: 150,
  direction: Axis.vertical,
  lineType: LineType.dotted,
  color: Colors.green,
);

```
---
## ⚙ Customization Guide
| Property     | Description              |
| ------------ | ------------------------ |
| `length`     | Total length of the line |
| `thickness`  | Line thickness           |
| `color`      | Line color               |
| `direction`  | Horizontal or Vertical   |
| `lineType`   | Dotted or Dashed         |
| `capStyle`   | Rounded or Square ends   |
| `dashLength` | Dash size (for dashed)   |
| `dashGap`    | Space between dashes     |

---
