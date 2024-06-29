import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/productModel.dart';
import '../shared/style/responsiveText.dart';

class Detailspage extends StatelessWidget {
  Detailspage({super.key, required this.model});
  productModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
              child: Container(
            //for background color
            color: Colors.white,
            width: double.infinity,
            child: CachedNetworkImage(
              fit: BoxFit.contain,
              imageUrl: model.image,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          )),
          Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              model.title,
                              style: TextStyle(
                                  fontSize: responsiveText(
                                      context: context, fontSize: 20),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "\$${model.price}",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: responsiveText(
                                    context: context, fontSize: 20)),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "category : ${model.category}",
                            style: TextStyle(
                                fontSize: responsiveText(
                                    context: context, fontSize: 20),
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size:
                                responsiveText(context: context, fontSize: 45),
                          ),
                          Text("${model.rating.rate}")
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Description",
                        style: TextStyle(
                          fontSize:
                              responsiveText(context: context, fontSize: 20),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        model.description,
                        style: TextStyle(
                            fontSize:
                                responsiveText(context: context, fontSize: 15)),
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
