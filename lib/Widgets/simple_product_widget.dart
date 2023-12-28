import 'package:amazon_clone/Model/product_model.dart';
import 'package:amazon_clone/Screens/product_screens.dart';
import 'package:flutter/material.dart';

class SimpleProductWidget extends StatelessWidget {
  final ProductModel productModel;
  const SimpleProductWidget({super.key,
  required this.productModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
      Navigator.push(context, MaterialPageRoute(builder:(context) =>
      ProductScreen(productModel:productModel),
        ),
        );
      },
      child: AspectRatio(
        aspectRatio: 2 / 1,
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(1),
            child: Image.network(productModel.url),
          ),
        ),
      ),
    );
  }
}

