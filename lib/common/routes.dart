import 'package:caraslate_cara_app/screens/home_page.dart';
import 'package:caraslate_cara_app/screens/job_log_page.dart';
import 'package:caraslate_cara_app/screens/login_page.dart';
import 'package:caraslate_cara_app/services/shared_pref_service.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String login = '/login';
  static const String home = '/home';
  static const String jobLog = '/job_log';

  static getPageRoutes() {
    return [
      GetPage(
        name: AppRoutes.home,
        page: () => HomePage(),
      ),
      GetPage(
        name: AppRoutes.login,
        page: () => LoginScreen(),
      ),
      GetPage(
        name: AppRoutes.jobLog,
        page: () => JobLogPage(),
      ),
    ];
  }

  static getInitialPages() {
    bool isLoggedIn = SharedPrefs.getBool('isLogin');
    if (isLoggedIn) {
      return AppRoutes.home;
    }
    return AppRoutes.login;
  }
}
