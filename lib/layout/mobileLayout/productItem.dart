import 'package:flutter/material.dart';

import '../../models/productModel.dart';
import '../../modules/DetailsPage.dart';
import '../../shared/components.dart';
import '../../shared/style/responsiveText.dart';

class productItem_mobile extends StatelessWidget {
  productItem_mobile({super.key, required this.model});
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
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1, strokeAlign: 0.1)),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: ImageForProductItem(image: model.image),
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
                            responsiveText(context: context, fontSize: 20)),
                  ),
                  Text(
                  model.category,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize:
                            responsiveText(context: context, fontSize: 20)),
                  ),
                  Text(
                    "\$${model.price}",
                    style: TextStyle(
                      fontSize: responsiveText(context: context, fontSize: 20),
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
