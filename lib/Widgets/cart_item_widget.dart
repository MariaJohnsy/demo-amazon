import 'package:amazon_clone/Utils/data.dart';
import 'package:amazon_clone/Widgets/product_information_widget.dart';
import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
     Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height/2,
      width: screenSize.width,
      decoration:const BoxDecoration(
        color: backgroundColor,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey, width: 1,
          ),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child:Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              SizedBox(
                width: screenSize.width/3,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Image.network(
                    "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png"),
                    ),
              ),
              ProductInformationWidget(
                productName:"Something something cleans stuff pink in color large size", 
                cost:1000.3,
                 sellerName: "Rick"),
              ],
            ),
          flex: 5,
          ),
          Expanded(child: Container(
            color: Colors.blue,
          ),
          flex: 1,
          ),
          Expanded(child: Container(
            color: Colors.green,
          ),
          flex: 1,
          ),
        ],
      ),
    );
  }
}