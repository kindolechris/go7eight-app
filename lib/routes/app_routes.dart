import 'package:get/get.dart';
import 'package:prime_social_media_flutter_ui_kit/views/home_screen/buyer_home_view.dart';
import 'package:prime_social_media_flutter_ui_kit/views/forgot_password/otp_verify_phone.dart';
import 'package:prime_social_media_flutter_ui_kit/views/home/home_view_old.dart';
import 'package:prime_social_media_flutter_ui_kit/views/home/messages/call/call_ringing_view.dart';
import 'package:prime_social_media_flutter_ui_kit/views/home/messages/call/call_view.dart';
import 'package:prime_social_media_flutter_ui_kit/views/home/messages/call/duo_call_view.dart';
import 'package:prime_social_media_flutter_ui_kit/views/home/messages/call/multiple_call_view.dart';
import 'package:prime_social_media_flutter_ui_kit/views/home/messages/camera_view.dart';
import 'package:prime_social_media_flutter_ui_kit/views/home/messages/messages_chat_view.dart';
import 'package:prime_social_media_flutter_ui_kit/views/home/messages/messages_view.dart';
import 'package:prime_social_media_flutter_ui_kit/views/home/messages/video_call/group_video_call_view.dart';
import 'package:prime_social_media_flutter_ui_kit/views/home/messages/video_call/video_call_ringing_view.dart';
import 'package:prime_social_media_flutter_ui_kit/views/home/options/reel/reel_full_view.dart';
import 'package:prime_social_media_flutter_ui_kit/views/home/options/repost/repost_view.dart';
import 'package:prime_social_media_flutter_ui_kit/views/home/options/story/story_with_message_view.dart';
import 'package:prime_social_media_flutter_ui_kit/views/home/post/all_post_view.dart';
import 'package:prime_social_media_flutter_ui_kit/views/home/search/search_view.dart';
import 'package:prime_social_media_flutter_ui_kit/views/new_post/reel/create_reel_view.dart';
import 'package:prime_social_media_flutter_ui_kit/views/new_post/reel/reel_capture_view.dart';
import 'package:prime_social_media_flutter_ui_kit/views/new_post/reel/reel_edit_view.dart';
import 'package:prime_social_media_flutter_ui_kit/views/new_post/reel/reel_upload_image_edit_view.dart';
import 'package:prime_social_media_flutter_ui_kit/views/new_post/reel/reel_upload_view.dart';
import 'package:prime_social_media_flutter_ui_kit/views/profile/edit_profile_view.dart';
import 'package:prime_social_media_flutter_ui_kit/views/settings/about_view.dart';
import 'package:prime_social_media_flutter_ui_kit/views/settings/account_view.dart';
import 'package:prime_social_media_flutter_ui_kit/views/settings/block_view.dart';
import 'package:prime_social_media_flutter_ui_kit/views/settings/comment_view.dart';
import 'package:prime_social_media_flutter_ui_kit/views/settings/help_view.dart';
import 'package:prime_social_media_flutter_ui_kit/views/settings/hidden_words_view.dart';
import 'package:prime_social_media_flutter_ui_kit/views/settings/hide_story_view.dart';
import 'package:prime_social_media_flutter_ui_kit/views/settings/language_view.dart';
import 'package:prime_social_media_flutter_ui_kit/views/settings/like_view.dart';
import 'package:prime_social_media_flutter_ui_kit/views/settings/notifications_option_view.dart';
import 'package:prime_social_media_flutter_ui_kit/views/settings/repost_option_view.dart';
import 'package:prime_social_media_flutter_ui_kit/views/profile/options/qr_code_view.dart';
import 'package:prime_social_media_flutter_ui_kit/views/reels/reels_view.dart';
import 'package:prime_social_media_flutter_ui_kit/views/splash/get_started.dart';
import 'package:prime_social_media_flutter_ui_kit/views/welcome/welcome_view.dart';
import 'package:prime_social_media_flutter_ui_kit/views/widget/home/reels_play_full_view.dart';
import '../views/forgot_password/find_your_account.dart';
import '../views/forgot_password/otp_verify_email.dart';
import '../views/forgot_password/reset_password.dart';
import '../views/home/buyer/buyer_dashboard_follewers.dart';
import '../views/home/buyer/checkout/orderConfirmationPage.dart';
import '../views/home/buyer/checkout/product_checkout.dart';
import '../views/home/messages/video_call/video_call_view.dart';
import '../views/home/options/story/story_view.dart';
import '../views/home/seller/monitize_page1.dart';
import '../views/home/seller/monitize_physical_product.dart';
import '../views/home/seller/post_promote.dart';
import '../views/home/seller/seller_profile.dart';
import '../views/home/seller/update_business_info.dart';
import '../views/home_screen/seller_home_view.dart';
import '../views/login/signin_page.dart';
import '../views/notification/notification_main.dart';
import '../views/profile/active_orders.dart';
import '../views/profile/deliveries.dart';
import '../views/profile/my_cart.dart';
import '../views/profile/my_cart_checkout.dart';
import '../views/profile/my_wishlist.dart';
import '../views/profile/savePaymentDetails.dart';
import '../views/profile/seller_verification.dart';
import '../views/profile/transaction_history.dart';
import '../views/settings/settings.dart';
import '../views/signup/otp_verify_email.dart';
import '../views/signup/otp_verify_phone.dart';
import '../views/signup/signup_page.dart';
import '../views/signup/signup_page2.dart';
import '../views/splash/get_started2.dart';
import '../views/splash/splash_screen.dart';

