import '/shared/style/responsiveText.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 20,
      title: const Text("Rukin"),
      actions:  [
        // in this api cant found eny search post method for product
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 20),
          child: Icon(
            Icons.search,
            size: responsiveText(context: context, fontSize: 30),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 56);
}
