import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClass {
  static const _urlBase = 'https://pokeapi.co/api/v2';

  static Future httpGet(String path) async{
    try {
      final resp = await http.get(Uri.parse("$_urlBase/$path"));
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