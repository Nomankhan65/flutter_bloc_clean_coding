import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc_clean_coding/config/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

import '../exceptions/app_exceptions.dart';

class NetworkApiService extends BaseApiServices{

  @override
  Future<dynamic> getApi(String url)async{
    dynamic jsonResponse;

    try{
      final response=await http.get(Uri.parse(url)).timeout(const Duration(seconds:30));
      jsonResponse= returnResponse(response);
      if(response.statusCode==200){

      }

    }on SocketException{
      throw InternetException('');
    }on TimeoutException {
      throw TimeoutException('Time out try again');
    }
    return jsonResponse;
  }

  @override
  Future<dynamic> postApi(String url,var data)async{
    dynamic jsonResponse;

    try{
      final response=await http.post(Uri.parse(url),
      body:data,
      ).timeout(const Duration(seconds:30));
      jsonResponse= returnResponse(response);
      if(response.statusCode==200){
      }

    }on SocketException{
      throw InternetException('');
    }on TimeoutException {
      throw TimeoutException('Time out try again');
    }
    return jsonResponse;

  }


  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw InvalidUrlException;
      case 500:
        throw FetchDataException(response.statusCode.toString());
      default:
        throw FetchDataException(
            'Error occur while communicating with server${response.statusCode}');
    }
  }
}