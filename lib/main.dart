import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pier/app.dart';

main() async {
  await dotenv.load(fileName: ".env");
  runApp(const App());
}
