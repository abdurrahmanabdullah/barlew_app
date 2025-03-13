// ignore_for_file: depend_on_referenced_packages, duplicate_ignore

import 'package:barlew_app/features/customer/auth/create_new_password/data/rx_post_reset_password/rx.dart';
import 'package:barlew_app/features/customer/auth/forgot_password/data/rx_post_forget_pass/rx.dart';
import 'package:barlew_app/features/customer/auth/login/data/rx_post_sign_in/rx.dart';
import 'package:barlew_app/features/customer/auth/login/model/sign_in_response_model.dart';
import 'package:barlew_app/features/customer/auth/logout/data/rx_post_logout/rx.dart';
import 'package:barlew_app/features/customer/auth/signup_verify/data/rx_post-signup_verify_otp/rx.dart';
import 'package:barlew_app/features/customer/auth/signup_verify/model/sign_up_verify_model.dart';
import 'package:barlew_app/features/customer/customer_review/data/rx_post_customer_review/rx.dart';
import 'package:barlew_app/features/customer/customer_review/data/rx_post_engineer_report_issue/rx.dart';
import 'package:barlew_app/features/customer/home/model/customer_home_model.dart';
import 'package:barlew_app/features/customer/home/model/customer_home_profile_model.dart';
import 'package:barlew_app/features/customer/home/data/rx_get_customer_home_profile/rx.dart';
import 'package:barlew_app/features/customer/home/data/rx_get_customer_home_service/rx.dart';
import 'package:barlew_app/features/customer/matched_engineer/data/rx_get_match_engineer_profile/rx.dart';

import 'package:barlew_app/features/customer/matched_engineer/data/rx_post_discussion_request/rx.dart';
import 'package:barlew_app/features/customer/matched_engineer/data/rx_post_paypal_payment/rx.dart';
import 'package:barlew_app/features/customer/matched_engineer/model/match_engineer_profile_model.dart';

import 'package:barlew_app/features/customer/matched_engineer/model/paypal_pay_response_model.dart';
import 'package:barlew_app/features/customer/payment_method/model/bank_details_model.dart';
import 'package:barlew_app/features/customer/payment_method/rx_engineer_get_bank_details/rx.dart';
import 'package:barlew_app/features/customer/problmes/data/rx.dart';
import 'package:barlew_app/features/engineer/Engineer_edit_profile/data/rx_post_Engineer_portfolio_image_delete_data/rx.dart';
import 'package:barlew_app/features/engineer/Engineer_edit_profile/data/rx_post_profile_pic_update/rx.dart';
import 'package:barlew_app/features/engineer/engineer_edit_profile/data/rx_post_Engineer_edit_profile_data/rx.dart';

import 'package:barlew_app/features/engineer/balance/data/rx_engineer_get_details_balance/rx.dart';
import 'package:barlew_app/features/engineer/balance/model/engineer_balance_details_model.dart';
import 'package:barlew_app/features/engineer/engineer_auth/create_new_password/data/rx_create_new_password/rx.dart';
import 'package:barlew_app/features/engineer/engineer_auth/engineer_forget_password/data/rx_post_forget_password/rx.dart';

import 'package:barlew_app/features/engineer/engineer_auth/engineer_login/data/rx_login/rx.dart';
import 'package:barlew_app/features/engineer/engineer_auth/engineer_login/model/engineer_login_response_model.dart';
import 'package:barlew_app/features/customer/edit_profile/data/rx_post_update_profile_data/rx.dart';
import 'package:barlew_app/features/customer/personal_Information/data/rx_customer_profile/rx.dart';
import 'package:barlew_app/features/customer/personal_Information/model/customer_profile_model.dart';
import 'package:barlew_app/features/engineer/engineer_auth/engineer_logout/data/rx_post_logout/rx_post_logout/rx.dart';
import 'package:barlew_app/features/engineer/engineer_auth/engineer_register/data/rx_engineer_lavel/rx.dart';
import 'package:barlew_app/features/engineer/engineer_auth/engineer_register/data/rx_engineer_skill/rx.dart';
import 'package:barlew_app/features/engineer/engineer_auth/engineer_register/data/rx_post_engineer_signup/rx.dart';
import 'package:barlew_app/features/engineer/engineer_auth/engineer_register/model/engineer_lavel_model.dart';
import 'package:barlew_app/features/engineer/engineer_auth/engineer_register/model/engineer_skill_model.dart';
import 'package:barlew_app/features/engineer/engineer_auth/engineer_signup_verify/data/rx_post_verify_email/rx.dart';
import 'package:barlew_app/features/engineer/engineer_auth/engineer_signup_verify/model/engineer_signup_otp_verify_model.dart';
import 'package:barlew_app/features/customer/auth/verify_email/data/rx_post_verify_otp/rx.dart';
import 'package:barlew_app/features/customer/auth/verify_email/model/customer_otp_response_model.dart';
import 'package:barlew_app/features/engineer/engineer_average_review/model/engineer_average_review_model.dart';
import 'package:barlew_app/features/engineer/engineer_average_review/rx_get_Engineer_Average_review/rx.dart';

