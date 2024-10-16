import 'package:get/get.dart';
import 'package:responsivedashboard/routes/routes_string.dart';
import 'package:responsivedashboard/view/action_page.dart';
import 'package:responsivedashboard/view/activity_page/activity_desktop_body.dart';
import 'package:responsivedashboard/view/creation_page.dart';
import 'package:responsivedashboard/view/home_page/desktop_body.dart';
import 'package:responsivedashboard/view/home_page/mobile_body.dart';
import 'package:responsivedashboard/view/home_page/responsive_layout.dart';
import 'package:responsivedashboard/view/home_page/tablet_body.dart';
import 'package:responsivedashboard/view/login_page/desktop_login.dart';
import 'package:responsivedashboard/view/login_page/mobile_login.dart';
import 'package:responsivedashboard/view/login_page/responsive_login.dart';

class AppRoutes {
  static final routes = [
    GetPage(
        name: Routes.loginPage,
        page: () => ResponsiveLogin(
              mobileBody: LoginPageMobile(),
              desktopBody: LoginPageDesktop(),
            )),
    GetPage(
        name: Routes.homePage,
        page: () => ResponsiveLayout(
              mobileBody: MobileScaffold(),
              tabletBody: TabletScaffold(),
              desktopBody: DesktopScaffold(),
            )),
    GetPage(name: Routes.formPage, page: () => CreationPage()),
    GetPage(name: Routes.actionPage, page: () => ActionPage()),
    GetPage(name: Routes.activityPage, page: () => ActivityPage())
  ];
}
