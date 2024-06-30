import '/business/cubit/rukin_app_cubit.dart';
import '/layout/DesktopAndTablet/customGridViewProduct_DesktopAndTablet.dart';
import '/shared/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../layout/customAppBar.dart';
import '../layout/mobileLayout/customGridView.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {

    BlocProvider.of<RukinAppCubit>(context).getProducts();
    BlocProvider.of<RukinAppCubit>(context).getCategorys();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
              child: CustomTitleText(title: "Category", context: context)),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 15,
            ),
          ),
          SliverToBoxAdapter(child: categoryBlocBuilder()),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 15,
            ),
          ),
          SliverToBoxAdapter(
              child: CustomTitleText(title: "Product", context: context)),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 15,
            ),
          ),
          adaptiveLayout_Sliver(
            DesktopLayout: (context) => productBlocBuilder(
                if_stateIsLoading_return_this:
                    customGridViewProduct_DesktopAndTablet()),
            MobileLayout: (context) => productBlocBuilder(
                if_stateIsLoading_return_this:
                    const customGridViewProduct_Mobile()),
            TabletLayout: (context) => productBlocBuilder(
                if_stateIsLoading_return_this:
                    customGridViewProduct_DesktopAndTablet()),
          ),
        ],
      ),
    );
  }
}