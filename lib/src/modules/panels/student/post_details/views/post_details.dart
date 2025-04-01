import 'package:flutter/material.dart';
import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/models/post.dart';
import 'package:go7eight/src/modules/panels/student/post_details/widgets/payment_method_widget.dart';
import 'package:go7eight/src/modules/panels/student/post_details/widgets/product_image_gallary.dart';
import '../controllers/post_details_controller.dart';
import '../widgets/bottombar_widget.dart';
import '../widgets/price_detail_widget.dart';
import '../widgets/product_header.dart';
import '../widgets/seller_info.dart';
import '../widgets/expandable_section.dart';
import '../widgets/special_request.dart';
import '../widgets/specifications_widget.dart';
import '../widgets/delivery_widget.dart';
import '../widgets/warranty_widget.dart';
import '../widgets/reviews_widget.dart';

class PostDetailsView extends StatefulWidget {
  final Post? post;

  const PostDetailsView({Key? key, this.post}) : super(key: key);

  @override
  State<PostDetailsView> createState() => _PostDetailsViewState();
}

class _PostDetailsViewState extends State<PostDetailsView> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Colors.grey.shade50
            : AppColor.black,
        extendBodyBehindAppBar: true,
        appBar: _buildAppBar(),
        body: _buildInitController(),
        bottomNavigationBar: const BottomBarWidget(),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.share, color: Colors.black),
            onPressed: () {},
          ),
        ),
        Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(
              _isFavorite ? Icons.favorite : Icons.favorite_border,
              color: _isFavorite ? Colors.red : Colors.black,
            ),
            onPressed: () {
              setState(() {
                _isFavorite = !_isFavorite;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildInitController() {
    return GetBuilder<PostDetailsController>(
      init: PostDetailsController(),
      builder: (controller) {
        // Initialize controller with post data if available
        if (widget.post != null && !controller.isInitialized) {
          controller.initializeWithPost(widget.post!);
        }

        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Gallery Section
              ProductImageGallery(post: widget.post),

              // Main Content Container - Slightly elevated with rounded corners
              Container(
                margin: const EdgeInsets.only(top: 0),
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.light
                      ? AppColor.white
                      : AppColor.darkGrey,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, -5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Header
                    ProductHeader(post: widget.post),

                    // Divider
                    Divider(height: 1, color: Colors.grey.shade200),

                    // Seller Information
                    SellerInfo(post: widget.post),

                    // Divider
                    Divider(height: 1, color: Colors.grey.shade200),

                    // Product Specifications with Expansion panel
                    ExpandableSection(
                      title: 'Specifications',
                      content: const SpecificationsWidget(),
                    ),

                    // Delivery Options
                    ExpandableSection(
                      title: 'Delivery Options',
                      content: const DeliveryWidget(),
                    ),

                    // Payment Methods
                    ExpandableSection(
                      title: 'Payment Methods',
                      content: const PaymentMethodsWidget(),
                    ),

                    // Warranty Information
                    ExpandableSection(
                      title: 'Warranty & Returns',
                      content: const WarrantyWidget(),
                    ),

                    // Price Details
                    const PriceDetailsWidget(),

                    // Customer Reviews
                    ExpandableSection(
                      title: 'Customer Reviews (${widget.post?.noComments ?? 1989})',
                      content: ReviewsWidget(post: widget.post),
                    ),

                    // Special Requests
                    const SpecialRequestWidget(),

                    // Bottom spacing
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}