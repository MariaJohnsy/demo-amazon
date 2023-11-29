import 'package:amazon_clone/Utils/data.dart';
import 'package:amazon_clone/Widgets/custom_simple_rounded_button.dart';
import 'package:amazon_clone/Widgets/custom_square_button.dart';
import 'package:amazon_clone/Widgets/product_information_widget.dart';
import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
     Size screenSize = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(25),
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
                  child: Center(
                    child: Image.network(
                      "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png"),
                  ),
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
          Expanded(
            child: Row(
              children: [
              CustomSquareutton(child: Icon(Icons.remove),
               onPressed: (){},
                color: Colors.grey[500]!,
                 dimension: 50),
                 CustomSquareutton(child: Text("0", style: TextStyle(
                  color: activeCyanColor,
                 ),
                 ),
               onPressed: (){},
                color: Colors.grey[200]!,
                 dimension: 50),
                 CustomSquareutton(child: Icon(Icons.add),
               onPressed: (){},
                color: Colors.grey[500]!,
                 dimension: 50),
              ],
            ),
          flex: 3,
          ),
          Expanded(child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomSimpleRoundedButton(onPressed: (){}, text: "Delete"),
              CustomSimpleRoundedButton(onPressed: (){}, text: "Save for later"),
            ],
          ),
          flex: 1,
          ),
        ],
      ),
    );
  }
}