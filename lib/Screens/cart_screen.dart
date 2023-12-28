import 'package:amazon_clone/Model/product_model.dart';
import 'package:amazon_clone/Utils/data.dart';
import 'package:amazon_clone/Widgets/User_detials_bar.dart';
import 'package:amazon_clone/Widgets/cart_item_widget.dart';
import 'package:amazon_clone/Widgets/custom_main_button.dart';
import 'package:amazon_clone/Widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {     //Cart screen
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(
        isReadOnly: true, 
        hasBackButton: false),
        body: Center(
          child: Stack(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: kAppBarHeight / 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomMainButton(
                      child:const Text(
                        "Procced to by (n) items",
                        style: TextStyle(
                          color: Colors.black),
                      ),
                       color: yellowColor,
                        isloading: false,
                         onPressed: (){}),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context,index){
                        return CartItemWidget(
                          product: ProductModel(
                          url: "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png",
                          productName: "Rick Astley",
                          cost: 1000000, 
                          discount: 0,
                          uid: "abcdef",
                         sellerName: "rick seller",
                         sellerUid: "10525",
                         rating: 1,
                         noOfRating: 1),
                       );
                        }),
                      ),
                ],
              ),
               const UserDetialBar(offset: 0),
            ],
          ),
        ),
    );
  }
}