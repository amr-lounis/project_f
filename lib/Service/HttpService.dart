import 'dart:async';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

Future<String> sendRequest({String url,Map map})async{
  String response = "";
  try {
    final duration = const Duration(seconds: 10);
    final request = map == null ? await http.get(url).timeout(duration): await http.post(url,body: convert.jsonEncode(map)).timeout(duration) ;
    if (request.statusCode == 200) { response = request.body.toString(); }
    else { print("Request failed with status code: ${request.statusCode}."); }
  }catch( e ){ print(e.toString()); }
  return response;
}

getIntValueFromJsonString(String p_string_input,String p_key){
  try{
    final Map<String,dynamic> responseData = convert.jsonDecode(p_string_input);
    final itemCount = responseData[p_key];
    return itemCount;
  }catch( e ){ print(e.toString());return -1; }
}