import 'dart:ui' as ui;
import 'package:flutter/material.dart';

extension OffsetDirectionality on Offset {
  Offset withDirectionality(BuildContext context) {
    if (Directionality.of(context) == ui.TextDirection.rtl) {
      return Offset(-dx, dy);
    } else {
      return this;
    }
  }
}

extension AlignmentConverter on AlignmentDirectional {
  Alignment toAlignment() {
    return Alignment(start, y);
  }
}

extension AlignmentDirectionality on Alignment {
  Alignment withDirectionality(BuildContext context) {
    if (Directionality.of(context) == ui.TextDirection.rtl) {
      return Alignment(-x, y);
    } else {
      return this;
    }
  }
}
