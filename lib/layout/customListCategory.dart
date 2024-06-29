import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../business/cubit/rukin_app_cubit.dart';
import '../shared/components.dart';

class customList_category extends StatelessWidget {
  const customList_category({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => categoryItem(
          index: index,
          categoryTitle:
              BlocProvider.of<RukinAppCubit>(context).categorys[index],
        ),
        separatorBuilder: (context, index) => const SizedBox(
          width: 5,
        ),
        itemCount: BlocProvider.of<RukinAppCubit>(context).categorys.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
