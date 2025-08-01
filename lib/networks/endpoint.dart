// ignore_for_file: constant_identifier_names

const String url = "https://barlew.softvencefsd.xyz";
const String imageUrl = "$url/";

final class NetworkConstants {
  NetworkConstants._();
  static const ACCEPT = "Accept";
  static const APP_KEY = "App-Key";
  static const ACCEPT_LANGUAGE = "Accept-Language";
  static const ACCEPT_LANGUAGE_VALUE = "pt";
  static const APP_KEY_VALUE = String.fromEnvironment("APP_KEY_VALUE");
  static const ACCEPT_TYPE = "application/json";
  static const AUTHORIZATION = "Authorization";
  static const CONTENT_TYPE = "content-Type";
}

final class Endpoints {
  Endpoints._();

  //signup
  static String signUpEndpoint() => "/api/register";
  //signupotpverify
  static String signUpOtpVerifyEndpoint() => "/api/verify_email";

  //customer SignUp Endpoint
  static String customerSignUpEndpoint() => "/api/register";

  //customer SignUp Otp Verify Endpoint
  static String customerSignUpOtpVerifyEndpoint() => "/api/verify_email";

  //customer SignIn Endpoint
  static String customerSignInEndpoint() => "/api/login";

  //customer Logout Endpoint
  static String customerLogoutEndpoint() => "/api/logout";

  //customer Forget Pass Endpoint
  static String customerForgetPassEndpoint() => "/api/forgot-password";

  //customer Forget otp Endpoint
  static String customerForgetOtpEndpoint() => "/api/verify-otp";

  //customer Reset Pass Endpoint
  static String customerResetPassEndpoint() => "/api/reset-password";

  //customer Profile Endpoint
  static String customerProfileEndpoint() => "/api/profile";

  //customer Edit Profile Endpoint
  static String customerEditProfileEndpoint() => "/api/profile";

  //send otp
  static String engineerSignupOtpverifyEndPoint() => "/api/verify_email";

  //chnange password
  static String chnagePasswordEndPoint() => "/api/change-password";

  //log out
  static String logoutEndPoint() => "/api/logout";
////---------- engineer sign it

  static String loginEndPoint() => "/api/login";

  //Engineer Profile Endpoint
  static String engineerProfileEndpoint() => "/api/profile";

  //Engineer Profile Endpoint
  static String engineerskillEndpoint() => "/api/skills";

  /// Forget password send otp
  static String forgetpasswordotpEndpoint() => "/api/forgot-password";

  /// Forget password send otp
  static String engineerProfileUpdateEndpoint() => "/api/profile";

  /// Engineer Delete
  static String engineerpostDeleteEndpoint({required int id}) =>
      "/api/delete-portfolio/$id";

  /// Engineer lavel
  static String engineerlavelEndpoint() => "/api/engineer-level";

  /// Engineer lavel
  static String customerserviceEndpoint() => "/api/services";

  /// Engineer lavel
  static String questionEndpoint(int id) => "/api/services/questions/$id";

  /// Engineer lavel
  static String engineerReviewEndpoint() => "/api/reviews/users/list";

  ///Custome Home profile
  static String customerHomeProfileEndpoint() => "/api/profile";

  ///Custome Home profile
  static String engineerAverageReviewEndpoint() =>
      "/api/reviews/average-rating";

  //customer SignIn Endpoint
  static String customerToRequestEndpoint() => "/api/discussion/request";
  //engineer notification
  static String notificationEndpoint() => "/api/notifications";

//user-answer
  static String userAnswerEndpoint() => "/api/engineer/send-request";

  //engineer  request accept
  static String engineerAcceptEndpoint({required int id}) =>
      "/api/engineers/request-accept/$id";

  /// engineer  request denied
  static String engineerDeniedEndpoint({required int id}) =>
      "/api/engineers/request-decline/$id";
  //user-answer

  /// customer rating
  static String customerReviewsEndpoint() => "/api/reviews";

  //Engineer Balance Details
  static String engineerBalanceDetailsEndpoint() => "/api/engineers/balance";
  //Engineer task list end posint
  static String engineeTaskListEndpoint({required String endPart}) =>
      "/api/engineers/tasks$endPart";

  static String engineerReportEndpoint() => "/api/report-issues";

  static String engineerBankDetailsEndpoint() => "/api/engineers/bank-details";
  static String engineerGetBankDetailsEndpoint() =>
      "/api/engineers/get/bank-details";

  /// withdrawal request
  static String engineerWithdrawalrequestEndpoint() =>
      "/api/engineers/withdrawal-request";

  /// withdrawal request
  static String paypalPaymentEndpoint() => "/api/paypal/pay";

  /// withdrawal request
  static String engineerMatchProfileEndpoint({required String requestId}) =>
      "/api/engineer-profile-with-services/$requestId";

  static String customerWorkHistoryEndpoint({required String endPart}) =>
      "/api/working-history$endPart";

  //engineer  request accept
  static String historyDetailsEndpoint({required int id}) =>
      "/api/working-history/$id";
}
