import 'dart:convert';
import 'package:crud/Style/style.dart';
import 'package:http/http.dart' as http;

Future<List> GridViewRequest() async {
   var URL = Uri.parse("https://crud.teamrabbil.com/api/v1/ReadProduct");
   var RequestHeader={'Content-Type' : 'application/json'};

   var response=await http.get(URL,headers: RequestHeader);
   var RequestCode =response.statusCode;
   var RequestBody=json.decode(response.body);

   if(RequestCode==200 && RequestBody["status"]=="success"){
     SuccessMessage("Submit successfuly");
     return RequestBody['data'];
   }
   else{
     ErrorMessage("Failed !! try again");
     return [];
   }
}
Future<bool> RestApniSubmit(FromsValue) async{

  var URL=Uri.parse("https://crud.teamrabbil.com/api/v1/CreateProduct");
  var Header={'Content-Type' : 'application/json'};
  var BodySection=json.encode(FromsValue);

  var response=await http.post(URL,headers: Header,body: BodySection);

  var ResultCode=response.statusCode;
  var BodyStatus=json.decode(response.body);

  if(ResultCode==200 && BodyStatus["status"]=="success"){
     SuccessMessage("Request Success");
     return true;
  }
  else{
    ErrorMessage("Failed !! try again");
    return false;
  }
}

Future<bool> RequestDelete(id) async{
  var URL =Uri.parse("https://crud.teamrabbil.com/api/v1/DeleteProduct/"+id);
  var RequestHeaders={"Content-Type" :"application/json"};

  var response=await http.get(URL,headers: RequestHeaders);

  var RequestStatus=response.statusCode;
  var RequestBody= json.decode(response.body);

  if(RequestStatus==200 && RequestBody['status']=='success'){
     SuccessMessage("Request success");
     return true;
  }
  else{
    ErrorMessage("failed! try again");
    return false;
  }
}

Future<bool> RestUpdateSubmit(FromsValue,id) async{

  var URL=Uri.parse("https://crud.teamrabbil.com/api/v1/UpdateProduct/"+id);
  var Header={'Content-Type' : 'application/json'};
  var BodySection=json.encode(FromsValue);

  var response=await http.post(URL,headers: Header,body: BodySection);

  var ResultCode=response.statusCode;
  var BodyStatus=json.decode(response.body);

  if(ResultCode==200 && BodyStatus["status"]=="success"){
    SuccessMessage("Request Success");
    return true;
  }
  else{
    ErrorMessage("Failed !! try again");
    return false;
  }
}