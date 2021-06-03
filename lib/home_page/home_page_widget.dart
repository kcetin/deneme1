import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: StreamBuilder<List<AydinKadinDogumRecord>>(
          stream: queryAydinKadinDogumRecord(
            queryBuilder: (aydinKadinDogumRecord) =>
                aydinKadinDogumRecord.orderBy('isim'),
            singleRecord: true,
          ),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            List<AydinKadinDogumRecord> listViewAydinKadinDogumRecordList =
                snapshot.data;
            // Customize what your widget looks like with no query results.
            if (snapshot.data.isEmpty) {
              // return Container();
              // For now, we'll just include some dummy data.
              listViewAydinKadinDogumRecordList =
                  createDummyAydinKadinDogumRecord(count: 1);
            }
            final listViewAydinKadinDogumRecord =
                listViewAydinKadinDogumRecordList.first;
            return ListView(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              children: [],
            );
          },
        ),
      ),
    );
  }
}
