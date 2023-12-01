import 'package:amazon_clone/Model/product_model.dart';
import 'package:amazon_clone/Widgets/result_widgets.dart';
import 'package:amazon_clone/resources/search_bar_widget.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String query;
  const ResultScreen({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(isReadOnly:false, hasBackButton:true),
      body: Column(
       children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: RichText(text: TextSpan(
            children: [
              const TextSpan(
                text: "Showing result for", style: TextStyle(
                  fontSize: 17,
                ),
              ),
               TextSpan(
                text: query, style: const TextStyle(
                  fontSize: 17,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
          ),
        ),
        Expanded(
          child: GridView.builder(
            itemCount: 9,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
            childAspectRatio: 2 / 3,
            ),
           itemBuilder: (context,index){
            return ResultWidget(
              product: productModel(
                    url: "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png",
                   productName: "Thalappathy Vijay",
                   cost: 100,
                   discount: 0,
                    uid: "ABCDEFGHIJ",
                     sellerName: "Fan seller", 
                     sellerUid: "abcdefghij",
                      rating: 4, 
                      noOfRating: 1),
               );
           }),
        ),
       ], 
      ),
    );
  }
}