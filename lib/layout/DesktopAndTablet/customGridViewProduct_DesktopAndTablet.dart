import '/business/cubit/rukin_app_cubit.dart';
import '/layout/DesktopAndTablet/productItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class customGridViewProduct_DesktopAndTablet extends StatelessWidget {
  customGridViewProduct_DesktopAndTablet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (context, index) => productItem_DesktopAndTablet(
        model: BlocProvider.of<RukinAppCubit>(context).products[index],
      ),
      itemCount: BlocProvider.of<RukinAppCubit>(context).products.length,
    );
  }
}
