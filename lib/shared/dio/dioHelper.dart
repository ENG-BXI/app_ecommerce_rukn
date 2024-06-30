import '/models/productModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Diohelper {
  static Dio dio = Dio(BaseOptions(baseUrl: "https://fakestoreapi.com/"));
  static Future<List<productModel>> getProuct({String? category}) async {
    late Response response;
    try {
      response = await dio.get(category == null?"products":"products/category/$category");
    } catch (e) {
      debugPrint("error ======================== ${e.toString()}");
    }

    List<productModel> listModel = [];
    response.data.forEach((element) {
      listModel.add(productModel.fromJson(element));
    });

    return listModel;
  }

  static Future<List<String>> getCategory() async {
    late Response response;
    try {
      response = await dio.get("products/categories");
    } catch (e) {
      debugPrint("error ======================== ${e.toString()}");
    }
    List<String> listModels = [];
    response.data.forEach((element) {
      listModels.add(element);
    });
    return listModels;
  }

  // static Future<List<productModel>> getProductByCategory(
  //     {required String category}) async {
  //   late Response response;
  //   try {
  //     response = await dio.get("products/category/$category");
  //   } catch (e) {
  //     debugPrint("error ======================== ${e.toString()}");
  //   }
  //   List<productModel> listModel = [];
  //   response.data.forEach((element) {
  //     listModel.add(productModel.fromJson(element));
  //   });
  //   return listModel;
  // }
}
