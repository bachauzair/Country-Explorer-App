import 'dart:convert';

import 'package:http/http.dart' as http;




class StatesServices {

  Future<List<dynamic>> CountriesListApi () async {
    final response = await http.get(Uri.parse('https://restcountries.com/v3.1/all'));

    if(response.statusCode ==200){
      var data = jsonDecode(response.body.toString());
      return data;
    }else {
      throw Exception('Error');
    }
  }



}