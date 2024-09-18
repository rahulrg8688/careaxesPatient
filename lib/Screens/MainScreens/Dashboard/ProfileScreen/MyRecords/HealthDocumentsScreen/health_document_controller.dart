import 'dart:io';

import 'package:careaxes_patient/GetStorage/shared_prefs_service.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../ApiService/Api_service.dart';
import '../../../../../../Apicalls/Apis.dart';
import '../../../../../../ModelClass/CategoriesList.dart';
import '../../../../../../ModelClass/patient_uploaded_document.dart';
import '../../../web_view_screen.dart';

class HealthDocumentController extends GetxController{

File? _imgPath;
int index=0;

setImagePath(String path){
  _imgPath=File(path);
  update();
}

@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    GettingCategories();
    GetUploadedDocuments();

  }


void takeSnapshot(BuildContext context) async {
  final ImagePicker picker = ImagePicker();

  final XFile? img = await picker.pickImage(
    source: ImageSource.camera,
    maxWidth: 400,
  );
  if (img == null) return;

 _imgPath=File(img.path);
 update();
index=1;
update();
Get.back();
  Get.dialog(SecondDialog(context));
 print("Image path is ${_imgPath}");
}
ApiService apiService = ApiService.getInstance();
List<CategoriesList> categories=[];
Future<void> GettingCategories() async{
  var response=await apiService.getRequest(Apis.CategoriesListApiUploadDocument);
  if(response.statusCode==200){
    print("dropdown values are : ${response.data}");
    var responseBody=response.data as List;
    List<CategoriesList> data=responseBody.map((e)=>CategoriesList.fromJson(e)).toList();
    categories.addAll(data);

    update();
    print("categories is ${categories}");
  }
}
CategoriesList? selectedCategory;
Dialog SecondDialog(BuildContext context) {
  return Dialog(
    child: Container(
      height: 325,
      width: 340,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Upload Document"),
          SizedBox(height: 20), // Space between text and dropdown
          GetBuilder<HealthDocumentController>(
            builder: (controller) {
              return DropdownButtonFormField<CategoriesList>(
                value: controller.selectedCategory, // Initially selected value
                hint: Text("Select Category"),
                items: controller.categories.map((category) {
                  return DropdownMenuItem<CategoriesList>(
                    value: category,
                    child: Text(category.value.toString()), // Assuming `name` is a field in `CategoriesList`
                  );
                }).toList(),
                onChanged: (newValue) {
                  controller.selectedCategory = newValue!;
                  controller.update(); // Update the selected category
                  print("Selected category: ${newValue.value}");
                },
                isExpanded: true, // Makes the dropdown expand to full width
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                ),
              );
            },
          ),
          SizedBox(height: 20,),
          Container(
            height: 130,
            child:_imgPath!=null?Image.file(_imgPath!):Text("Upload again"),
          ),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
            ImageUpload();
          }, child:Text("Upload"))
        ],
      ),
    ),
  );
}

// For getting the file name

Future<void> ImageUpload() async {
  if (_imgPath == null || !_imgPath!.existsSync()) {
    print('File does not exist');
    return;
  }

  dio.Dio dioInstance = dio.Dio();

  // Create the form data with the image file
  // var formData = dio.FormData.fromMap({
  //   'UploadedBy': SharedPrefsService().GetAccountIdForPatient(),
  //   'PatientDocumentId': 1,
  //   'PatientId': SharedPrefsService().GetReferenceIdForPatient(),
  //   'DocumentName': "test",
  //   'DocumentType': selectedCategory,
  //   'Description': "test",
  //   'DocumentUrl': "",
  //   'ThumbnailUrl': "",
  //   'Size': "",
  //   // Correct way to upload a file with 'dio'
  //   'File': await dio.MultipartFile.fromFile(_imgPath!.path, filename: 'upload.jpg'),
  // });
  var formData={
    'UploadedBy':SharedPrefsService().GetAccountIdForPatient().toString(),
    'PatientDocumentId':"1",
    'PatientId':SharedPrefsService().GetReferenceIdForPatient().toString(),
    'DocumentName':"test",
    'DocumentType':selectedCategory!.value,
    'Description':"test",
    'DocumentUrl':"",
    'ThumbnailUrl':"",
    'Size':"",
    'File':await dio.MultipartFile.fromFile(_imgPath!.path, filename: 'upload.jpg', contentType: DioMediaType('image', 'jpeg')),
  };

  try {
    // Post the form data
    var response = await apiService.PostFormData(Apis.UploadFile, formData);

    if (response.statusCode == 200) {
      print("Response data is ${response.data}");
      Get.showSnackbar(
        GetSnackBar(
          title:("File uploaded successfully"),
          duration: const Duration(seconds: 2),


        )
      );
      Get.back();
      GetUploadedDocuments();

    } else {
      print('Error: ${response.statusCode}');
    }
  } catch (e) {
    print('Error uploading file: $e');
  }
}
List<UploadedDocument> uploadedPatientData=[];

Future<void> GetUploadedDocuments() async{

  var response=await apiService.postRequest(Apis.GetUploadedDoc,{
    "patientId":SharedPrefsService().GetReferenceIdForPatient()
  });
  if(response.statusCode==200){
    print("response data is ${response.data}");
    var responseBody=response.data as List;
    List<UploadedDocument> data=responseBody.map((e)=>UploadedDocument.fromJson(e)).toList();
    uploadedPatientData.addAll(data);
    print("UploadedPatient is ${uploadedPatientData.length}");


  }
  else{
    print("response status is ${response.statusCode}");
    print("response is ${response.data}");
  }

}

  navigateToLabBookDetail(String EncryptedLabId){
    print("sending data is :: $EncryptedLabId");
    Get.to(()=>WebViewScreen(Path:'new-lab-reports',Id: EncryptedLabId));
  }


// Future<void> ImageUpload() async{
//   var formData={
//     'UploadedBy':SharedPrefsService().GetAccountIdForPatient(),
//     'PatientDocumentId':1,
//     'PatientId':SharedPrefsService().GetReferenceIdForPatient(),
//     'DocumentName':"test",
//     'DocumentType':selectedCategory,
//     'Description':"test",
//     'DocumentUrl':"",
//     'ThumbnailUrl':"",
//     'Size':"",
//     'File':await MultipartFile.fromFile(_imgPath!.path, filename: 'upload.jpg'),
//   };
//   var response=await apiService.PostFormData(Apis.UploadFile,formData);
//   if(response.statusCode==200){
//     print("Responsed data is ${response.data}");
//   }
// }

@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
 index=0;
  }

}