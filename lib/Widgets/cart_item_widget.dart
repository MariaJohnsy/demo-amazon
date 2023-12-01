import 'package:amazon_clone/Model/product_model.dart';
import 'package:amazon_clone/Utils/data.dart';
import 'package:amazon_clone/Widgets/custom_simple_rounded_button.dart';
import 'package:amazon_clone/Widgets/custom_square_button.dart';
import 'package:amazon_clone/Widgets/product_information_widget.dart';
import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  final ProductModel product;
  const CartItemWidget({super.key,
  required this.product,
  });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(25),
      height: screenSize.height / 1.5,
      width: screenSize.width,
      decoration: const BoxDecoration(
        color: backgroundColor,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: screenSize.width / 4,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Center(
                      child: Image.network(
                          product.url),
                    ),
                  ),
                ),
                ProductInformationWidget(
                    productName:
                    product.productName,
                    cost: product.cost,
                    sellerName: product.sellerName),
              ],
            ),
            flex: 5,
          ),
          Expanded(
            child: Row(
              children: [
                CustomSquareutton(
                    child: Icon(Icons.remove),
                    onPressed: () {},
                    color: backgroundColor,
                    dimension: 40),
                CustomSquareutton(
                    child: const Text(
                      "0",
                      style: TextStyle(
                        color: activeCyanColor,
                      ),
                    ),
                    onPressed: () {},
                    color: Colors.white,
                    dimension: 40),
                CustomSquareutton(
                    child: Icon(Icons.add),
                    onPressed: () {},
                    color: backgroundColor,
                    dimension: 40),
              ],
            ),
            flex: 3,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      CustomSimpleRoundedButton(
                          onPressed: () {}, text: "Delete"),
                      const SizedBox(
                        width: 4,
                      ),
                      CustomSimpleRoundedButton(
                          onPressed: () {}, text: "Save for later"),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 2),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "See more like this",
                        style: TextStyle(
                          color: activeCyanColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            flex: 1,
          ),
        ],
      ),
    );
  }
}
