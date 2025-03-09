import 'dart:io';

import 'package:barlew_app/features/add_card/presentation/add_card_screen.dart';
import 'package:barlew_app/features/customer/auth/sign_up/presentation/register_screen.dart';
import 'package:barlew_app/features/customer/auth/signup_verify/presentation/sign_up_verify_screen.dart';
import 'package:barlew_app/features/customer/chat/presentation/call_screen.dart';
import 'package:barlew_app/features/customer/chat/presentation/messenging_screen.dart';
import 'package:barlew_app/features/customer/customer_review/widget/report_bottom_sheet.dart';
import 'package:barlew_app/features/customer/engineer_level/presentation/engineer_level_screen.dart';
import 'package:barlew_app/features/customer/matched_engineer/presentation/matched_engineer_screen.dart';
import 'package:barlew_app/features/customer/notification/presentations/notification_screen.dart';

import 'package:barlew_app/features/customer/waiting_screen/presentation/waiting_screen.dart';
import 'package:barlew_app/features/engineer/Income_history/presentations/Income_history_screen.dart';
import 'package:barlew_app/features/engineer/engineer_edit_profile/presentation/engineer_edit_profile_screen.dart';
import 'package:barlew_app/features/engineer/engineer_auth/create_new_password/engineer_create_new_pass_screen.dart';
import 'package:barlew_app/features/engineer/engineer_auth/engineer_forget_password/presentations/engineer_forgot_password_screen.dart';
import 'package:barlew_app/features/engineer/engineer_auth/engineer_login/presentation/engineer_login_screen.dart';
import 'package:barlew_app/features/engineer/engineer_auth/engineer_register/presentations/engineer_register_screen.dart';
import 'package:barlew_app/features/engineer/engineer_auth/engineer_signup_verify/presentation/engineer_sign_up_verify_screen.dart';
import 'package:barlew_app/features/engineer/engineer_auth/engineer_verify_email/presentations/engineer_verify_email_screen.dart';
import 'package:barlew_app/features/engineer_navigations_bar/presentations/enginner_navigations_bar.dart';
import 'package:barlew_app/features/engineer/engineer_notifications/presentations/enginner_notifications_screen.dart';
import 'package:barlew_app/features/engineer/home/presentatiosn/engineer_home_screen.dart';
import 'package:barlew_app/features/engineer/messenging/presentation/engineer_messenging_screen.dart';
import 'package:barlew_app/features/engineer/privacy_policy/presentations/privacy_policy_screen.dart';
import 'package:barlew_app/features/engineer/setting/presentations/engineer_setting_screen.dart';
import 'package:barlew_app/features/engineer/payment_method/presentation/engineer_payment_method_screen.dart';
import 'package:barlew_app/features/customer/payment/presentation/payment_screen.dart';
import 'package:barlew_app/features/customer/payment_information/presentation/payment_information_screen.dart';
import 'package:barlew_app/features/customer/payment_method/presentation/payment_method_screen.dart';
import 'package:barlew_app/features/customer/payment_success/presentation/payment_success_screen.dart';
import 'package:barlew_app/features/customer/customer_review/presentation/customer_review_screen.dart';
import 'package:barlew_app/features/engineer/withdraw_success/presentation/withdraw_success_screen.dart';
import 'package:barlew_app/onboard_screen.dart';
import 'package:flutter/cupertino.dart';
import '../features/customer/auth/create_new_password/presentation/create_new_password.dart';
import '../features/customer/auth/forgot_password/presentation/forgot_password_screen.dart';
import '../features/customer/auth/login/presentation/login_screen.dart';
import '../features/customer/auth/verify_email/presentation/verify_email_screen.dart';
import '../features/customer/chat/presentation/chat_screen.dart';
import '../features/customer/home/presentation/customer_home_service_screen.dart';
import '../features/customer/edit_profile/presentations/edit_profile_screen.dart';
import '../features/customer/history_details/presentations/history_details_screen.dart';

import '../features/customer_navigations_bar/presentations/navigations_bar_screen.dart';

import '../features/customer/problmes/presentatiosn/problmes_screen.dart';
import '../features/customer/questions_page/presentations/questions_page_screen.dart';

import '../features/customer/task_history/presentations/task_history_screen.dart';

