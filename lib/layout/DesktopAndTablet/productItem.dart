
import 'package:flutter/material.dart';

import '../../models/productModel.dart';
import '../../modules/DetailsPage.dart';
import '../../shared/components.dart';
import '../../shared/style/responsiveText.dart';

class productItem_DesktopAndTablet extends StatelessWidget {
  productItem_DesktopAndTablet({super.key,required this.model});
  productModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Detailspage(model: model),
            ));
      },
      child: Container(
        height: 170,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1, strokeAlign: 0.1)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageForProductItem(image: model.image,),
            const SizedBox(
              width: 70,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    maxLines: 1,
                   model.title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize:
                            responsiveText(context: context, fontSize: 25)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                   model.description,
                    maxLines: 2,
                    style: TextStyle(
                        fontSize:
                            responsiveText(context: context, fontSize: 20)),
                  ),
                  Text(
                   model.category,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize:
                            responsiveText(context: context, fontSize: 20)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20,right: 50),
              child: Text(
                "\$${model.price}",
                style: TextStyle(
                  fontSize: responsiveText(context: context, fontSize: 20),
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
