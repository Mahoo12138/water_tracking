import 'dart:io';
import 'package:flutter/foundation.dart';

bool isAndroid() {
  return !kIsWeb && Platform.isAndroid;
}

bool isIOS() {
  return !kIsWeb && Platform.isIOS;
}

bool isWeb() {
  return kIsWeb;
}

bool isDesktop() {
  return !kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux);
}