final class Routes {
  static final Routes _routes = Routes._internal();
  Routes._internal();
  static Routes get instance => _routes;
  static const String onboardScreen = '/OnboardScreen';
  static const String splashScreen = '/SplashScreen';
  static const String loginScreen = '/LoginScreen';
  static const String customerHomeScreen = '/CustomerHomeScreen';
  static const String registerScreen = '/RegisterScreen';
  static const String forgotPasswordScreen = '/forgotPasswordScreen';
  static const String verifyEmailScreen = '/verifyEmailScreen';
  static const String createNewPasswordScreen = '/createNewPasswordScreen';
  static const String questionsPageScreen = '/questionsPageScreen';
  static const String questionsPageTwoScreen = '/questionsPageTwoScreen';
  static const String questionsPageThreeScreen = '/questionsPageThreeScreen';
  static const String questionsPageForScreen = '/questionsPageForScreen';
  static const String problemsScreen = '/problemsScreen';
  static const String navigationsBarScreen = '/navigationsBarScreen';
  static const String notificationScreen = '/notificationScreen';
  static const String editProfileScreen = '/editProfileScreen';
  static const String personalInformationScreen = '/personalInformationScreen';
  static const String taskHistoryScreen = '/taskHistoryScreen';
  static const String historyDetailsScreen = '/historyDetailsScreen';
  static const String matchedEngineerScreen = '/matchedEngineerScreen';
  static const String chatScreen = '/ChatScreen';
  static const String paymentScreen = '/paymentScreen';
  static const String incomeHistoryScreen = '/incomeHistoryScreen';
  static const String engineerLoginScreen = '/engineerLoginScreen';
  static const String engineerRegisterScreen = '/engineerRegisterScreen';
  static const String engineerNotificationScreen =
      '/engineerNotificationScreen';
  static const String engineerHomeScreen = '/engineerHomeScreen';
  static const String engineerNavigationsBarScreen =
      '/EngineerNavigationsBarScreen';
  static const String engineerForgotPasswordScreen =
      '/engineerForgotPasswordScreen';
  static const String engineerVerifyEmailScreen = '/engineerVerifyEmailScreen';
  static const String engineerSettingScreen = '/engineerSettingScreen';
  static const String callScreen = '/callScreen';
  static const String messengingScreen = '/messengingScreen';
  static const String payment = '/payment';
  static const String paymentMethod = '/paymentMethod';
  static const String addCard = '/addCard';
  static const String paymentInformation = '/paymentInformation';
  static const String paymentSuccess = '/paymentSuccess';
  static const String customerReviewScreen = '/customerReviewScreen';
  static const String engineerLevelScreen = '/EngineerLevelScreen';

  static const String engineerPaymentMethod = '/engineerPaymentMethod';
  static const String withdrawsuccess = '/withdrawsuccess';
  static const String personalInformation = '/personalInformation';
  static const String engineerMessenging = '/engineerMessenging';
  static const String engineerEditProfile = '/engineerEditProfile';
  static const String engineerPrivacyPolicy = '/engineerPrivacyPolicy';
  static const String waitingScreen = '/waitingScreen';
  static const String engineerCreateNewPassword = '/engineerCreateNewPassword';
  static const String signupVerifyScreen = '/signupVerifyScreen';
  static const String engineerSignupVerifyScreen =
      '/engineerSignupVerifyScreen';
  static const String matchedResultScreen = '/matchedResultScreen';
  static const String reportBottomSheet = '/ReportBottomSheet';
}

