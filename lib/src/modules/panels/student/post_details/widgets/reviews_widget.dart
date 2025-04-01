import 'package:flutter/material.dart';
import 'package:go7eight/src/core/constants/colors.dart';
import 'package:go7eight/src/models/post.dart';
import 'star_rating.dart';

class ReviewsWidget extends StatelessWidget {
  final Post? post;

  const ReviewsWidget({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> reviews = [
      {
        'name': 'John M.',
        'avatar': 'https://i.pravatar.cc/100?img=1',
        'rating': 5,
        'date': '2 weeks ago',
        'comment': 'Excellent laptop with great performance. The shipping was fast and the product arrived in perfect condition.',
      },
      {
        'name': 'Sarah L.',
        'avatar': 'https://i.pravatar.cc/100?img=5',
        'rating': 4,
        'date': '1 month ago',
        'comment': 'Good value for money. The battery life is impressive, but the fan can get a bit noisy under heavy load.',
      },
    ];

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Rating overview
          _buildRatingOverview(context),

          const SizedBox(height: 20),

          // Review list
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: reviews.length,
            separatorBuilder: (context, index) => Divider(height: 30, color: Colors.grey.shade200),
            itemBuilder: (context, index) {
              final review = reviews[index];
              return _buildReviewItem(context, review);
            },
          ),

          const SizedBox(height: 20),

          // Write review button
          Center(
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.rate_review),
              label: const Text('Write a Review'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingOverview(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.blue.shade50
            : Colors.blue.shade900.withOpacity(0.2),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.white
                  : Colors.blue.shade800,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: Text(
                '4.2',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.blue.shade700
                      : Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildRatingBars(context),
                const SizedBox(height: 10),
                Text(
                  'Based on ${post?.noComments ?? 1989} reviews',
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColor.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingBars(BuildContext context) {
    final List<int> ratings = [80, 15, 3, 1, 1]; // Percentage for 5, 4, 3, 2, 1 stars

    return Column(
      children: List.generate(
        5,
            (index) => Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Row(
            children: [
              Text(
                '${5 - index}',
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColor.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 5),
              const Icon(
                Icons.star,
                color: Colors.amber,
                size: 14,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      height: 6,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                    Container(
                      height: 6,
                      width: (MediaQuery.of(context).size.width * 0.5) * (ratings[index] / 100),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Text(
                '${ratings[index]}%',
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColor.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReviewItem(BuildContext context, Map<String, dynamic> review) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(review['avatar']),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    review['name'],
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).brightness == Brightness.light
                          ? AppColor.black
                          : AppColor.white,
                    ),
                  ),
                  Row(
                    children: [
                      StarRating(rating: review['rating']),
                      const SizedBox(width: 10),
                      Text(
                        review['date'],
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColor.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.verified,
                    color: Colors.green.shade700,
                    size: 12,
                  ),
                  const SizedBox(width: 3),
                  Text(
                    'Verified',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.green.shade700,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          review['comment'],
          style: TextStyle(
            fontSize: 14,
            height: 1.5,
            color: Theme.of(context).brightness == Brightness.light
                ? AppColor.black
                : AppColor.white,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.thumb_up_outlined, size: 14),
              label: const Text('Helpful'),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                textStyle: const TextStyle(fontSize: 12),
              ),
            ),
            const SizedBox(width: 15),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.comment_outlined, size: 14),
              label: const Text('Comment'),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                textStyle: const TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
      ],
    );
  }
}