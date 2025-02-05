import 'package:go7eight/src/core/enums/session_type_enum.dart';
import 'package:go7eight/src/data/dummy_dataset/challenge_data_by_category.dart';
import 'package:go7eight/src/data/dummy_dataset/session_data_by_category.dart';
import 'package:go7eight/src/models/cart_model.dart';
import 'package:go7eight/src/models/challenge_model.dart';
import 'package:go7eight/src/models/session_model.dart';
import 'package:go7eight/src/modules/panels/student/challenge/bindings/challenge_binding.dart';
import 'package:go7eight/src/modules/panels/student/challenge/views/challenge_details_view.dart';
import 'package:go7eight/src/modules/panels/student/payment/bindings/payment_binding.dart';
import 'package:go7eight/src/modules/panels/student/payment/views/payment_view.dart';
import 'package:go7eight/src/modules/panels/student/session/bindings/session_binding.dart';
import 'package:go7eight/src/modules/panels/student/session/views/session_details_view.dart';
import 'package:go7eight/src/modules/panels/student/session/views/trending_session_list_view.dart';
import '../../../../../core/app_export.dart';

class CartController extends GetxController {
  RxBool proceedToPurchase = false.obs;

  final RxList<CartModel> cartChanllenges = List.generate(
    2,
    (index) => CartModel(
      name: "${getNutritionChallengeListData()[index + 2].title}",
      id: index,
      imagePath: "${getNutritionChallengeListData()[index + 2].imagePath}",
      price: "${getNutritionChallengeListData()[index + 2].price}",
      desc: "",
      macros: [
        CartMacroModel(
          id: 0,
          value: "150",
          unit: "Cal",
          iconPath: AppIcon.caloriesIcon,
        ),
        CartMacroModel(
          id: 0,
          value: "15",
          unit: "Min",
          iconPath: AppIcon.clockIcon,
        )
      ],
    ),
  ).obs;

  final RxList<CartModel> cartSessions = List.generate(
    3,
    (index) => CartModel(
      name: "${getStrengthSessionListData()[index + 3].title}",
      id: index,
      imagePath: "${getStrengthSessionListData()[index + 3].imagePath}",
      price: "${getStrengthSessionListData()[index + 3].price}",
      desc: "",
      macros: [
        CartMacroModel(
          id: 0,
          value: "150",
          unit: "Cal",
          iconPath: AppIcon.caloriesIcon,
        ),
        CartMacroModel(
          id: 0,
          value: "15",
          unit: "Min",
          iconPath: AppIcon.clockIcon,
        )
      ],
    ),
  ).obs;

  addMoreItemClick() {
    Get.to(() => const TrendingSessionListView(),
        binding: SessionBinding(),
        duration: const Duration(milliseconds: 500),
        transition: Transition.fadeIn);
  }

  proceedToCheckout() {
    Get.to(() => const PaymentView(),
        binding: PaymentBinding(),
        duration: const Duration(milliseconds: 500),
        transition: Transition.fadeIn);
  }

  void singleSessionClick(SessionType sessionType, bool purchasedSession,
      SessionModel sessionModel) {
    Get.to(
        () => SessionDetailsView(
            mySession: purchasedSession,
            session: sessionModel,
            sessionType: sessionType),
        binding: SessionBinding(),
        duration: const Duration(milliseconds: 500),
        transition: Transition.fadeIn);
  }

  gotoChallengeDetailedView(SessionType sessionType, bool purchasedChallenge,
      {required ChallengeModel challengeModel}) {
    Get.to(
        () => ChallengeDetailsView(
              title: "challenge_title",
              challenge: challengeModel,
              myChallenge: purchasedChallenge,
              sessionType: sessionType,
            ),
        binding: ChallengeBinding(),
        duration: const Duration(milliseconds: 500),
        transition: Transition.fadeIn);
  }
}
