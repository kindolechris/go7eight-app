import 'package:flutter/material.dart';
import 'package:go7eight/src/core/app_export.dart';
import 'package:intl/intl.dart';

import '../community/community_home/controller/community_home_controller.dart';

class SellerAccountView extends GetView<CommunityHomeController> {
  const SellerAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Seller Profile',
          style: TextStyle(
            color: Color(0xFF2E3A59),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Color(0xFF2E3A59)),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSellerHeader(context),
            const SizedBox(height: 20),
            _buildSellerStats(context),
            const SizedBox(height: 20),
            _buildProductsList(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSellerHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      color: Colors.white,
      child: Column(
        children: [
          // Profile picture with border
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.grey.shade200,
                width: 1,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: const Image(
                image: NetworkImage('https://i.pravatar.cc/200'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Username with verification badge
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Computer_Collection',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2E3A59),
                ),
              ),
              const SizedBox(width: 6),
              Container(
                padding: const EdgeInsets.all(1),
                decoration: const BoxDecoration(
                  color: Color(0xFF2B32E7),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check,
                  size: 12,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  '84',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Pr',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // Company name
          const Text(
            'Computer Collection Ltd',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF78849E),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSellerStats(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildStatItem('Orders', '567K'),
            _buildVerticalDivider(),
            _buildStatItem('Deliveries', '567K'),
            _buildVerticalDivider(),
            _buildStatItem('R.time', '10m'),
            _buildVerticalDivider(),
            _buildStatItem('Audience', '8M'),
            _buildVerticalDivider(),
            _buildStatItem('Following', '783'),
          ],
        ),
      ),
    );
  }

  Widget _buildVerticalDivider() {
    return Container(
      height: 34,
      width: 1,
      color: Colors.grey.shade200,
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2E3A59),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF78849E),
          ),
        ),
      ],
    );
  }

  Widget _buildProductsList(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          separatorBuilder: (context, index) => Divider(height: 1, color: Colors.grey.shade200),
          itemBuilder: (context, index) {
            // Different product variations
            if (index == 2) {
              return _buildSocialPost(context);
            } else {
              return _buildProductItem(context, index);
            }
          },
        ),
      ),
    );
  }

  Widget _buildProductItem(BuildContext context, int index) {
    // Product variations based on index
    bool isFirstVariant = index % 2 == 0;

    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product image with shadow and rounded corners
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                index % 2 == 0
                    ? 'https://i.imgur.com/XW0dBiG.jpg'
                    : 'https://i.imgur.com/DcGpOwF.jpg',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey.shade200,
                    child: const Center(child: Icon(Icons.error_outline, color: Colors.grey)),
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 16),

          // Product details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: const Text(
                        'Windows Laptop',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF2E3A59),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                      constraints: const BoxConstraints(),
                      padding: EdgeInsets.zero,
                      icon: const Icon(Icons.more_vert, color: Color(0xFF78849E), size: 18),
                      onPressed: () {},
                    ),
                  ],
                ),
                const Text(
                  'Core i9, 11th gen, 16GB RAM...',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF78849E),
                  ),
                ),
                const SizedBox(height: 8),

                // Delivery info with different layouts based on variant
                Row(
                  children: [
                    const Text(
                      'Delivery by ',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF78849E),
                      ),
                      maxLines: 1,
                    ),
                    Flexible(
                      child: GestureDetector(
                        onTap: () {},
                        child: Text(
                          isFirstVariant ? 'Go7eight, Seller' : 'Go7eight',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppColor.primary,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),

                // Price or currency info based on variant
                Row(
                  children: [
                    Text(
                      isFirstVariant ? 'Price ' : 'Currency ',
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF78849E),
                      ),
                    ),
                    const Text(
                      '(Tsh)',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2E3A59),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Flexible(
                      child: const Text(
                        '768,00',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF2E3A59),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // Bottom section with action buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Either a button or stock info based on variation
                    isFirstVariant
                        ? _buildActionButton('advertise', const Color(0xFF2B32E7))
                        : _buildActionButton('restock', AppColor.primary),

                    // Stock information
                    Flexible(
                      child: Text(
                        isFirstVariant ? 'Stock: 12/278' : 'Stock: 9/9',
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF78849E),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialPost(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Post image
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'https://i.imgur.com/JQzWtpJ.jpg',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey.shade200,
                    child: const Center(child: Icon(Icons.error_outline, color: Colors.grey)),
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 16),

          // Post content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: const Text(
                        'Ila @cyndi, how did it happen',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF2E3A59),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                      constraints: const BoxConstraints(),
                      padding: EdgeInsets.zero,
                      icon: const Icon(Icons.more_vert, color: Color(0xFF78849E), size: 18),
                      onPressed: () {},
                    ),
                  ],
                ),
                const Text(
                  'so sudden, Ahahhhhh\n#fearwomen #muhas2024',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF78849E),
                  ),
                ),
                const SizedBox(height: 12),

                // Post actions
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildActionButton('monetize', AppColor.primary),
                    Flexible(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.favorite,
                            color: AppColor.primary,
                            size: 18,
                          ),
                          const SizedBox(width: 4),
                          const Text(
                            '12m',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF78849E),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}