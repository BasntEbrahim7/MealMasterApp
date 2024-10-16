import 'package:mealmasterapp/src/app_root.dart';
import 'package:flutter/material.dart';

import 'data/app_repo/Dio_halper.dart';

void main() {
  DioHelper.init();
  runApp(AppRoot());
}
