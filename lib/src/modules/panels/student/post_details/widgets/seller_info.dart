import 'package:flutter/material.dart';
import 'package:go7eight/src/core/constants/colors.dart';
import 'package:go7eight/src/models/post.dart';


class SellerInfo extends StatelessWidget {
  final Post? post;

  const SellerInfo({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = post?.user;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: AppColor.lightGrey,
            backgroundImage: user?.firstName != null
                ? NetworkImage('https://ui-avatars.com/api/?name=${user!.firstName}+${user.lastName}&background=random')
                : const NetworkImage('https://i.pravatar.cc/200'),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      user?.nickname ?? 'Computer_Collection',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).brightness == Brightness.light
                            ? AppColor.black
                            : AppColor.white,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.verified,
                      color: AppColor.primaryBlue,
                      size: 16,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const Text(
                  'Computer Collection Ltd • 98% Positive Feedback',
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColor.grey,
                  ),
                ),
              ],
            ),
          ),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: AppColor.primaryBlue),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
            child: const Text(
              'Visit Store',
              style: TextStyle(
                color: AppColor.primaryBlue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}