class AppRoutes {
  static const String splashView = "/splash_view";
  static const String getStarted = "/get_started";
  static const String getStarted2 = "/get_started2";
  static const String loginView = "/login_view";
  static const String signUpView = "/sign_up_view";
  static const String signUpView2 = "/sign_up_view2";
  static const String yourAccountView = "/your_account_view";
  static const String codeConfirmationView = "/code_confirmation_view";
  static const String otpVerifyEmail = "/otp_verify_email";
  static const String otpVerifyPhone = "/otp_verify_phone";
  static const String resetPasswordView = "/reset_password_view";
  static const String otpVerifyPhoneSignUp = "/otp_verify_phone_sign_up";
  static const String otpVerifyEmailSignUp = "/otp_verify_email_sign_up";
  static const String welcomeView = "/welcome_view";
  static const String homeView = "/home_view";
  static const String storyFullView = "/story_full_view";
  static const String reelFullView = "/reel_full_view";
  static const String repostView = "/repost_view";
  static const String searchView = "/search_view";
  static const String allPostView = "/all_post_view";
  static const String reelsPlayFullView = "/reels_play_full_view";
  static const String storyWithMessageView = "/story_with_message_view";
  static const String messagesView = "/messages_view";
  static const String messagesChatView = "/messages_chat_view";
  static const String cameraView = "/camera_view";
  static const String callView = "/call_view";
  static const String callRingingView = "/call_ringing_view";
  static const String duoCallView = "/duo_call_view";
  static const String multipleCallView = "/multiple_call_view";
  static const String videoCallRingingView = "/video_call_ringing_view";
  static const String videoCallView = "/video_call_view";
  static const String groupVideoCallView = "/group_video_call_view";
  static const String buyerHomeView = "/buyer_home_view";
  static const String sellerHomeView = "/seller_home_view";
  static const String settings = "/settings";
  static const String accountSetting = "/account_settings";
  static const String notificationSettings = "/notification_settings";
  static const String blockUserSetting = "/block_user_settings";
  static const String hideStorySetting = "/hide_story_settings";
  static const String likeSetting = "/like_settings";
  static const String commentSetting = "/comment_settings";
  static const String repostSetting = "/repost_settings";
  static const String hiddenWordsSetting = "/hidden_words_settings";
  static const String languageSetting = "/language_settings";
  // static const String about = "/story_view";

  static const String productCheckout = "/product_checkout";
  static const String orderConfirmation = "/order_confirmation";
  static const String notification = "/notification";
  static const String sellerVerification = "/seller_verification";
  static const String sellerProfile = "/seller_profile";
  static const String postPromote = "/post_promote";
  static const String monitizePageFirst = "/monitize_page_first";
  static const String monitizePhysicalProduct = "/monitize_physical_product";
  static const String updateBusinessInfo = "/update_business_info";
  static const String activeOrders = "/active_orders";
  static const String myCart = "/my_cart";
  static const String myCartCheckout = "/my_cart_checkout";
  static const String myWishlist = "/my_wishlist";
  static const String deliveries = "/deliveries";
  static const String purchaseHistory = "/purchase_history";
  static const String savedPaymentDetails = "/saved_payment_details";

  static const String createReelView = "/create_reel_view";
  static const String reelCaptureView = "/reel_capture_view";
  static const String reelEditView = "/reel_edit_view";
  static const String reelUploadView = "/reel_upload_view";
  static const String reelUploadImageEditView = "/reel_upload_image_edit_view";
  static const String qrCodeView = "/qr_code_view";
  static const String settingsView = "/settings_view";
  static const String accountView = "/account_view";
  static const String notificationsOptionView = "/notifications_option_view";
  static const String blockView = "/block_view";
  static const String hideStoryView = "/hide_story_view";
  static const String likeView = "/like_view";
  static const String commentView = "/comment_view";
  static const String repostOptionView = "/repost_option_view";
  static const String hiddenWordsView = "/hidden_words_view";
  static const String languageView = "/language_view";
  static const String helpView = "/help_view";
  static const String aboutView = "/about_view";
  static const String editProfileView = "/edit_profile_view";
  static const String reelsView = "/reels_view";
  //buyer
  static const String buyerDashboard = "/buyer_dashboard";

