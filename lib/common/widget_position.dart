import 'package:flutter/material.dart';

Offset getWidgetAbsolutePositionByKey(GlobalKey key) =>
    (key.currentContext.findRenderObject() as RenderBox)
        .localToGlobal(Offset.zero);
