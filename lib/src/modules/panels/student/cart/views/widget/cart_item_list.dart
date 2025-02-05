import 'package:go7eight/src/core/app_export.dart';
import 'package:go7eight/src/core/enums/session_type_enum.dart';
import 'package:go7eight/src/data/dummy_dataset/challenge_data_by_category.dart';
import 'package:go7eight/src/data/dummy_dataset/session_data_by_category.dart';
import 'package:go7eight/src/models/cart_model.dart';
import 'package:go7eight/src/modules/panels/student/cart/controllers/cart_controller.dart';

import 'background_icon_widget.dart';
import 'cart_item_widget.dart';

class CartItemList extends GetView<CartController> {
  final List<CartModel> cartList;
  final bool isChallenge;

  const CartItemList(
      {super.key, required this.cartList, required this.isChallenge});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: cartList.length,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return Dismissible(
              key: Key('item $index'),
              onDismissed: (DismissDirection direction) {
                if (direction == DismissDirection.startToEnd) {
                  SnackBarX.showSuccess(
                      title: "favorite_title", message: "favorite_message");
                } else {
                  SnackBarX.showSuccess(
                      title: "remove_title", message: "remove_message");
                }
              },
              background: const BackgroundIconWidget(
                  isPrimary: true,
                  icon: Icons.favorite_border_outlined,
                  iconColor: AppColor.grey),
              secondaryBackground: const BackgroundIconWidget(
                  isPrimary: false,
                  icon: Icons.delete_outline_rounded,
                  iconColor: AppColor.red),
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: AppRatioSize.getRatioWidth() / 24),
                child: GestureDetector(
                  onTap: () {
                    if (isChallenge) {
                      controller.gotoChallengeDetailedView(
                          SessionType.regular, false,
                          challengeModel:
                          getNutritionChallengeListData()[index + 2]);
                    } else {
                      controller.singleSessionClick(SessionType.regular, false,
                          getStrengthSessionListData()[index + 3]);
                    }
                  },
                  child: CartItemWidget(
                    cartItem: cartList[index],
                    deleteAction: () {
                      if (isChallenge) {
                        controller.cartChanllenges.remove(cartList[index]);
                        controller.cartChanllenges.refresh();
                      } else {
                        controller.cartSessions.remove(cartList[index]);
                        controller.cartSessions.refresh();
                      }
                      SnackBarX.showSuccess(
                          title: "remove_title", message: "remove_message");
                    },
                  ),
                ),
              ),
            );
          });
    });
  }
}
