import 'package:flutter/material.dart';

extension Log<T> on T {
  T get log {
    debugPrint(toString());
    return this;
  }
}
