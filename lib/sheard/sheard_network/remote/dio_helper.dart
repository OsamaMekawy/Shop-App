import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


class DioHelper
{

  static Dio? dio;

  static init()
   {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type':'application/json'
        }
      )
    );
  }

 static Future<Response> getData({
  required String url,
   String lang = 'ar',
   String? token ,
     Map<String,dynamic>? query
})async
  {
    dio?.options.headers={
      'Content_Type':'application/json',
      'lang':lang,
      'Authorization':token

    };
    return await dio!.get(url,queryParameters:query ,);

  }

  static Future<Response>postData({
    required String url,
    String lang = 'ar',
    String? token ,
   Map<String,dynamic>? query,
    required Map<String,dynamic> data

})async
{
  dio?.options.headers={
    'Content_Type':'application/json',
    'lang':lang,
    'Authorization':token??""

  };
return await dio!.post(
  url,
  queryParameters: query,
  data: data
);
}


  static Future<Response>putData({
    required String url,
    String lang = 'ar',
    String? token ,
    Map<String,dynamic>? query,
    required Map<String,dynamic> data

  })async
  {
    dio?.options.headers={
      'Content_Type':'application/json',
      'lang':lang,
      'Authorization':token??""

    };
    return await dio!.put(
        url,
        queryParameters: query,
        data: data
    );
  }



}