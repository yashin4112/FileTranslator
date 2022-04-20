
import 'package:decorated_icon/decorated_icon.dart';
import 'package:filetranslator/filechoose/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:translator/translator.dart';

class TranslateText extends StatefulWidget {

  String fileText;
  String translationText;
  String sourceLang;
  TranslateText({ Key? key, required this.fileText, required this.translationText, required this.sourceLang}) : super(key: key);

  @override
  State<TranslateText> createState() => _TranslateTextState();
}

class _TranslateTextState extends State<TranslateText> {

  final translator = GoogleTranslator();
  FlutterTts flutterTts = FlutterTts();
  String lang = '';
  @override
  void initState() {
    if (widget.sourceLang =='HINDI') {
      setState(() {
        // lang = 'HI-IN';s
      });
    } else {
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
    backgroundColor: Colors.blueGrey.shade900,
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children:[
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(8.0),
                    height: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.cyan.shade400,
                        ),
                      ],
                      gradient:  LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.cyan.shade100,
                          Colors.cyan.shade200,
                          Colors.cyan.shade600,
                          Colors.cyan.shade600,
                        ],
                        stops: const [
                          0.1,
                          0.3,
                          0.9,
                          1.0
                        ]
                      )
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Spacer(),
                              GestureDetector(
                                onTap: (()async {
                                  Fluttertoast.showToast(msg: 'Start');
                                  await flutterTts.setLanguage('mr-IN');
                                  await flutterTts.setPitch(1);
                                  await flutterTts.speak(widget.fileText);
                                }),
                                child: DecoratedIcon(
                                  Icons.volume_up_outlined,
                                  shadows: [
                                    BoxShadow(
                                      color: Colors.grey.shade800,
                                      offset: Offset(-3.0, 3.0),
                                      blurRadius: 8,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 20,),
                              GestureDetector(
                                onTap: (() {
                                  Clipboard.setData(ClipboardData(text: widget.fileText));
                                  Fluttertoast.showToast(
                                    msg: "File Text Copied",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Color.fromARGB(180, 37, 35, 34),
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                  );
                                }),
                                child: DecoratedIcon(
                                  Icons.copy_outlined,
                                  // color: Colors.orange,
                                  shadows: [
                                    BoxShadow(
                                      color: Colors.grey.shade800,
                                      offset: Offset(-3.0, 3.0),
                                      blurRadius: 8,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Text(
                            widget.fileText,
                            style: const TextStyle(
                              fontFamily: 'tahoma',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(8.0),
                    height: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.lightBlue.shade400,
                        ),
                      ],
                      gradient:  LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.lightBlue.shade100,
                          Colors.lightBlue.shade200,
                          Colors.lightBlue.shade600,
                          Colors.lightBlue.shade600,
                        ],
                        stops: const [
                          0.1,
                          0.3,
                          0.9,
                          1.0
                        ]
                      )
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Spacer(),
                              GestureDetector(
                                onTap: (() async {
                                  await flutterTts.setLanguage('en-IN');
                                  await flutterTts.setPitch(1);
                                  await flutterTts.speak(widget.translationText);
                                }),
                                child: DecoratedIcon(
                                  Icons.volume_up_outlined,
                                  shadows: [
                                    BoxShadow(
                                      color: Colors.grey.shade800,
                                      offset: Offset(-3.0, 3.0),
                                      blurRadius: 8,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 20,),
                              GestureDetector(
                                onTap: (() {
                                  Clipboard.setData(ClipboardData(text: widget.translationText));
                                   Fluttertoast.showToast(
                                    msg: "Translation Copied",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Color.fromARGB(180, 37, 35, 34),
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                  );
                                }),
                                child: DecoratedIcon(
                                  Icons.copy_outlined,
                                  // color: Colors.orange,
                                  shadows: [
                                    BoxShadow(
                                      color: Colors.grey.shade800,
                                      offset: Offset(-3.0, 3.0),
                                      blurRadius: 8,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Text(
                            widget.translationText,
                            style: const TextStyle(
                              fontFamily: 'tahoma',
                            ),
                          ),
                        ],
                      )
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}