import 'package:barlew_app/features/engineer/engineer_review/data/rx_get_Engineer_review/rx.dart';
import 'package:barlew_app/features/engineer/engineer_review/model/engineer_review_model.dart';
import 'package:barlew_app/features/engineer/home/data/rx_get_engineer_accept_/rx.dart';

import 'package:barlew_app/features/engineer/home/data/rx_post_engineer_denied/rx.dart';
import 'package:barlew_app/features/engineer/home/data/rx_engineer_task_list/rx.dart';
import 'package:barlew_app/features/engineer/home/model/engineer_task_list_model.dart';
import 'package:barlew_app/features/engineer/payment_method/data/rx_post_bank_details_data/rx.dart';
import 'package:barlew_app/features/engineer/payment_method/data/rx_post_withdrawal_request/rx.dart';
import 'package:barlew_app/features/engineer/personal_information/data/rx_engineer_profile/rx.dart';
import 'package:barlew_app/features/engineer/personal_information/model/engineer_profile_model.dart';

import 'package:rxdart/subjects.dart';
import 'package:barlew_app/features/customer/auth/sign_up/data/rx_post_signup/rx.dart';

//customer Sign Up RxObj
CustomerSignUpRx customerSignUpRxObj =
    CustomerSignUpRx(empty: {}, dataFetcher: BehaviorSubject<Map>());
EngineerSignUpRx signUpRxObj =
    EngineerSignUpRx(empty: {}, dataFetcher: BehaviorSubject<Map>());

/// sign up registration
EngineerSignUpRx engineerSignUpRxObj =
    EngineerSignUpRx(empty: {}, dataFetcher: BehaviorSubject<Map>());

//sign up verify otp
CustomerSignUpOtpVerifyRX signUpOtpVerifyRXObj = CustomerSignUpOtpVerifyRX(
    empty: CustomerSignUpVerifyModel(),
    dataFetcher: BehaviorSubject<CustomerSignUpVerifyModel>());

// Engineer login
EngineerLoginRX engineerLoginRxObj = EngineerLoginRX(
    empty: engineer_login_response_model(),
    dataFetcher: BehaviorSubject<engineer_login_response_model>());

// //logout
LogoutRx logOutRxObj = LogoutRx(empty: {}, dataFetcher: BehaviorSubject<Map>());

// //send otp

PostVerifyOTPRx postVerifyOTPRxObj = PostVerifyOTPRx(
    empty: EngineerSignupOtpVerifyModel(),
    dataFetcher: BehaviorSubject<EngineerSignupOtpVerifyModel>());

CustomerSignUpOtpVerifyRX customerSignUpOtpVerifyRXObj =
    CustomerSignUpOtpVerifyRX(
        empty: CustomerSignUpVerifyModel(),
        dataFetcher: BehaviorSubject<CustomerSignUpVerifyModel>());

//sign up verify otp
CustomerSignInRX customerSignInRXObj = CustomerSignInRX(
    empty: CustomerSignInResponseModel(),
    dataFetcher: BehaviorSubject<CustomerSignInResponseModel>());

//customer Logout RxObj
CustomerLogoutRx customerLogoutRxObj =
    CustomerLogoutRx(empty: {}, dataFetcher: BehaviorSubject<Map>());

//customer Forget Pass RXObj
CustomerForgetPassRX customerForgetPassRXObj =
    CustomerForgetPassRX(empty: {}, dataFetcher: BehaviorSubject<Map>());

//customer Forget Pass RXObj
CustomerForgetOtpRX customerForgetOtpRXObj = CustomerForgetOtpRX(
    empty: CustomerOtpResponseModel(),
    dataFetcher: BehaviorSubject<CustomerOtpResponseModel>());

//customer Reset Pass RXObj
CustomerResetPassRX customerResetPassRXObj =
    CustomerResetPassRX(empty: {}, dataFetcher: BehaviorSubject<Map>());

//customer Profile RXObj
CustomerProfileRX customerProfileRXObj = CustomerProfileRX(
    empty: CustomerProfileModel(),
    dataFetcher: BehaviorSubject<CustomerProfileModel>());

//customer Edit Profile RXObj
CustomerEditProfileRX customerEditProfileRXObj =
    CustomerEditProfileRX(empty: {}, dataFetcher: BehaviorSubject<Map>());

/// engineer profile
EngineerProfileRX engineerProfileRXObj = EngineerProfileRX(
    empty: EngineerProfileModel(),
    dataFetcher: BehaviorSubject<EngineerProfileModel>());

//profile pic update
PostProfilePicUpdateRx postProfilePicUpdateRxObj =
    PostProfilePicUpdateRx(empty: {}, dataFetcher: BehaviorSubject<Map>());

