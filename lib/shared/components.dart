import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../business/cubit/rukin_app_cubit.dart';
import '../layout/customListCategory.dart';
import 'style/responsiveText.dart';

class adaptiveLayout extends StatelessWidget {
  adaptiveLayout(
      {super.key,
      required this.DesktopLayout,
      required this.MobileLayout,
      required this.TabletLayout});
  WidgetBuilder DesktopLayout, MobileLayout, TabletLayout;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 1200) {
        return DesktopLayout(context);
      } else if (constraints.maxWidth < 1200 && constraints.maxWidth > 900)
        return TabletLayout(context);
      else
        return MobileLayout(context);
    });
  }
}

class adaptiveLayout_Sliver extends StatelessWidget {
  adaptiveLayout_Sliver(
      {super.key,
      required this.DesktopLayout,
      required this.MobileLayout,
      required this.TabletLayout});
  WidgetBuilder DesktopLayout, MobileLayout, TabletLayout;
  @override
  Widget build(BuildContext context) {
    return SliverLayoutBuilder(builder: (context, constraints) {
      if (constraints.crossAxisExtent > 1200) {
        print("desktop");
        return DesktopLayout(context);
      } else if (constraints.crossAxisExtent < 1200 &&
          constraints.crossAxisExtent > 900) {
        print("tablet");
        return TabletLayout(context);
      } else {
        print("mobile");
        return MobileLayout(context);
      }
    });
  }
}

class categoryItem extends StatelessWidget {
  categoryItem({super.key, required this.categoryTitle, required this.index});
  String categoryTitle;
  int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<RukinAppCubit>(context)
            .getCategoryWithSelected(title: categoryTitle, index: index);
        BlocProvider.of<RukinAppCubit>(context)
            .changeCategoryItem(index: index);
      },
      child: BlocBuilder<RukinAppCubit, RukinAppState>(
        builder: (context, state) {
          return IntrinsicWidth(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color:
                    BlocProvider.of<RukinAppCubit>(context).SelectItem == index
                        ? Colors.grey[300]
                        : Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black),
              ),
              child: Center(
                  child: Text(
                categoryTitle,
                style: TextStyle(
                    fontSize: responsiveText(context: context, fontSize: 17),
                    fontWeight: FontWeight.bold),
              )),
            ),
          );
        },
      ),
    );
  }
}

Widget CustomTitleText(
        {required String title, required BuildContext context}) =>
    Text(
      title,
      style: TextStyle(
          fontSize: responsiveText(context: context, fontSize: 30),
          fontWeight: FontWeight.bold),
    );

class ImageForProductItem extends StatelessWidget {
  ImageForProductItem({super.key, required this.image});
  String image;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.contain,
      imageUrl: image,
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

Widget productBlocBuilder({required Widget if_stateIsLoading_return_this}) {
  return BlocBuilder<RukinAppCubit, RukinAppState>(
    builder: (context, state) {
      if (state is getCategoryLoadingState) {
        return const SliverToBoxAdapter(
            child: Padding(
          padding: EdgeInsets.only(top: 50),
          child: Center(child: CircularProgressIndicator()),
        ));
      } else if (BlocProvider.of<RukinAppCubit>(context).products.isNotEmpty) {
        return if_stateIsLoading_return_this;
      } else if (state is getProductsErrorState)
        return const SliverToBoxAdapter(
            child: Center(
          child: Text("error"),
        ));
      else
        //عند بداية تشغيل الصفحة وقبل اشتغال التحميل
        return const SliverToBoxAdapter(
            child: Padding(
          padding: EdgeInsets.only(top: 100),
          child: Center(child: CircularProgressIndicator()),
        ));
    },
  );
}

Widget categoryBlocBuilder() {
  return BlocBuilder<RukinAppCubit, RukinAppState>(
    builder: (context, state) {
      if (state is getCategoryLoadingState ||
          BlocProvider.of<RukinAppCubit>(context).categorys.isEmpty) {
        return const LinearProgressIndicator();
      } else if (BlocProvider.of<RukinAppCubit>(context).categorys.isNotEmpty) {
        return const customList_category();
      } else {
        return const Text("Error");
      }
    },
  );
}
