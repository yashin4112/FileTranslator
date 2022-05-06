import 'package:filetranslator/filechoose/view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({ Key? key }) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  var bgColor = Colors.white;
  var themeIcon = Icons.dark_mode_outlined;
  var themeIconColor = Color.fromARGB(255, 0, 0, 0);
  var appBarColor = Colors.white;

  final PageStorageBucket bucket = PageStorageBucket();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        leading: Icon(
          Icons.translate_outlined,
          color: themeIconColor,
          ),
        title: Row(
          children: [
            Spacer(),
            Text(
            'Translator',
            style: TextStyle(
              fontFamily: 'tahoma',
              color: themeIconColor,
              ),
            ),
            Spacer(),
            GestureDetector(
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  // color: Color.fromARGB(255, 238, 8, 8),
                ),
                child: Icon(
                  themeIcon,
                  color: themeIconColor,
                  )
              ),
              onTap: (){
                setState(() {
                  themeIcon = themeIcon == Icons.light_mode_outlined ? Icons.dark_mode_outlined:Icons.light_mode_outlined;
                  themeIconColor = themeIconColor ==Color.fromARGB(255, 0, 0, 0)?Color.fromARGB(255, 245, 243, 243):Color.fromARGB(255, 0, 0, 0);
                  appBarColor = appBarColor == Colors.white?Colors.blueGrey.shade600:Colors.white;
                  bgColor = bgColor == Colors.white ? Color.fromARGB(255, 46, 59, 66): Colors.white;
                });
              }
            ),
          ],
        ),
        backgroundColor: appBarColor,
        shadowColor: Color.fromARGB(255, 34, 32, 32),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Spacer(),
            Container(
              width: 530,
              height: 530,
              child: Image.asset(
                bgColor == Colors. white ? 'assests/mainLogo/lightLogo.png': 'assests/mainLogo/darkLogo.png'),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                
                children: [
                  GestureDetector(
                    child: Column(
                      children: [
                        Container(
                          transformAlignment: Alignment.center,
                          alignment: Alignment.center,
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 167, 180, 235),
                            borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.deepOrange.shade400,
                                    offset: const Offset(0, 10),
                                    blurRadius: 25,
                                    spreadRadius: -5,
                                  ),
                                ],
                                gradient:  LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.deepOrange.shade200,
                                    Colors.deepOrange.shade300,
                                    Colors.deepOrange.shade500,
                                    Colors.deepOrange.shade500,
                                  ],
                                  stops: const [
                                    0.1,
                                    0.3,
                                    0.9,
                                    1.0
                                  ]
                                )
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.file_upload_outlined,
                                size: 50.0,  
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ],
                          )
                        ),
                        const SizedBox(height: 20,),
                        Text(
                            'Document',
                            style: TextStyle(
                            fontFamily: 'tahoma',
                            fontSize: 20,
                            color: bgColor==Color.fromARGB(255, 46, 59, 66)?Colors.white:Colors.black
                            ),
                          )
                      ],
                    ),
                    onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) => FileChooseView(conName1: 'PDF',conName2: 'DOC',conName3:'TXT',conName4: 'DOCX',bgColor: bgColor,))
                        );
                    },
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => FileChooseView(conName1: 'MP3',conName2: 'WAV',conName3:'OGG',conName4: 'FLAC',bgColor: bgColor,)));
                    },
                    child: Column(
                      children: [
                        Container(
                          transformAlignment: Alignment.center,
                          alignment: Alignment.center,
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.lightBlue.shade400,
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.lightBlue.shade400,
                                offset: const Offset(0, 10),
                                blurRadius: 25,
                                spreadRadius: -5,
                              ),
                            ],
                            gradient:  LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.lightBlue.shade200,
                                Colors.lightBlue.shade300,
                                Colors.lightBlue.shade500,
                                Colors.lightBlue.shade500,
                              ],
                              stops: const [
                                0.1,
                                0.3,
                                0.9,
                                1.0
                              ]
                            )
                          ),
                          child: const Icon(
                            Icons.mic_none_outlined,
                            size: 50.0,  
                            color: Color.fromARGB(255, 255, 255, 255),
                          )
                        ),
                       const SizedBox(height: 20,),
                        Text(
                            'Audio',
                            style: TextStyle(
                            fontFamily: 'tahoma',
                            fontSize: 20,
                            color: bgColor==Color.fromARGB(255, 46, 59, 66)?Colors.white:Colors.black
                            ),
                          )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}