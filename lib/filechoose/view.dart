import 'package:file_picker/file_picker.dart';
import 'package:filetranslator/filechoose/controller.dart';
import 'package:filetranslator/translateText/translate_text.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:translator/translator.dart';

class FileChooseView extends StatefulWidget {
  final conName1;
  final conName2;
  final conName3;
  final conName4;
  final bgColor;
  const FileChooseView({ Key? key, required this.conName1, required this.conName2, required this.conName3, required this.conName4, required this.bgColor }) : super(key: key);

  @override
  _FileChooseViewState createState() => _FileChooseViewState();
}

class _FileChooseViewState extends State<FileChooseView> {
  var pdfColor =Color.fromARGB(215, 214, 60, 60); 
  var docColor = Color.fromARGB(212, 69, 184, 238); 
  var txtColor = Color.fromARGB(213, 100, 241, 164);
  // var docxColor = Color.fromARGB(210, 24, 113, 135);
  var docxColor = Color.fromARGB(202, 34, 98, 141);
  

  var btnColor = Color.fromARGB(255, 121, 229, 236);

  PlatformFile? file;

  late String fileText;
  String fileName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.bgColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'File Translate',
          style: TextStyle(
            color: widget.bgColor==Color.fromARGB(255, 46, 59, 66)?Colors.white:Colors.black
          ),
        ),
        backgroundColor: widget.bgColor == Color.fromARGB(255, 46, 59, 66)?Color.fromARGB(255, 51, 69, 77) : Colors.white,
        toolbarHeight: 50,
        leadingWidth: 70,
        shadowColor: Colors.black,
        foregroundColor: widget.bgColor==Color.fromARGB(255, 46, 59, 66)?Colors.white:Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async {
                    file = await FileChooseController.getFile(widget.conName1 == 'PDF'?'pdf':'mp3');
                    setState(() {
                      btnColor = const Color.fromARGB(255, 121, 229, 236);
                      fileName = 'Reading Your File...';
                    });
                    fileText = await FileChooseController.returnFileText();
                    setState(() {
                      btnColor = Color.fromARGB(255, 3, 135, 243);
                      fileName = (file!.name);
                    });
                  },
                  child: Container(
                    width: 160,
                    height: 100,
                    decoration: BoxDecoration(
                      color: pdfColor,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.red.shade400,
                          offset: const Offset(0, 10),
                          blurRadius: 25,
                          spreadRadius: -5,
                        ),
                      ],
                      gradient:  LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.red.shade200,
                          Colors.red.shade300,
                          Colors.red.shade500,
                          Colors.red.shade500,
                        ],
                        stops: const [
                          0.1,
                          0.3,
                          0.9,
                          1.0
                        ]
                      )
                    ),
                    // color: pdfColor,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      height: 30,
                      width: 30,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Row(
                          children: [
                            SizedBox(width: 7,),
                            Image.asset(
                              widget.conName1=='PDF' ? 'assests/pdfLogo/pdfLogo.png': 'assests/mp3Logo/mp3Logo.png' ,
                              fit: BoxFit.contain,
                              ),
                              SizedBox(width: 20,),
                               Text(
                                widget.conName1,
                                style: const TextStyle(
                                  fontFamily: 'tahoma',
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600
                                ),
                                )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 25,),
                GestureDetector(
                   onTap: () async {
                    file = await FileChooseController.getFile(widget.conName2 == 'DOC'?'doc':'ogg');
                    setState(() {
                      btnColor = const Color.fromARGB(255, 121, 229, 236);
                      fileName = 'Reading Your File...';
                    });
                    fileText = await FileChooseController.returnFileText();
                    setState(() {
                      btnColor = Color.fromARGB(255, 3, 135, 243);
                      fileName = (file!.name);
                    });
                  },
                  child: Container(
                    width: 160,
                    height: 100,
                    decoration: BoxDecoration(
                      color: pdfColor,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.shade400,
                          offset: const Offset(0, 10),
                          blurRadius: 25,
                          spreadRadius: -5,
                        ),
                      ],
                      gradient:  LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.blue.shade200,
                          Colors.blue.shade300,
                          Colors.blue.shade500,
                          Colors.blue.shade500,
                        ],
                        stops: const [
                          0.1,
                          0.3,
                          0.9,
                          1.0
                        ]
                      )
                    ),
                    // color: pdfColor,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      height: 30,
                      width: 30,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              widget.conName2=='DOC'?'assests/docLogo/docLogo.png':'assests/wavLogo/wavLogo.png',
                              fit: BoxFit.contain,
                              ),
                              SizedBox(width: 20,),
                              Text(
                                widget.conName2,
                                style: const TextStyle(
                                  fontFamily: 'tahoma',
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600
                                ),
                              )
                          ],
                        ),
                      ),
                    ),
                  )
                ),
              ],
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                   onTap: () async {
                    file = await FileChooseController.getFile(widget.conName3 == 'TXT'?'txt':'wav');
                    setState(() {
                      btnColor = const Color.fromARGB(255, 121, 229, 236);
                      fileName = 'Reading Your File...';
                    });
                    fileText = await FileChooseController.returnFileText();
                    setState(() {
                      btnColor = Color.fromARGB(255, 3, 135, 243);
                      fileName = (file!.name);
                    });
                  },
                  child: Container(
                    width: 160,
                    height: 100,
                    decoration: BoxDecoration(
                      color: txtColor,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.teal.shade400,
                          offset: const Offset(0, 10),
                          blurRadius: 25,
                          spreadRadius: -5,
                        ),
                      ],
                      gradient:  LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.teal.shade200,
                          Colors.teal.shade200,
                          Colors.teal.shade400,
                          Colors.teal.shade400,
                        ],
                        stops: const [
                          0.1,
                          0.3,
                          0.9,
                          1.0
                        ]
                      )
                    ),
                    // color: pdfColor,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      height: 30,
                      width: 30,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Row(
                          children: [
                            Image.asset(
                              widget.conName3=='TXT'?'assests/txtLogo/txtLogo.png':'assests/oggLogo/oggLogo.png',
                              fit: BoxFit.contain,
                              ),
                              SizedBox(width: 20,),
                               Text(
                                widget.conName3,
                                style: const TextStyle(
                                  fontFamily: 'tahoma',
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600
                                ),
                                )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 25,),
                GestureDetector(
                   onTap: () async {
                    file = await FileChooseController.getFile(widget.conName4 == 'DOCX'?'docx':'mpeg');
                    setState(() {
                      btnColor = const Color.fromARGB(255, 121, 229, 236);
                      fileName = 'Reading Your File...';
                    });
                    fileText = await FileChooseController.returnFileText();
                    setState(() {
                      btnColor = Color.fromARGB(255, 3, 135, 243);
                      fileName = (file!.name);
                    });
                  },
                  child: Container(
                    width: 164,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.cyan.shade400,
                          offset: const Offset(0, 10),
                          blurRadius: 25,
                          spreadRadius: -5,
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
                    // color: pdfColor,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      // height: 30,
                      // width: 30,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Row(
                          children: [
                            Image.asset(
                              widget.conName4=='DOCX'?'assests/docxLogo/docxLogo.png':'assests/mpegLogo/mpegLogo.png',
                              fit: BoxFit.contain,
                              ),
                              SizedBox(width: 7,),
                              Text(
                                widget.conName4,
                                style: const TextStyle(
                                  fontFamily: 'tahoma',
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600
                                ),
                                )
                          ],
                        ),
                      ),
                    ),
                  ),
                )    
              ],
            ),
            const SizedBox(height: 30,),
            Text(
              fileName,
              style: TextStyle(
                fontFamily: 'Tahoma',
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: widget.bgColor==Color.fromARGB(255, 46, 59, 66)?Colors.white:Colors.black,
                  ),
            ),
            const SizedBox(height: 30,),
            GestureDetector(
              onTap: () async {
                final translator = GoogleTranslator();
                 Fluttertoast.showToast(
                  msg: "Please Wait",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Color.fromARGB(180, 37, 35, 34),
                  textColor: Colors.white,
                  fontSize: 16.0
                );
                var trans = await translator.translate(fileText,to: 'hi');
                Navigator.of(context).push(
                 MaterialPageRoute(builder: (BuildContext context) => TranslateText(fileText: fileText,translationText: trans.toString(),))
                );
              },
              child: Container(
                height: 70,
                width: 170,
                alignment: Alignment.center,
                child: const Text(
                  'Translate File',
                  style: TextStyle(
                    fontFamily: 'Tahoma',
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  ),
               decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.deepOrange.shade400,
                          offset: const Offset(0, 10),
                          blurRadius: 15,
                          spreadRadius: -5,
                        ),
                      ],
                      gradient:  LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.deepOrange.shade100,
                          Colors.deepOrange.shade200,
                          Colors.deepOrange.shade400,
                          Colors.deepOrange.shade400,
                        ],
                        stops: const [
                          0.1,
                          0.3,
                          0.9,
                          1.0
                        ]
                      )
                    ),
                    
              ),
            ),
          ],
        ),
      ),
    );
  }
}