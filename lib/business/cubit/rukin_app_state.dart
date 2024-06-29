part of 'rukin_app_cubit.dart';

@immutable
sealed class RukinAppState {}

final class RukinAppInitial extends RukinAppState {}

class getProductsLoadingState extends RukinAppState {}

class getProductsLoadedState extends RukinAppState {}

class getProductsErrorState extends RukinAppState {}

class getCategoryLoadingState extends RukinAppState {}

class getCategoryLoadedState extends RukinAppState {}

class getCategoryErrorState extends RukinAppState {}

class changeCategoryItemState extends RukinAppState {}

class getProductsWithCategoryLoadingState extends RukinAppState {}

class getProductsWithCategoryLoadedState extends RukinAppState {}

class getProductsWithCategoryErrorState extends RukinAppState {}
