import 'package:amazon_clone/Model/review_model.dart';
import 'package:amazon_clone/Utils/data.dart';
import 'package:amazon_clone/Widgets/rating_star_widget.dart';
import 'package:flutter/material.dart';

class ReviewWidget extends StatelessWidget {
  final reviewModel review;
  const ReviewWidget({super.key,
  required this.review
  });

  @override
  Widget build(BuildContext context) {
   Size screenSize = MediaQuery.of(context).size; 
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text(review.senderName,
       style: const TextStyle(
       fontSize: 16,
       fontWeight: FontWeight.bold,
      ),
        ),
       Padding(
         padding: const EdgeInsets.symmetric(vertical: 6),
         child: Row(
          children: [
             Padding(
               padding: const EdgeInsets.only(right: 10),
               child: SizedBox(
                         width: screenSize.width/4,
                         child: FittedBox(
                         child: RatingStar(rating: review.rating),
                         ),
                       ),
             ),
          Text(keysOfRating[review.rating-1],
           style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          ),
          ],
         ),
       ),
       Text(review.description,
       maxLines: 3,
       overflow: TextOverflow.ellipsis,
       ),
      ],
        ),
    );
  }
}