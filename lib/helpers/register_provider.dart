import 'package:barlew_app/features/engineer/Engineer_edit_profile/presentation/engineer_edit_profile_screen.dart';
import 'package:barlew_app/provider/engineer_auth_provider.dart';
import 'package:barlew_app/provider/engineer_edit_provider.dart';
import 'package:barlew_app/provider/engineer_login_provider.dart';
import 'package:barlew_app/provider/image_pick_provider.dart';
import 'package:barlew_app/provider/profile_provider.dart';
import 'package:barlew_app/provider/provider.dart';
import 'package:barlew_app/provider/selected_answer_provider.dart';
import 'package:barlew_app/provider/signup_screen_provider.dart';
import 'package:provider/provider.dart';

var providers = [
  // ChangeNotifierProvider<AuthProvider>(create: ((context) => AuthProvider())),
  ChangeNotifierProvider<IndexProviders>(
      create: ((context) => IndexProviders())),
  ChangeNotifierProvider<SelectedAnswersModel>(
    create: (context) =>
        SelectedAnswersModel(), // Add your SelectedAnswersModel here
  ),
  ChangeNotifierProvider<ProfileProvider>(
      create: ((context) => ProfileProvider())),
  ChangeNotifierProvider<SignupScreenProvider>(
      create: (context) => SignupScreenProvider()),
  ChangeNotifierProvider<ImagePickerProvider>(
      create: (context) => ImagePickerProvider()),

  ChangeNotifierProvider<EngineerAuthProvider>(
      create: ((context) => EngineerAuthProvider())),

  ChangeNotifierProvider<EngineerLoginProvider>(
      create: ((context) => EngineerLoginProvider())),
  ChangeNotifierProvider<DataEntryProvider>(
      create: ((context) => DataEntryProvider())),
  ChangeNotifierProvider<EngineerEditProfileProvider>(
      create: ((context) => EngineerEditProfileProvider())),
];