final class RouteGenerator {
  static final RouteGenerator _routeGenerator = RouteGenerator._internal();
  RouteGenerator._internal();
  static RouteGenerator get instance => _routeGenerator;

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.engineerSignupVerifyScreen:
        Map args = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: ScreenTitle(
                    widget: EngineerSignUpOtpVerifyScreen(
                  email: args['email'],
                )),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => EngineerSignUpOtpVerifyScreen(
                      email: args['email'],
                    ));
      case Routes.signupVerifyScreen:
        Map args = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: ScreenTitle(
                    widget: SignUpVerifyScreen(
                  email: args['email'],
                )),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => SignUpVerifyScreen(
                      email: args['email'],
                    ));
      case Routes.engineerCreateNewPassword:
        Map args = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: ScreenTitle(
                    widget: EngineerCreateNewPassScreen(
                  email: args["email"],
                )),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => EngineerCreateNewPassScreen(
                      email: args["email"],
                    ));
      case Routes.waitingScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: WaitingScreen()),
                settings: settings)
            : CupertinoPageRoute(builder: (context) => const WaitingScreen());
      case Routes.engineerPrivacyPolicy:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: PrivacyPolicyScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const PrivacyPolicyScreen());

      case Routes.engineerEditProfile:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: EngineerEditProfileScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const EngineerEditProfileScreen());
      case Routes.engineerMessenging:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: EngineerMessengingScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const EngineerMessengingScreen());

      case Routes.engineerPaymentMethod:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget:
                    const ScreenTitle(widget: EngineerPaymentMethodScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const EngineerPaymentMethodScreen());
      case Routes.withdrawsuccess:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: WithdrawSuccessScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const WithdrawSuccessScreen());
      case Routes.paymentSuccess:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: PaymentSuccessScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const PaymentSuccessScreen());
      case Routes.customerReviewScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: CustomerReviewScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const CustomerReviewScreen());
      case Routes.paymentInformation:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: PaymentInformationScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const PaymentInformationScreen());
      case Routes.paymentMethod:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: PaymentMethodScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const PaymentMethodScreen());
      case Routes.addCard:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: AddCardScreen()),
                settings: settings)
            : CupertinoPageRoute(builder: (context) => const AddCardScreen());
      case Routes.payment:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: PaymentScreen()),
                settings: settings)
            : CupertinoPageRoute(builder: (context) => const PaymentScreen());

      case Routes.callScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: CallScreen()),
                settings: settings)
            : CupertinoPageRoute(builder: (context) => const CallScreen());

      case Routes.messengingScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: MessengingScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const MessengingScreen());
      case Routes.matchedResultScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: MatchedEngineerScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const MatchedEngineerScreen());
      case Routes.loginScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: LoginScreen()),
                settings: settings)
            : CupertinoPageRoute(builder: (context) => const LoginScreen());
      case Routes.customerHomeScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: CustomerHomeScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const CustomerHomeScreen());
      case Routes.registerScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: RegisterScreen()),
                settings: settings)
            : CupertinoPageRoute(builder: (context) => const RegisterScreen());
      case Routes.forgotPasswordScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: ForgotPasswordScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const ForgotPasswordScreen());
      case Routes.verifyEmailScreen:
        Map args = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: ScreenTitle(
                    widget: VerifyEmailScreen(
                  email: args["email"],
                )),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => VerifyEmailScreen(
                      email: args["email"],
                    ));

      case Routes.questionsPageScreen:
        final Map args = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: ScreenTitle(
                    widget: QuestionsPageScreen(
                  id: args["id"],
                )),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => QuestionsPageScreen(
                      id: args["id"],
                    ));

      case Routes.createNewPasswordScreen:
        Map args = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: ScreenTitle(
                    widget: CreateNewPasswordScreen(
                  email: args["email"],
                )),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => CreateNewPasswordScreen(
                      email: args["email"],
                    ));

      case Routes.problemsScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: ProblemsScreen()),
                settings: settings)
            : CupertinoPageRoute(builder: (context) => const ProblemsScreen());
      case Routes.navigationsBarScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: NavigationsBarScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const NavigationsBarScreen());

      case Routes.editProfileScreen:
        final args = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: ScreenTitle(
                    widget: EditProfileScreen(
                  snap: args["snap"],
                )),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => EditProfileScreen(
                      snap: args["snap"],
                    ));

      case Routes.taskHistoryScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: TaskHistoryScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const TaskHistoryScreen());

      case Routes.historyDetailsScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: HistoryDetailsScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const HistoryDetailsScreen());

      case Routes.matchedEngineerScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: MatchedEngineerScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const MatchedEngineerScreen());
      case Routes.notificationScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: NotificationScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const NotificationScreen());
      case Routes.chatScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: ChatScreen()),
                settings: settings)
            : CupertinoPageRoute(builder: (context) => const ChatScreen());

      case Routes.engineerSettingScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: EngineerSettingScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const EngineerSettingScreen());

      case Routes.paymentScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: PaymentScreen()),
                settings: settings)
            : CupertinoPageRoute(builder: (context) => const PaymentScreen());

      case Routes.incomeHistoryScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: IncomeHistoryScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const IncomeHistoryScreen());

      case Routes.engineerLoginScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: EngineerLoginScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const EngineerLoginScreen());

      case Routes.engineerRegisterScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: EngineerRegisterScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const EngineerRegisterScreen());

      case Routes.engineerNotificationScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: EngineerNotificationScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const EngineerNotificationScreen());

      case Routes.engineerHomeScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: EngineerHomeScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const EngineerHomeScreen());

      case Routes.engineerNavigationsBarScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget:
                    const ScreenTitle(widget: EngineerNavigationsBarScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const EngineerNavigationsBarScreen());

      case Routes.engineerForgotPasswordScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget:
                    const ScreenTitle(widget: EngineerForgotPasswordScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const EngineerForgotPasswordScreen());

      case Routes.engineerVerifyEmailScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: EngineerVerifyEmailScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const EngineerVerifyEmailScreen());

      case Routes.engineerLevelScreen:
        Map data = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: ScreenTitle(
                    widget: EngineerLevelScreen(
                  imageList: data["imageList"],
                  description: data["description"],
                )),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => EngineerLevelScreen(
                      imageList: data["imageList"],
                      description: data["description"],
                    ));
      case Routes.reportBottomSheet:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: ReportBottomSheet()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const ReportBottomSheet());
      case Routes.onboardScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: OnboardScreen()),
                settings: settings)
            : CupertinoPageRoute(builder: (context) => const OnboardScreen());
      default:
        return null;
    }
  }
}

class _FadedTransitionRoute extends PageRouteBuilder {
  final Widget widget;
  @override
  final RouteSettings settings;

  _FadedTransitionRoute({required this.widget, required this.settings})
      : super(
          settings: settings,
          reverseTransitionDuration: const Duration(milliseconds: 1),
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return widget;
          },
          transitionDuration: const Duration(milliseconds: 1),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return FadeTransition(
              opacity: CurvedAnimation(
                parent: animation,
                curve: Curves.ease,
              ),
              child: child,
            );
          },
        );
}

class ScreenTitle extends StatelessWidget {
  final Widget widget;

  const ScreenTitle({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: .5, end: 1),
      duration: const Duration(milliseconds: 500),
      curve: Curves.bounceIn,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: child,
        );
      },
      child: widget,
    );
  }
}
