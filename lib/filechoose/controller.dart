import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
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
    else if(platformFile.extension == 'docx'){
      var uri = Uri(
        scheme: 'https',
        host: 'docx-api.herokuapp.com',
        path: '/docx-read',
      );
      var request = http.MultipartRequest('POST',uri);
      var file = await http.MultipartFile.fromPath('file', platformFile.path.toString());
      request.files.add(file);
      var streamResponse = await request.send();
      var response = await http.Response.fromStream(streamResponse);
      var body = {};
      body = jsonDecode(response.body);
      data = body['filetext'];
    }
    else{
      data = '';
    }
    
    return data;
  }

  static Future<String> returnAudioText(String src) async {
    String data;
    String source;
    if (src=='HINDI') {
      source = 'hi-IN_Telephony';
    } 
    else if(src=='CHINEESE'){
      source='zh-CN_Telephony';
    }
    else if (src=='SPANISH'){
      source = 'es-MX_BroadbandModel';
    }
    else{
      source = 'en-IN_Telephony';
    }

    var uri = Uri(
      scheme: 'https',
      host: 'audiorecog-api.herokuapp.com',
      path: '/audio-upload',
      queryParameters: {
        'media-type':'audio/'+platformFile.extension.toString(),
        'sourceLanguage': source.toString()
      }
    );

    print(uri);

    var request = http.MultipartRequest('POST',uri);
    var file = await http.MultipartFile.fromPath('file', platformFile.path.toString());
    request.files.add(file);
    var streamResponse = await request.send();
    var response = await http.Response.fromStream(streamResponse);
    var body = {};
    body = jsonDecode(response.body);
    data = body['Audio Text'];
    return data;
  }

}