///engineer skill
EngineerSkillRX engineerSkillRXobj = EngineerSkillRX(
    empty: Engineerskillmodel(),
    dataFetcher: BehaviorSubject<Engineerskillmodel>());

/// forget password otp
ForgetPasswordSendOTPRx forgetPasswordSendOTPRxObj =
    ForgetPasswordSendOTPRx(empty: {}, dataFetcher: BehaviorSubject<Map>());

///  engineer reset  password
EngineerResetPassRX engineerResetPassRXobj =
    EngineerResetPassRX(empty: {}, dataFetcher: BehaviorSubject<Map>());

///  engineer edit profile
EngineerEditProfileRX engineerEditProfileRXobj =
    EngineerEditProfileRX(empty: {}, dataFetcher: BehaviorSubject<Map>());

//Engineer Delete portfolio
EngineerPortfolioDeleteRX engineerPortfolioDeleteRXobj =
    EngineerPortfolioDeleteRX(empty: {}, dataFetcher: BehaviorSubject<Map>());

//Engineer Lavel portfolio
EngineerLavelRX engineerLavelRXobj = EngineerLavelRX(
    empty: engineerlavelmodel(),
    dataFetcher: BehaviorSubject<engineerlavelmodel>());

/// engineer profile
CustomerHomeServiceRX customerHomeServiceRXobj = CustomerHomeServiceRX(
    empty: CustomerHomeServiceModel(),
    dataFetcher: BehaviorSubject<CustomerHomeServiceModel>());

/// engineer Review
EngineerRevieweRX engineerRevieweRXobj = EngineerRevieweRX(
    empty: EngineerReviewModel(),
    dataFetcher: BehaviorSubject<EngineerReviewModel>());

/// customer home profile
CustomerHomeProfileRX customerHomeProfileRXobj = CustomerHomeProfileRX(
    empty: CustomerHomeProfileModel(),
    dataFetcher: BehaviorSubject<CustomerHomeProfileModel>());

/// engineer Review
EngineerAverageRevieweRX engineerAveratgeRevieweRXobj =
    EngineerAverageRevieweRX(
        empty: EngineerAverageReviewModel(),
        dataFetcher: BehaviorSubject<EngineerAverageReviewModel>());

///customer to engineer  request
CustomerToEngineerRequestRX customerToEngineerRequestRXobj =
    CustomerToEngineerRequestRX(
  empty: {},
  dataFetcher: BehaviorSubject<Map>(),
);

//Engineer Delete portfolio
SubmitProblemRX submitProblemRXobj =
    SubmitProblemRX(empty: {}, dataFetcher: BehaviorSubject<Map>());

//Engineer Accept   request
EngineerAcceptRX engineerAcceptRXobj =
    EngineerAcceptRX(empty: {}, dataFetcher: BehaviorSubject<Map>());

//Engineer  Denied  request
EngineerDeniedRX engineerDeniedRXobj =
    EngineerDeniedRX(empty: {}, dataFetcher: BehaviorSubject<Map>());

//Customer give  rating
CustomerRatingRX customerRatingRXobj =
    CustomerRatingRX(empty: {}, dataFetcher: BehaviorSubject<Map>());

EngineerBalanceDetailsRX engineerBalanceDetailsRXobj = EngineerBalanceDetailsRX(
    empty: BalanceDetailsResponseModel(),
    dataFetcher: BehaviorSubject<BalanceDetailsResponseModel>());

///--------- task list
EngineerTaskListRX engineerTaskListRXobj = EngineerTaskListRX(
    empty: EngineerTaskResponseModel(),
    dataFetcher: BehaviorSubject<EngineerTaskResponseModel>());

////------------ report issue  against engineer

EngineerReportRX engineerReportRXobj =
    EngineerReportRX(empty: {}, dataFetcher: BehaviorSubject<Map>());

//// Engineer Bank Details

EngineerBankDetailsRX engineerBankDetailsRXobj =
    EngineerBankDetailsRX(empty: {}, dataFetcher: BehaviorSubject<Map>());
////  get bank details
EngineerGetBankDetailsRX engineerGetBankDetailsRXobj = EngineerGetBankDetailsRX(
    empty: BankDetailsResponseModel(),
    dataFetcher: BehaviorSubject<BankDetailsResponseModel>());

///------- withdrawl request

EngineerWithdrawlRequestRX engineerWithdrawlRequestRXobj =
    EngineerWithdrawlRequestRX(empty: {}, dataFetcher: BehaviorSubject<Map>());
////  get bank details
PaypalPayRequestRX paypalPayRequestRXobj = PaypalPayRequestRX(
    empty: PaypalpayResponseModel(),
    dataFetcher: BehaviorSubject<PaypalpayResponseModel>());

////  MatchEngineerProfile
MatchEngineerProfileRX matchEngineerProfileRXobj = MatchEngineerProfileRX(
    empty: MatchEngineerProfileModel(),
    dataFetcher: BehaviorSubject<MatchEngineerProfileModel>());
