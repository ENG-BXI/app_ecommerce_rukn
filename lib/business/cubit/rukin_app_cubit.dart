import '/shared/dio/dioHelper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../models/productModel.dart';

part 'rukin_app_state.dart';

class RukinAppCubit extends Cubit<RukinAppState> {
  RukinAppCubit() : super(RukinAppInitial());

  List<productModel> products = [];
  getProducts() async {
    emit(getProductsLoadingState());
    try {
      products = await Diohelper.getProuct();
      emit(getProductsLoadedState());
    } catch (e) {
      debugPrint("======================= ${e.toString()}");
      emit(getProductsErrorState());
    }
  }

  List<String> categorys = [];
  getCategorys() async {
    emit(getCategoryLoadingState());
    categorys = [];
    try {
      await _algorithmForAdd_category_ALL_forLIst(list: categorys);
      emit(getCategoryLoadedState());
    } catch (e) {
      debugPrint("============== in getCategoryBloc$e");
      debugPrint("error cubit category");
      emit(getCategoryErrorState());
    }
  }

  _algorithmForAdd_category_ALL_forLIst({required List<String> list}) async {
    List<String> tempList = [];

    tempList = await Diohelper.getCategory();
    list.add("ALL");
    for (var element in tempList) {
      list.add(element);
    }
  }

  int SelectItem = 0;
  Future getCategoryWithSelected(
      {required String title, required int index}) async {
    if (index == 0) {
      products = [];
      await getProducts();
      emit(getProductsWithCategoryLoadedState());
    } else {
      emit(getProductsWithCategoryLoadingState());
      products = [];
      try {
        products = await Diohelper.getProuct(category: title);
        emit(getProductsWithCategoryLoadedState());
      } catch (e) {
        emit(getProductsWithCategoryErrorState());
      }
    }
  }

  changeCategoryItem({required int index}) {
    SelectItem = index;

    emit(changeCategoryItemState());
  }
}
