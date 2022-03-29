import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:pdf_text/pdf_text.dart';

class FileChooseController {
  static File? file;
    static late PlatformFile platformFile;
    static PDFDoc? pdfdoc;
    static FilePickerResult? filePickerResult;
 
 static Future<PlatformFile> getFile(String extension) async {
    List<String>? extensionList= [extension];
     filePickerResult =  await FilePicker.platform.pickFiles(
       type: FileType.custom,
       allowedExtensions: extensionList,
     );
    platformFile = filePickerResult!.files.first;
    return platformFile;
  }

  static Future<String> returnFileText() async {
    String data;
    if (platformFile.extension == 'pdf') {
      PDFDoc doc = await PDFDoc.fromPath((filePickerResult!.files.single.path) as String);
      data = await doc.text;
      
    } else if(platformFile.extension == 'txt') {
      File file = File((filePickerResult!.files.single.path) as String);
      data = await file.readAsString();
    }
    else if(platformFile.extension == 'doc'){
      File file = File((filePickerResult!.files.single.path) as String);
      data = await file.readAsString();
      print(data);
    }

    else{
      data = '';
    }
    
    return data;
  }
}