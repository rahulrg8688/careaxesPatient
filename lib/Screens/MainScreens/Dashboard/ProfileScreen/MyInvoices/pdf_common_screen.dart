import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PdfCommonScreen{
  String? text;
  IconData? DownloadIcon;
  String? ImageText;
  IconData? ViewIcon;
  VoidCallback? onDownload;
  VoidCallback? onView;

  PdfCommonScreen({String? text,IconData? DownloadIcon,String? ImageText,IconData? ViewIcon,VoidCallback? onDownload,VoidCallback? onView }){
    this.text=text;
    this.DownloadIcon=DownloadIcon;
    this.ImageText=ImageText;
    this.ViewIcon=ViewIcon;
    this.onView=onView;
    this.onDownload=onDownload;
  }

   Widget CommonWidget(BuildContext context){
     final size=MediaQuery.of(context).size;
     final height=size.height;
     final width=size.width;
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Container(
        width:width*0.123,//50,
        height:height*0.058,//50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Color(0xFFF6F6F6),
        ),
        child:
        Image.asset(this.ImageText!,
          color:Color(0xFFF6F6F6),
          colorBlendMode: BlendMode.darken,
        ),
    ),
          Text(this.text!),
          GestureDetector(
            onTap: onDownload,
            child: RoundedBox(

                this.DownloadIcon,context
            ),
          ),
          GestureDetector(
              onTap: onView,
              child: RoundedBox(this.ViewIcon,context)),
          

     ]
    );
  }
  Widget RoundedBox(IconData? Data,BuildContext context){
    final size=MediaQuery.of(context).size;
    final height=size.height;
    final width=size.width;
    return Container(
      height: height*0.037,//32,
      width:width*0.08,//32,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color:Color(0xFFE7F0FE),
      ),
      child: Center(
        child: Icon(Data,
        size:15,
          color:Color(0xFF2F80ED)
        ),
      ),
    );
  }
}
// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
//
// class DownloadFileExample extends StatefulWidget {
//   @override
//   _DownloadFileExampleState createState() => _DownloadFileExampleState();
// }
//
// class _DownloadFileExampleState extends State<DownloadFileExample> {
//   Dio dio = Dio();
//
//   Future<void> downloadFile(String url, String fileName) async {
//     try {
//       // Get the directory to save the file
//       Directory? directory = await getExternalStorageDirectory();
//
//       if (directory != null) {
//         String filePath = "${directory.path}/$fileName";
//
//         // Download the file
//         await dio.download(url, filePath);
//
//         // Show a success message
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('File downloaded to $filePath')),
//         );
//       }
//     } catch (e) {
//       // Handle the error
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Failed to download file: $e')),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: Text('Download PDF Example')),
//     body: Center(
//     child: ElevatedButton(
//     onPressed: () {
//     // Replace with your PDF URL and desired file name
//     String fileUrl = "https://example.com/sample.pdf";
//     String fileName = "sample.pdf";
//
//     downloadFile(fileUrl,
