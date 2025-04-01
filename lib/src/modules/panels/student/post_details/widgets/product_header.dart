import 'package:flutter/material.dart';
import 'package:go7eight/src/core/constants/colors.dart';
import 'package:go7eight/src/models/post.dart';
import 'package:go7eight/src/modules/panels/student/post_details/widgets/star_rating.dart';


class ProductHeader extends StatelessWidget {
  final Post? post;

  const ProductHeader({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            post?.title ?? 'Windows Laptop - Core i9, 11th gen, 16GB RAM',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColor.black
                  : AppColor.white,
            ),
          ),

          const SizedBox(height: 10),

          // Reviews row
          Row(
            children: [
              StarRating(rating: 4),
              const SizedBox(width: 8),
              Text(
                '${post?.noComments ?? 1989} Reviews',
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColor.grey,
                ),
              ),
              const Spacer(),
              _buildStockIndicator(),
            ],
          ),

          const SizedBox(height: 15),

          // Price
          _buildPriceSection(),

          const SizedBox(height: 15),

          // Description
          if (post?.description != null)
            Text(
              post!.description!,
              style: TextStyle(
                fontSize: 15,
                height: 1.5,
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColor.grey
                    : AppColor.lightGrey,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildStockIndicator() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.green.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.check_circle, color: Colors.green.shade700, size: 16),
          const SizedBox(width: 4),
          Text(
            'In Stock',
            style: TextStyle(
              color: Colors.green.shade700,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Builder(
          builder: (context) => Text(
            'TSh 690,000',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.blue.shade700
                  : Colors.blue.shade300,
            ),
          ),
        ),
        const SizedBox(width: 8),
        const Text(
          'TSh 750,000',
          style: TextStyle(
            fontSize: 14,
            decoration: TextDecoration.lineThrough,
            color: AppColor.grey,
          ),
        ),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: Colors.red.shade100,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            '-8%',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.red.shade700,
            ),
          ),
        ),
      ],
    );
  }
}