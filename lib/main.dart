// // ignore_for_file: deprecated_member_use

// import 'package:auto_animated/auto_animated.dart';
// import 'package:barlew_app/features/customer/questions_page/presentations/questions_page_screen.dart';
// import 'package:barlew_app/features/engineer/engineer_auth/engineer_login/presentation/widgets/presentatiosn/image_picker_controller.dart';
// import 'package:barlew_app/loading.dart';
// import 'package:barlew_app/provider/profile_provider.dart';
// import 'package:barlew_app/provider/signup_screen_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get_navigation/src/root/get_material_app.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:provider/provider.dart';
// import 'helpers/all_routes.dart';
// import 'helpers/di.dart';
// import 'helpers/helpers_method.dart';
// import 'helpers/navigation_service.dart';
// import 'helpers/register_provider.dart';
// import 'networks/dio/dio.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await GetStorage.init();
//   diSetup();
//   initiInternetChecker();
//   DioSingleton.instance.create();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     rotation();
//     setInitValue();
//     return MultiProvider(
//       providers: providers,
//       child: AnimateIfVisibleWrapper(
//         showItemInterval: const Duration(milliseconds: 150),
//         child: PopScope(
//           canPop: false,
//           onPopInvoked: (bool didPop) async {
//             showMaterialDialog(context);
//           },
//           child: LayoutBuilder(
//             builder: (context, constraints) {
//               return const UtillScreenMobile();
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// class UtillScreenMobile extends StatelessWidget {
//   static const Color c4EC5D7 = Color(0xFF4EC5D7); // Base color

//   const UtillScreenMobile({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ...providers,
//         ChangeNotifierProvider(
//           create: (context) =>
//               SelectedAnswersModel(), // Add your SelectedAnswersModel here
//         ),
//         // Ensure this list contains all necessary providers
//         ChangeNotifierProvider(create: (context) => ProfileProvider()),
//         ChangeNotifierProvider(create: (context) => SignupScreenProvider()),
//         ChangeNotifierProvider(create: (context) => ImagePickerProvider()),
//       ],
//       child: ScreenUtilInit(
//         designSize: const Size(393, 852),
//         minTextAdapt: true,
//         splitScreenMode: true,
//         builder: (_, child) {
//           return PopScope(
//             canPop: false,
//             onPopInvoked: (bool didPop) async {
//               if (!didPop) {
//                 showMaterialDialog(context);
//               }
//             },
//             child: GetMaterialApp(
//               debugShowCheckedModeBanner: false,
//               navigatorKey: NavigationService.navigatorKey,
//               onGenerateRoute: RouteGenerator.generateRoute,
//               home: const Loading(),
//               builder: (context, widget) {
//                 return MediaQuery(
//                   data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
//                   child: widget ?? const SizedBox(),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
///------------------
// // ignore_for_file: deprecated_member_use
import 'package:auto_animated/auto_animated.dart';
import 'package:barlew_app/constant/app_constants.dart';
import 'package:barlew_app/constant/custome_theme.dart';

import 'package:barlew_app/helpers/language.dart';
import 'package:barlew_app/loading.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'helpers/all_routes.dart';
import 'helpers/di.dart';
import 'helpers/helpers_method.dart';
import 'helpers/navigation_service.dart';
import 'helpers/register_provider.dart';
import 'networks/dio/dio.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  diSetup();
  initiInternetChecker();
  DioSingleton.instance.create();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    rotation();
    setInitValue();
    return MultiProvider(
      providers: providers,
      child: AnimateIfVisibleWrapper(
        showItemInterval: const Duration(milliseconds: 150),
        child: PopScope(
          canPop: false,
          onPopInvoked: (bool didPop) async {
            showMaterialDialog(context);
          },
          child: LayoutBuilder(
            builder: (context, constraints) {
              return const UtillScreenMobile();
            },
          ),
        ),
      ),
    );
  }
}

class UtillScreenMobile extends StatelessWidget {
  const UtillScreenMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String language = appData.read(kKeyLanguage) ?? 'en'; // Default language
    String countryCode =
        appData.read(kKeyCountryCode) ?? 'US'; // Default country cod
    return ScreenUtilInit(
      designSize: const Size(414, 826),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return PopScope(
          canPop: false,
          onPopInvoked: (bool didPop) async {
            showMaterialDialog(context);
          },
          child: GetMaterialApp(
            showPerformanceOverlay: false,
            theme: ThemeData(
              primarySwatch: CustomTheme.kToDark,
              useMaterial3: false,
            ),
            debugShowCheckedModeBanner: false,
            translations: LocalString(),
            locale: Locale(language, countryCode),
            builder: (context, widget) {
              return MediaQuery(data: MediaQuery.of(context), child: widget!);
            },
            navigatorKey: NavigationService.navigatorKey,
            onGenerateRoute: RouteGenerator.generateRoute,
            home: const Loading(),
          ),
        );
      },
    );
  }
}
