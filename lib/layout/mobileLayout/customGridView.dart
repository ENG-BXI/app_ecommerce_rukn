import '/business/cubit/rukin_app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'productItem.dart';

class customGridViewProduct_Mobile extends StatelessWidget {
  const customGridViewProduct_Mobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          childAspectRatio: 0.7),
      itemBuilder: (context, index) => productItem_mobile(
          model: BlocProvider.of<RukinAppCubit>(context).products[index]),
      itemCount: BlocProvider.of<RukinAppCubit>(context).products.length,
    );
  }
}
