import 'package:apmatik_app/app/core/binding/home_binding.dart';
import 'package:apmatik_app/app/core/binding/videos_details_binding.dart';
import 'package:apmatik_app/app/ui/view/apertment/add_apertment_binding.dart';
import 'package:apmatik_app/app/ui/view/apertment/add_apertment_view.dart';
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
import 'package:apmatik_app/app/ui/view/home/home_view.dart';

import 'package:apmatik_app/app/ui/view/splash/splah_view.dart';
import 'package:apmatik_app/app/ui/view/splash/splash_binding.dart';
import 'package:apmatik_app/app/ui/view/videos/play-video-view.dart';

import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const INITIAL = Routes.SPLASH;
  static const HOME = Routes.HOME;
  static final routes = [
    // GetPage(
    //   name: _Paths.DASHBOARD,
    //   page: () => DashBoardView(),
    //   binding: DashboardBinding(),
    // ),
    // GetPage(
    //   name: _Paths.IMAGESLIST,
    //   page: () => ImagesListView(),
    //   binding: ImagesBinding(),
    // ),
    // GetPage(
    //   name: _Paths.VIEOSLIST,
    //   page: () => VideoListView(),
    //   binding: ImagesBinding(),
    // ),
    // GetPage(
    //   name: _Paths.FAVORITELIST,
    //   page: () => FavoriteListView(),
    //   binding: FavoriteBinding(),
    // ),
    GetPage(
      name: _Paths.VIDEOS_DETAILS,
      page: () => PlayVideoView(),
      binding: VideosDetailsBinding(),
    ),
    // GetPage(
    //   name: _Paths.IMAGES_DETAILS,
    //   page: () => ImagesView(),
    //   binding: ImagesDetailsBinding(),
    // ),
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
      name: _Paths.COMMON,
      page: () => CommonView(),
      binding: CommonBinding(),
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
  ];
}
