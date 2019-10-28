import 'dart:async';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

Future<String> sendRequest({String pUrl,String pBody})async{
  String response = "";
  try {
    final duration = const Duration(seconds: 10);
    final request = pBody == null ? await http.get(pUrl).timeout(duration): await http.post(pUrl,body: pBody).timeout(duration) ;
    if (request.statusCode == 200) { response = request.body.toString(); }
    else { throw Exception ("Request failed with status code: ${request.statusCode}."); }
  }catch( e ){ print(e.toString()); response = null;}
  return response;
}

getIntValueFromJsonString(String p_string_input,String p_key){
  try{
    final Map<String,dynamic> responseData = convert.jsonDecode(p_string_input);
    final itemCount = responseData[p_key];
    return itemCount;
  }catch( e ){ print(e.toString());return -1; }
}