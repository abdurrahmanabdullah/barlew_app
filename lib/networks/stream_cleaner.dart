import 'package:barlew_app/constant/app_constants.dart';
import '../helpers/di.dart';

Future<void> totalDataClean() async {
  await appData.write(kKeyIsLoggedIn, false);
}


