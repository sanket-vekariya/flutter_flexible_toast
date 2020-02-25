import 'dart:async';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum Toast { LENGTH_SHORT, LENGTH_LONG }

enum ToastGravity { TOP, BOTTOM, CENTER }

enum ICON {
  CLOSE,
  ERROR,
  INFO,
  SUCCESS,
  WARNING,
  ALARM,
  LOCATION,
  DND,
  LOADING
}

class FlutterFlexibleToast {
  static const MethodChannel _channel =
      const MethodChannel('flutter_flexible_toast');

  static Future<bool> cancel() async {
    bool res = await _channel.invokeMethod("cancel");
    return res;
  }

  static Future<bool> showToast({
    @required String message,
    Toast toastLength,
    int timeInSeconds,
    double fontSize,
    ToastGravity toastGravity,
    Color backgroundColor,
    Color textColor,
    ICON icon,
    int radius,
    int elevation,
    int imageSize,
  }) async {
    String toast = "short";
    if (toastLength == Toast.LENGTH_LONG) {
      toast = "long";
    }
    String gravityToast = "bottom";
    if (toastGravity == ToastGravity.TOP) {
      gravityToast = "top";
    } else if (toastGravity == ToastGravity.CENTER) {
      gravityToast = "center";
    } else {
      gravityToast = "bottom";
    }

    String images;
    if (icon == ICON.CLOSE) {
      images = "close";
    } else if (icon == ICON.ERROR) {
      images = "error";
    } else if (icon == ICON.INFO) {
      images = "info";
    } else if (icon == ICON.SUCCESS) {
      images = "success";
    } else if (icon == ICON.WARNING) {
      images = "warning";
    } else if (icon == ICON.ALARM) {
      images = "alarm";
    } else if (icon == ICON.LOCATION) {
      images = "location";
    } else if (icon == ICON.DND) {
      images = "dnd";
    } else if (icon == ICON.LOADING) {
      images = "loading";
    } else {
      images = null;
    }

    if (backgroundColor == null) {
      backgroundColor = Colors.black;
    }
    if (textColor == null) {
      textColor = Colors.white;
    }

    if (imageSize == null) {
      imageSize = 25;
    }

    /**
     * mapped input here with method channel for native changes.
     */
    final Map<String, dynamic> parameters = <String, dynamic>{
      'message': message,
      'length': toast,
      'time': timeInSeconds != null ? timeInSeconds : 1,
      'gravity': gravityToast,
      'icon': images,
      'bgcolor': backgroundColor != null ? backgroundColor.value : Colors.black.value,
      'textcolor': textColor != null ? textColor.value : Colors.white.value,
      'fontSize': fontSize != null ? fontSize : 16.0,
      'radius': radius != null ? radius : 5,
      'elevation': elevation != null ? elevation : 5,
      'imageSize': imageSize != null ? imageSize : 25,
    };

    bool res = await _channel.invokeMethod('showToast', parameters);
    return res;
  }
}
