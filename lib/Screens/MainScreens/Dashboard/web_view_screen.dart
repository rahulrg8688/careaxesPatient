import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  String Id;
  String Path;
  String? Billed;
  String? RecieptId;
  bool? IsActive;
  String? Key;
  WebViewScreen({super.key,required this.Id,required this.Path,this.Billed,this.RecieptId,this.IsActive,this.Key});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  static final Url="https://uat.careaxes.net/#";
  late final WebViewController controller;
  String url='';


  @override
  void initState() {
    super.initState();
    if(widget.Id.isNotEmpty &&widget.IsActive==false && widget.Key=="Appointments"  ){
      url="${Url}/${widget.Path}/${widget.Id}/${widget.IsActive}";
    }
    else if(widget.Id.isNotEmpty && widget.Key=="Prescriptions"){
      url="${Url}/${widget.Path}/${widget.Billed}/${widget.Id}";
    }
    else if(widget.Billed==null && widget.RecieptId==null ){
      url="${Url}/${widget.Path}/${widget.Id}";
    }
    else if(widget.Billed!=null && widget.RecieptId==null){
      url="${Url}/${widget.Path}/${widget.Id}/${widget.Billed}";
    }
    else if(widget.Billed==null && widget.RecieptId!=null){
      url="${Url}/${widget.Path}/${widget.Id}-${widget.RecieptId}";
    }


    print("url is :: $url");
    setState(() {

    });
    print("lab reports Id is :: ${widget.Id}");
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted) // Enable JavaScript

      ..loadRequest(Uri.parse(url));

    // Additional WebView settings can be configured here
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("web view"),

      ),
      body: WebViewWidget(

        controller: controller,
      ),
    );
  }
}
