import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MondayWidget extends StatefulWidget {
  MondayWidget({Key key}) : super(key: key);

  @override
  _MondayWidgetState createState() => _MondayWidgetState();
}

class _MondayWidgetState extends State<MondayWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
    );
  }
}
