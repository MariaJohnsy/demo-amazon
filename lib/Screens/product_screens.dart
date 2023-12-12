import 'package:amazon_clone/Model/product_model.dart';
import 'package:amazon_clone/Model/review_model.dart';
import 'package:amazon_clone/Utils/data.dart';
import 'package:amazon_clone/Widgets/User_detials_bar.dart';
import 'package:amazon_clone/Widgets/cost_widget.dart';
import 'package:amazon_clone/Widgets/custom_main_button.dart';
import 'package:amazon_clone/Widgets/custom_simple_rounded_button.dart';
import 'package:amazon_clone/Widgets/rating_star_widget.dart';
import 'package:amazon_clone/Widgets/review_dialog.dart';
import 'package:amazon_clone/Widgets/review_widget.dart';
import 'package:amazon_clone/Widgets/search_bar_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  final ProductModel productModel;
  const ProductScreen({super.key, required this.productModel});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Expanded spaceThingy = Expanded(child: Container());
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
      appBar: SearchBarWidget(isReadOnly: true, hasBackButton:true),
      body: Stack(
        children: [
          SingleChildScrollView(child: 
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
               SizedBox(
                height: screenSize.height - (kAppBarHeight + (kAppBarHeight / 2)),
                child: Column(
                  children: [
                     const SizedBox(height: kAppBarHeight/2),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Text(widget.productModel.sellerName,
                             style: const TextStyle(
                            color: activeCyanColor,
                              fontSize: 16,
                             ),
                            ),
                          ),
                     Text(widget.productModel.productName),
                        ],
                      ),
                    RatingStar(rating: widget.productModel.rating),
                    ],
                  ),
                ),
                Container(
                  height: screenSize.height/3,
                  constraints: BoxConstraints(
                    maxHeight: screenSize.height/3,
                  ),
                 child: Image.network(widget.productModel.url),
                  ),
                spaceThingy,
                CostWidget(color: Colors.black, cost: widget.productModel.cost),
                spaceThingy,
                CustomMainButton(child: 
                Text("Buy now",
                style: TextStyle(
                  color: Colors.black,
                ),
                ),
                 color: Colors.orange,
                  isloading: false,
                   onPressed: (){}),
                   spaceThingy,
                   CustomMainButton(child: 
                  Text("Add to Cart",
                  style: TextStyle(
                  color: Colors.black,
                ),
                ),
                 color: yellowColor,
                  isloading: false,
                   onPressed: (){}),
                   spaceThingy,
                   CustomSimpleRoundedButton(onPressed: (){
                     showDialog(
                    context: context,
                     builder:(context)=> ReviewDialog());
                   },
                    text: ("Add a review for this product"),
                   ),
                  ],
                ),
               ),
                   SizedBox(
                    height: screenSize.height,
                    child: StreamBuilder(
                    stream: FirebaseFirestore.instance.collection("products").doc(widget.productModel.uid).collection("reviews").snapshots(),
                    builder: (context,AsyncSnapshot<QuerySnapshot<Map<String,dynamic>>>snapShot){
                      if (snapShot.connectionState ==ConnectionState.waiting){
                        return Container();
                      } else {
                        return ListView.builder(itemCount:snapShot.data!.docs.length,itemBuilder: (context,index){
                       snapShot.data!.docs[index].data();
                        });
                      }
                    })
                   ),
              ],
            ),
          ),
          ),
         UserDetialBar(offset: 0),
        ],
      ),
      ),
    );
  }
}