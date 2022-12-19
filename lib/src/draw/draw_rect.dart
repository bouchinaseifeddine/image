import 'dart:math';

import '../color/color.dart';
import '../image/image.dart';
import 'draw_line.dart';

/// Draw a rectangle in the image [dst] with the [color].
Image drawRect(Image dst, int x1, int y1, int x2, int y2, Color color,
    { num thickness = 1 }) {
  final x0 = min(x1, x2);
  final y0 = min(y1, y2);
  x1 = max(x1, x2);
  y1 = max(y1, y2);

  final ht = thickness / 2;

  drawLine(dst, x0, y0, x1, y0, color, thickness: thickness);
  drawLine(dst, x0, y1, x1, y1, color, thickness: thickness);

  final isEvenThickness = (ht - ht.toInt()) == 0;
  final dh = isEvenThickness ? 1 : 0;

  final _y0 = (y0 + ht).ceil();
  final _y1 = ((y1 - ht) - dh).floor();
  final _x0 = (x0 + ht).floor();
  final _x1 = ((x1 - ht) + dh).ceil();

  drawLine(dst, _x0, _y0, _x0, _y1, color, thickness: thickness);
  drawLine(dst, _x1, _y0, _x1, _y1, color, thickness: thickness);

  return dst;
}
