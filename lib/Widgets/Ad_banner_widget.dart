import 'package:amazon_clone/Utils/data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdBannerWidget extends StatefulWidget { //ad banner of homescreen
  const AdBannerWidget({super.key});

  @override
  State<AdBannerWidget> createState() => _AdBannerWidgetState();
}

class _AdBannerWidgetState extends State<AdBannerWidget> {
  int currentAd = 0;
 
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
     double smallAdHeight = screenSize.width/5;
    return GestureDetector(
      onHorizontalDragEnd: (_){
        if (currentAd == (largeAds.length -1)){
          currentAd = -1;
        }
        setState(() {
          currentAd++;
        });
      },
      child: Column(
        children: [
          //image with gradient
          Stack(
            children: [
              Image.network(
            largeAds[currentAd],
            width: double.infinity,
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width:screenSize.width,
              height: 100,
              decoration:BoxDecoration(
                gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors:[backgroundColor,
                backgroundColor.withOpacity(0),
                ],
                ),
              ),
            ),
          ),
            ],
          ),
          Container(
            color: backgroundColor,
            width: screenSize.width,
            height: smallAdHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              getSmallAdsFromIndex(0, smallAdHeight),
              getSmallAdsFromIndex(1, smallAdHeight),
              getSmallAdsFromIndex(2, smallAdHeight),
              getSmallAdsFromIndex(3, smallAdHeight),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget getSmallAdsFromIndex (int index,double height){
    return Container(
        height: height,
        width: height,
        decoration: ShapeDecoration(
          color: Colors.white,
          shadows: [BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5,
            spreadRadius: 1,
          ),
          ],
          shape:RoundedRectangleBorder(
          borderRadius:BorderRadius.circular(10),
        ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(smallAds[index]),
              const SizedBox(
                height: 5,
              ),
              Text(adItemNames[index]),
            ],
          ),
        ),
    );
  }
}
  

  