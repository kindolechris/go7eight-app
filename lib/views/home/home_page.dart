import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_social_media_flutter_ui_kit/routes/app_routes.dart';

import '../../config/app_color.dart';
import '../../config/app_font.dart';
import '../../config/app_icon.dart';
import '../../config/app_size.dart';
import '../../helpers/theme_helper.dart';
import '../../model/social_media_post_model.dart';
import '../widget/home/post_item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FocusNode _searchFocus = FocusNode();
  final TextEditingController _searchController = TextEditingController();
  bool _showResults = false;

  final List<String> categories = ['People', 'Products', 'Services', 'Offers'];
  int selectedCategoryIndex = 0;

  final List<String> allResults = [
    'Eleanor Pena',
    'Ronald Richards',
    'Devon Lane',
    'Robert Fox',
    'Jenny Wilson',
    'Marvin Mckinney',
  ];

  final List<String> products = ['Sneakers', 'Smartphone', 'Watch'];
  final List<String> services = ['Photography', 'Design', 'Delivery'];
  final List<String> offers = ['Buy 1 Get 1', 'Free Shipping'];

  @override
  void initState() {
    super.initState();
    _searchFocus.addListener(() {
      if (!_searchFocus.hasFocus) {
        setState(() => _showResults = false);
      }
    });
  }

  List<String> get filteredResults {
    switch (selectedCategoryIndex) {
      case 1:
        return products;
      case 2:
        return services;
      case 3:
        return offers;
      default:
        return allResults;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themedColor(Get.context!, (c) => c.backgroundColor),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).unfocus();
          setState(() => _showResults = false);
        },
        child: SafeArea(
          child: Stack(
            children: [
              // Main content
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Search Bar
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: AppSize.appSize43,
                              decoration: BoxDecoration(
                                color: themedColor(
                                    context, (c) => c.chatColor),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  const SizedBox(width: 8),
                                  Icon(Icons.search,
                                      color: themedColor(
                                          context, (c) => c.text2Color)),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: TextField(
                                      controller: _searchController,
                                      focusNode: _searchFocus,
                                      style: TextStyle(
                                          color: themedColor(context,
                                              (c) => c.secondaryColor)),
                                      onChanged: (value) {
                                        setState(() =>
                                            _showResults = value.isNotEmpty);
                                      },
                                      onTap: () {
                                        setState(() => _showResults = true);
                                      },
                                      decoration: InputDecoration(
                                        hintText: 'Search',
                                        hintStyle: TextStyle(
                                            color: themedColor(
                                                context, (c) => c.text2Color)),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          _circleIconButton(
                              AppIcon.shoppingCart, AppRoutes.myCart,
                              badgeCount: 7),
                          const SizedBox(width: 8),
                          _circleIconButton(
                              AppIcon.notificationIcon, AppRoutes.notification),
                        ],
                      ),
                    ),

                    // Category Tabs
                    // Category Tabs (Horizontally Scrollable)
                    if (_showResults)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 2, vertical: 4),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(categories.length, (index) {
                              final isSelected = selectedCategoryIndex == index;
                              return Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(
                                        () => selectedCategoryIndex = index);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: AppSize.appSize14,
                                        vertical: AppSize.appSize6),
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? themedColor(Get.context!,
                                              (c) => c.secondaryColor)
                                          : themedColor(Get.context!,
                                              (c) => c.backgroundColor),
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          color: themedColor(Get.context!,
                                              (c) => c.borderColor)),
                                    ),
                                    child: Text(
                                      categories[index],
                                      style: TextStyle(
                                          fontSize: AppSize.appSize14,
                                          fontFamily: AppFont.appFontSemiBold,
                                          color: isSelected
                                              ? themedColor(Get.context!,
                                                  (c) => c.backgroundColor)
                                              : themedColor(Get.context!,
                                                  (c) => c.text1Color)),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),

                    // Posts
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Column(
                        children: List.generate(posts.length, (index) {
                          final socialPost = posts[index];
                          return PostItemWidget(post: socialPost);
                        }),
                      ),
                    ),
                  ],
                ),
              ),

              // Search Dropdown Overlay
              if (_showResults)
                Positioned(
                  top: 112,
                  left: 0,
                  right: 0,
                  child: Container(
                    constraints: const BoxConstraints(maxHeight: 300),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
                    decoration: BoxDecoration(
                      color: themedColor(
                          Get.context!, (c) => c.cardBackgroundColor),
                      borderRadius: BorderRadius.circular(2),
                      boxShadow: [
                        BoxShadow(
                          color: themedColor(
                                  Get.context!, (c) => c.backgroundColor)
                              .withOpacity(0.25),
                          blurRadius: 8,
                        )
                      ],
                    ),
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: filteredResults.length,
                      separatorBuilder: (_, __) => const Divider(),
                      itemBuilder: (context, index) {
                        final result = filteredResults[index];
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey.shade800,
                            child: Text(result[0]),
                          ),
                          title: Text(
                            result,
                            style: TextStyle(
                              color: themedColor(
                                  Get.context!, (c) => c.secondaryColor),
                            ),
                          ),
                          onTap: () {
                            _searchController.text = result;
                            setState(() => _showResults = false);
                          },
                        );
                      },
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  // Circle icon with optional badge
  Widget _circleIconButton(String icon, String route, {int badgeCount = 0}) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
          onTap: () => Get.toNamed(route),
          child: Container(
            width: AppSize.appSize30,
            height: AppSize.appSize30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: themedColor(Get.context!, (c) => c.borderColor),
              ),
              color: AppColor.supportColor.withOpacity(0.5),
            ),
            alignment: Alignment.center,
            child: ClipOval(
              child: SizedBox(
                width: AppSize.appSize22, // 👈 control size here
                height: AppSize.appSize22,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Image.asset(icon),
                ),
              ),
            ),
          ),
        ),
        if (badgeCount > 0)
          Positioned(
            right: -2,
            top: -2,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                color: AppColor.supportColor,
                shape: BoxShape.circle,
              ),
              constraints: BoxConstraints(
                minWidth: AppSize.appSize15,
                minHeight: AppSize.appSize15,
              ),
              child: Text(
                '$badgeCount',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}
