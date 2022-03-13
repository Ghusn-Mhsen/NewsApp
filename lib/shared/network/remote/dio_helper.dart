import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper{
  static Dio dio;
  static void init(){
    dio = Dio(BaseOptions(
      baseUrl: 'https://newsapi.org/',
      receiveDataWhenStatusError: true,
    )
    );
  }
static Future<Response> getData({
  @required String url,
  @required Map<String,dynamic> query})
async {
    return await dio.get(url,queryParameters: query );


}

}
//https://arabic.rt.com/business/1275640-%D8%A7%D9%84%D9%85%D8%B1%D9%83%D8%B2%D9%8A-%D8%A7%D9%84%D9%85%D8%B5%D8%B1%D9%8A-%D9%8A%D9%83%D8%B4%D9%81-%D8%B9%D9%86-%D8%AD%D8%AC%D9%85-%D8%A7%D9%84%D8%B0%D9%87%D8%A8-%D9%81%D9%8A-%D8%AD%D9%88%D8%B2%D8%AA%D9%87/,
// urlToImage: https://cdni.rt.com/media/pics/2021.09/original/614ad2b94c59b75969126c13.jpg,
// publishedAt: 2021-09-22T07:19:00Z