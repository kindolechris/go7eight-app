import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final int rating;
  final double size;
  final Color color;

  const StarRating({
    Key? key,
    required this.rating,
    this.size = 16,
    this.color = Colors.amber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        if (index < rating) {
          return Icon(
            Icons.star,
            color: color,
            size: size,
          );
        } else {
          return Icon(
            Icons.star_border,
            color: color,
            size: size,
          );
        }
      }),
    );
  }
}