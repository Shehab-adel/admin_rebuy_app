import 'package:shared_preferences/shared_preferences.dart';
import '../../core/app_strings.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static Future init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static String? selectedBranch() =>
      sharedPreferences.getString(AppStrings.branch);

  static bool? isLoggin() => sharedPreferences.getBool(AppStrings.isLoggin);
}
