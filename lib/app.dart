import 'dart:convert';
import 'package:cron/cron.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pier/report.dart';
import 'package:pier/theme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final Cron cron = Cron();
  Map _state = {};
  bool loading = true;

  @override
  initState() {
    super.initState();
    cron.schedule(Schedule.parse('*/10 * * * * *'), () async {
      _onRefresh();
    });
    _onRefresh();
  }

  @override
  dispose() {
    cron.close();
    super.dispose();
  }

  _onRefresh() async {
    try {
      setState(() {
        loading = true;
      });
      Uri uri = Uri.parse(dotenv.env['SERVER'] ?? 'http://localhost:8000');
      final response = await http.get(uri);
      Map state = json.decode(response.body);
      setState(() {
        loading = false;
        _state = state;
      });
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pier',
      theme: themeData,
      home: Scaffold(
        body: Report(state: _state),
      ),
    );
  }
}
