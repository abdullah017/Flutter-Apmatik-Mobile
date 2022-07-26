import 'package:apmatik_app/app/ui/view/apartment/add_apartment/add_apertment_binding.dart';
import 'package:apmatik_app/app/ui/view/apartment/add_apartment/add_apertment_view.dart';
import 'package:apmatik_app/app/ui/view/apartment/qr/qr_binding.dart';
import 'package:apmatik_app/app/ui/view/apartment/qr/qr_view.dart';
import 'package:apmatik_app/app/ui/view/apartment/select_apartment/select_apartment_binding.dart';
import 'package:apmatik_app/app/ui/view/apartment/select_apartment/select_apartment_view.dart';
import 'package:apmatik_app/app/ui/view/auth/additional_details/additional_details_binding.dart';
import 'package:apmatik_app/app/ui/view/auth/additional_details/additional_details_view.dart';
import 'package:apmatik_app/app/ui/view/auth/forgot_password/forgotpassword_binding.dart';
import 'package:apmatik_app/app/ui/view/auth/forgot_password/forgotpassword_view.dart';
import 'package:apmatik_app/app/ui/view/auth/login/login_binding.dart';
import 'package:apmatik_app/app/ui/view/auth/login/login_view.dart';
import 'package:apmatik_app/app/ui/view/auth/otp/otp_binding.dart';
import 'package:apmatik_app/app/ui/view/auth/otp/otp_view.dart';
import 'package:apmatik_app/app/ui/view/auth/register/register_binding.dart';
import 'package:apmatik_app/app/ui/view/auth/register/register_view.dart';
import 'package:apmatik_app/app/ui/view/blank/blank_binding.dart';
import 'package:apmatik_app/app/ui/view/blank/blank_view.dart';
import 'package:apmatik_app/app/ui/view/bottom_navbar/bottom_navbar_binding.dart';
import 'package:apmatik_app/app/ui/view/bottom_navbar/bottom_navbar_view.dart';
import 'package:apmatik_app/app/ui/view/common/common_binding.dart';
import 'package:apmatik_app/app/ui/view/common/common_view.dart';
import 'package:apmatik_app/app/ui/view/dashboard/dashboard_binding.dart';
import 'package:apmatik_app/app/ui/view/dashboard/dashboard_view.dart';
import 'package:apmatik_app/app/ui/view/home/home_binding.dart';
import 'package:apmatik_app/app/ui/view/home/home_view.dart';
import 'package:apmatik_app/app/ui/view/menu/menu_binding.dart';
import 'package:apmatik_app/app/ui/view/menu/menu_view.dart';

import 'package:apmatik_app/app/ui/view/splash/splah_view.dart';
import 'package:apmatik_app/app/ui/view/splash/splash_binding.dart';

import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const INITIAL = Routes.BOTTOM;
  static const HOME = Routes.BOTTOM;
  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.ADDITIONAL_DETAILS,
      page: () => AdditionalDetailsView(),
      binding: AdditionalDetailsBinding(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => OtpView(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: _Paths.FORGOTPASSWORD,
      page: () => ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.BLANK,
      page: () => BlankView(),
      binding: BlankBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM,
      page: () => BottomNavbarView(),
      binding: BottomNavbarBinding(),
    ),
    GetPage(
      name: _Paths.ADDAPERTMEN,
      page: () => AddApertmentView(),
      binding: AddApertmentBinding(),
    ),
    GetPage(
      name: _Paths.READQR,
      page: () => QrView(),
      binding: QrBinding(),
    ),
    GetPage(
      name: _Paths.SELECTAPARTMENT,
      page: () => SelectApartmentView(),
      binding: SelectApartmentBinding(),
    ),
    GetPage(
      name: _Paths.COMMON,
      page: () => CommonView(),
      binding: CommonBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashBoardView(),
      binding: DashBoardBinding(),
    ),
    GetPage(
      name: _Paths.MENU,
      page: () => MenuView(),
      binding: MenuBinding(),
    ),
  ];
}