  static List<GetPage> pages = [
    GetPage(name: splashView, page: () => SplashScreen()),
    GetPage(name: getStarted, page: () => GetStarted()),
    GetPage(name: getStarted2, page: () => GetStarted2Page()),
    GetPage(name: loginView, page: () => SignInPage()),
    GetPage(name: signUpView, page: () => SignupPage()),
    GetPage(name: signUpView2, page: () => SignupPage2()),
    GetPage(name: otpVerifyPhoneSignUp, page: () => OtpVerifyPhoneSignUp()),
    GetPage(name: otpVerifyEmailSignUp, page: () => OtpVerifyEmailSignUp()),
    GetPage(name: yourAccountView, page: () => FindYourAccount()),
    GetPage(name: otpVerifyEmail, page: () => OtpVerifyEmail()),
    GetPage(name: otpVerifyPhone, page: () => OtpVerifyPhone()),
    GetPage(name: resetPasswordView, page: () => ResetPassword()),
    GetPage(name: buyerHomeView, page: () => BuyerHomeView()),
    GetPage(name: sellerHomeView, page: () => SallerHomeView()),
    GetPage(name: productCheckout, page: () => ProductCheckoutPage()),
    GetPage(name: orderConfirmation, page: () => OrderConfirmationPage()),
    GetPage(name: buyerDashboard, page: () => BuyerDashboardPage()),
    GetPage(name: homeView, page: () => HomeView()),
    GetPage(name: notification, page: () => MessagesNotificationsPage()),
    GetPage(name: messagesChatView, page: () => MessagesChatView()),
    GetPage(name: sellerVerification, page: () => SellerVerificationForm()),
    GetPage(name: sellerProfile, page: () => SellerProfilePage()),
    GetPage(name: postPromote, page: () => PromotePostPage()),
    GetPage(name: monitizePageFirst, page: () => MonitizePage1()),
    GetPage(
        name: monitizePhysicalProduct,
        page: () => PhysicalProductCheckoutPage()),
    GetPage(name: updateBusinessInfo, page: () => UpdateBusinessInfo()),
    GetPage(name: activeOrders, page: () => ActiveOrdersPage()),
    GetPage(name: myCart, page: () => MyCartPage()),
    GetPage(name: myCartCheckout, page: () => CheckoutPage()),
    GetPage(name: myWishlist, page: () => MyWishlistPage()),
    GetPage(name: deliveries, page: () => DeliveriesPage()),
    GetPage(name: purchaseHistory, page: () => TransactionHistoryPage()),
    GetPage(name: savedPaymentDetails, page: () => SavedPaymentDetailsPage()),

    
    GetPage(name: welcomeView, page: () => const WelcomeView()),
    GetPage(name: storyFullView, page: () => StoryFullView()),
    GetPage(name: reelFullView, page: () => ReelFullView()),
    GetPage(name: repostView, page: () => RepostView()),
    GetPage(name: searchView, page: () => SearchView()),
    GetPage(name: allPostView, page: () => AllPostView()),
    GetPage(name: reelsPlayFullView, page: () => ReelsPlayFullView()),
    GetPage(name: storyWithMessageView, page: () => StoryWithMessageView()),
    GetPage(name: messagesView, page: () => MessagesView()),
    GetPage(name: cameraView, page: () => CameraView()),
    GetPage(name: callView, page: () => CallView()),
    GetPage(name: callRingingView, page: () => CallRingingView()),
    GetPage(name: duoCallView, page: () => DuoCallView()),
    GetPage(name: multipleCallView, page: () => MultipleCallView()),
    GetPage(name: videoCallRingingView, page: () => VideoCallRingingView()),
    GetPage(name: videoCallView, page: () => VideoCallView()),
    GetPage(name: groupVideoCallView, page: () => GroupVideoCallView()),
    GetPage(name: createReelView, page: () => CreateReelView()),
    GetPage(name: reelCaptureView, page: () => ReelCaptureView()),
    GetPage(name: reelEditView, page: () => ReelEditView()),
    GetPage(name: reelUploadView, page: () => ReelUploadView()),
    GetPage(
        name: reelUploadImageEditView, page: () => ReelUploadImageEditView()),
    GetPage(name: qrCodeView, page: () => QRCodeView()),
    GetPage(name: settings, page: () => SettingsPage()),
    GetPage(name: accountView, page: () => AccountView()),
    GetPage(
        name: notificationsOptionView, page: () => NotificationsOptionsView()),
    GetPage(name: blockView, page: () => BlockView()),
    GetPage(name: hideStoryView, page: () => HideStoryView()),
    GetPage(name: likeView, page: () => LikeView()),
    GetPage(name: commentView, page: () => CommentView()),
    GetPage(name: repostOptionView, page: () => RepostOptionView()),
    GetPage(name: hiddenWordsView, page: () => HiddenWordsView()),
    GetPage(name: languageView, page: () => LanguageView()),
    GetPage(name: helpView, page: () => HelpView()),
    GetPage(name: aboutView, page: () => AboutView()),
    GetPage(name: editProfileView, page: () => EditProfileView()),
    GetPage(name: reelsView, page: () => ReelsView()),
  ];
}
