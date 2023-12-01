import 'package:amazon_clone/Model/product_model.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  final ProductModel productModel;
  const ProductScreen({super.key, required this.productModel});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      
    ),
    );
  }
}