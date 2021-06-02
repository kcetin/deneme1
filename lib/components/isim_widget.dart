import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IsimWidget extends StatefulWidget {
  IsimWidget({Key key}) : super(key: key);

  @override
  _IsimWidgetState createState() => _IsimWidgetState();
}

class _IsimWidgetState extends State<IsimWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: Text(
        'Hello World',
        style: FlutterFlowTheme.bodyText1.override(
          fontFamily: 'Poppins',
          fontSize: 20,
        ),
      ),
    );
  }
}
