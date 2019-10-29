import 'dart:async';
import 'package:http/http.dart' as http;

Future<String> post({String pUrl,String pBody})async{
  String response = "";
  try {
    final duration = const Duration(seconds: 10);
    final request = await http.post(pUrl,body: pBody).timeout(duration) ;

    if (request.statusCode == 200) { response = request.body.toString(); }
    else { throw Exception ("Request failed with status code: ${request.statusCode}."); }
  }catch( e ){ print(e.toString()); response = null;}
  return response;
}
////////////////////////////////////////////////////////////////////////////////
Future<String> put({String pUrl,String pBody})async{
  String response = "";
  try {
    final duration = const Duration(seconds: 10);
    final request = await http.post(pUrl,body: pBody).timeout(duration) ;

    if (request.statusCode == 200) { response = request.body.toString(); }
    else { throw Exception ("Request failed with status code: ${request.statusCode}."); }
  }catch( e ){ print(e.toString()); response = null;}
  return response;
}
////////////////////////////////////////////////////////////////////////////////
Future<String> get({String pUrl})async{
  String response = "";
  try {
    final duration = const Duration(seconds: 10);
    final request = await http.get(pUrl).timeout(duration);

    if (request.statusCode == 200) { response = request.body.toString(); }
    else { throw Exception ("Request failed with status code: ${request.statusCode}."); }
  }catch( e ){ print(e.toString()); response = null;}
  return response;
}
////////////////////////////////////////////////////////////////////////////////
Future<String> delete({String pUrl})async{
  String response = "";
  try {
    final duration = const Duration(seconds: 10);
    final request = await http.delete(pUrl).timeout(duration);

    if (request.statusCode == 200) { response = request.body.toString(); }
    else { throw Exception ("Request failed with status code: ${request.statusCode}."); }
  }catch( e ){ print(e.toString()); response = null;}
  return response;
}
