import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../phone_s_m_s_page/phone_s_m_s_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PhoneSignPageWidget extends StatefulWidget {
  PhoneSignPageWidget({Key key}) : super(key: key);

  @override
  _PhoneSignPageWidgetState createState() => _PhoneSignPageWidgetState();
}

class _PhoneSignPageWidgetState extends State<PhoneSignPageWidget> {
  TextEditingController emailTextController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailTextController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment(0, -1),
              child: Image.network(
                'https://picsum.photos/seed/484/300',
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment(0, 0),
                    child: Container(
                      width: 0,
                      height: 0,
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 60, 0, 60),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Uygulama kullanım iznini alabilmeniz için telefon numaranızın doğrulanması gereklidir.',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.getFont(
                                  'Open Sans',
                                  fontSize: 14,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(4, 50, 0, 20),
                                child: Container(
                                  width: 300,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFE0E0E0),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(20, 1, 20, 0),
                                    child: TextFormField(
                                      controller: emailTextController,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: 'Telefon numaranızı giriniz',
                                        hintStyle: GoogleFonts.getFont(
                                          'Open Sans',
                                          color: Color(0xFF455A64),
                                          fontWeight: FontWeight.normal,
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                      ),
                                      style: GoogleFonts.getFont(
                                        'Open Sans',
                                        color: Color(0xFF455A64),
                                        fontWeight: FontWeight.normal,
                                      ),
                                      keyboardType: TextInputType.phone,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 50, 0, 20),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    if (emailTextController.text.isEmpty ||
                                        !emailTextController.text
                                            .startsWith('+')) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                              'Phone Number is required and has to start with +.'),
                                        ),
                                      );
                                      return;
                                    }
                                    await beginPhoneAuth(
                                      context: context,
                                      phoneNumber: emailTextController.text,
                                      onCodeSent: () async {
                                        await Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                PhoneSMSPageWidget(),
                                          ),
                                          (r) => false,
                                        );
                                      },
                                    );
                                  },
                                  text: 'Telefonumu Doğrula',
                                  options: FFButtonOptions(
                                    width: 300,
                                    height: 50,
                                    color: Color(0xFF0F2A58),
                                    textStyle: GoogleFonts.getFont(
                                      'Open Sans',
                                      color: Color(0xFFDEDEDE),
                                      fontSize: 16,
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 0,
                                    ),
                                    borderRadius: 25,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child: Text(
                                      'ÇokKolay2021',
                                      style: GoogleFonts.getFont(
                                        'Open Sans',
                                        color: Color(0xFFADADAD),
                                        fontSize: 14,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          Align(
                            alignment: Alignment(0, -0.65),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
                              child: Image.network(
                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/flutterflow_assets/ff_logo.png',
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
