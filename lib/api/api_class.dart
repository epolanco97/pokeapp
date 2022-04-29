import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClass {
  static const _urlBase = 'https://pokeapi.co/api/v2';

  static Future httpGet(String path, [int? limit, int? offset]) async{
    String urlToParse = '';
    if (limit != null || offset != null) {
      urlToParse = path;
    } else if(limit == null && offset != null){
      urlToParse = "$path?offset=$offset";
    } else if(limit != null && offset == null){
      urlToParse = "$path?limit=$limit";
    } else{
      urlToParse = "$path?limit=$limit&offset=$offset";
    }
    try {
      final resp = await http.get(Uri.parse("$_urlBase/$urlToParse"));
      return jsonDecode(resp.body);
    } catch (e) {
      throw 'Error al intentar hacer una peticion GET: $e';
    }
  }
  
  static Future httpGetWithoutBase(String path) async{
    try {
      final resp = await http.get(Uri.parse(path));
      return jsonDecode(resp.body);
    } catch (e) {
      throw 'Error al intentar hacer una peticion GET: $e';
    }
  }
}