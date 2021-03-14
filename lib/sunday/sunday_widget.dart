import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SundayWidget extends StatefulWidget {
  SundayWidget({Key key}) : super(key: key);

  @override
  _SundayWidgetState createState() => _SundayWidgetState();
}

class _SundayWidgetState extends State<SundayWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
    );
  }
}
