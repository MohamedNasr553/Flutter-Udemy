import 'package:flutter_app/modules/shop_app/login/LoginScreen.dart';
import 'package:flutter_app/shared/network/local/CacheHelper.dart';

import 'components.dart';

void printFullText(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}