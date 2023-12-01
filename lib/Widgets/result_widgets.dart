import 'package:amazon_clone/Model/product_model.dart';
import 'package:amazon_clone/Widgets/cost_widget.dart';
import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget {
  final productModel product;
  const ResultWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
    children: [
      SizedBox(
        width: screenSize.width / 3,
        child: Image.network(product.url,
        ),
      ),
      Text(product.productName),
      CostWidget(color: const Color.fromRGBO(235, 92, 9, 3), cost: product.cost),
    ],
    );
  }
}