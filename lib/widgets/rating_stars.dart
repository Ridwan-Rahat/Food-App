import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Rating extends StatelessWidget {
  final int rating;

  const Rating({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(5, (index) {
        return Icon(
          Icons.star,
          color: index < rating
              ? Colors.yellow.shade600
              : Colors.white,
        );
      }),
    );
  }
}
