// ignore_for_file: constant_identifier_names

import 'package:apmatik/app/ui/view/apartment/add_apartment/add_apertment_binding.dart';
import 'package:apmatik/app/ui/view/apartment/add_apartment/add_apertment_view.dart';
import 'package:apmatik/app/ui/view/apartment/qr/qr_binding.dart';
import 'package:apmatik/app/ui/view/apartment/qr/qr_view.dart';
import 'package:apmatik/app/ui/view/apartment/select_apartment/select_apartment_binding.dart';
import 'package:apmatik/app/ui/view/apartment/select_apartment/select_apartment_view.dart';
import 'package:apmatik/app/ui/view/auth/additional_details/additional_details_binding.dart';
import 'package:apmatik/app/ui/view/auth/additional_details/additional_details_view.dart';
import 'package:apmatik/app/ui/view/auth/forgot_password/forgotpassword_binding.dart';
import 'package:apmatik/app/ui/view/auth/forgot_password/forgotpassword_view.dart';
import 'package:apmatik/app/ui/view/auth/login/login_binding.dart';
import 'package:apmatik/app/ui/view/auth/login/login_view.dart';
import 'package:apmatik/app/ui/view/auth/otp/otp_binding.dart';
import 'package:apmatik/app/ui/view/auth/otp/otp_view.dart';
import 'package:apmatik/app/ui/view/auth/register/register_binding.dart';
import 'package:apmatik/app/ui/view/auth/register/register_view.dart';
import 'package:apmatik/app/ui/view/auth/update_password/update_password_binding.dart';
import 'package:apmatik/app/ui/view/auth/update_password/update_password_view.dart';
import 'package:apmatik/app/ui/view/blank/blank_binding.dart';
import 'package:apmatik/app/ui/view/blank/blank_view.dart';
import 'package:apmatik/app/ui/view/common/common_binding.dart';
import 'package:apmatik/app/ui/view/common/common_view.dart';
import 'package:apmatik/app/ui/view/dashboard/dashboard_binding.dart';
import 'package:apmatik/app/ui/view/dashboard/dashboard_view.dart';
import 'package:apmatik/app/ui/view/gateway/gateway_binding.dart';
import 'package:apmatik/app/ui/view/gateway/gateway_view.dart';
import 'package:apmatik/app/ui/view/home/home_binding.dart';
import 'package:apmatik/app/ui/view/home/home_view.dart';
import 'package:apmatik/app/ui/view/menu/menu_binding.dart';
import 'package:apmatik/app/ui/view/menu/menu_view.dart';
import 'package:apmatik/app/ui/view/menu/preferences/preferences_binding.dart';
import 'package:apmatik/app/ui/view/menu/preferences/preferences_view.dart';
import 'package:apmatik/app/ui/view/menu/preferences/settings/about/about_binding.dart';
import 'package:apmatik/app/ui/view/menu/preferences/settings/about/about_view.dart';
import 'package:apmatik/app/ui/view/menu/preferences/settings/aggrement/aggrement_binding.dart';
import 'package:apmatik/app/ui/view/menu/preferences/settings/aggrement/aggrement_view.dart';
import 'package:apmatik/app/ui/view/menu/preferences/settings/languages/languages_binding.dart';
import 'package:apmatik/app/ui/view/menu/preferences/settings/languages/languages_view.dart';
import 'package:apmatik/app/ui/view/menu/preferences/settings/problem_report/report_binding.dart';
import 'package:apmatik/app/ui/view/menu/preferences/settings/problem_report/report_view.dart';
import 'package:apmatik/app/ui/view/menu/profile/edit_profile/edit_profile_binding.dart';
import 'package:apmatik/app/ui/view/menu/profile/edit_profile/edit_profile_view.dart';
import 'package:apmatik/app/ui/view/menu/profile/show_profile/profile_binding.dart';
import 'package:apmatik/app/ui/view/menu/profile/show_profile/profile_view.dart';
import 'package:apmatik/app/ui/view/menu/staff/staff_binding.dart';
import 'package:apmatik/app/ui/view/notifications/notifications_binding.dart';
import 'package:apmatik/app/ui/view/notifications/notifications_view.dart';
import 'package:apmatik/app/ui/view/questionnaire_detail/questionnaire_detail_binding.dart';
import 'package:apmatik/app/ui/view/questionnaire_detail/questionnaire_detail_view.dart';
import 'package:apmatik/app/ui/view/splash/splah_view.dart';
import 'package:apmatik/app/ui/view/splash/splash_binding.dart';
import 'package:get/get.dart';
import '../../ui/view/menu/staff/staff_view.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const INITIAL = Routes.SPLASH;
  static const HOME = Routes.HOME;
  static final routes = [
    GetPage(
        name: _Paths.SPLASH,
        page: () => SplashView(),
        binding: SplashBinding(),
        transition: Transition.leftToRight,
        transitionDuration: const Duration(seconds: 0, milliseconds: 0),
        preventDuplicates: true),
    GetPage(
        name: _Paths.LOGIN,
        page: () => LoginView(),
        binding: LoginBinding(),
        transition: Transition.noTransition,
        transitionDuration: const Duration(seconds: 0, milliseconds: 0),
        preventDuplicates: true),
    GetPage(
        name: _Paths.REGISTER,
        page: () => RegisterView(),
        binding: RegisterBinding(),
        preventDuplicates: true),
    GetPage(
        name: _Paths.ADDITIONAL_DETAILS,
        page: () => AdditionalDetailsView(),
        binding: AdditionalDetailsBinding(),
        preventDuplicates: true),
    GetPage(
        name: _Paths.OTP,
        page: () => OtpView(),
        binding: OtpBinding(),
        preventDuplicates: true),
    GetPage(
        name: _Paths.FORGOTPASSWORD,
        page: () => ForgotPasswordView(),
        binding: ForgotPasswordBinding(),
        preventDuplicates: true),
    GetPage(
        name: _Paths.HOME,
        page: () => HomeView(),
        binding: HomeBinding(),
        preventDuplicates: true),
    GetPage(
        name: _Paths.BLANK,
        page: () => BlankView(),
        binding: BlankBinding(),
        preventDuplicates: true),
    GetPage(
        name: _Paths.ADDAPERTMEN,
        page: () => AddApertmentView(),
        binding: AddApertmentBinding(),
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 500),
        preventDuplicates: true),
    GetPage(
      name: _Paths.READQR,
      page: () => QrView(),
      binding: QrBinding(),
    ),
    GetPage(
        name: _Paths.SELECTAPARTMENT,
        page: () => SelectApartmentView(),
        binding: SelectApartmentBinding(),
        preventDuplicates: true),
    GetPage(
        name: _Paths.COMMON,
        page: () => CommonView(),
        binding: CommonBinding(),
        preventDuplicates: true),
    GetPage(
        name: _Paths.DASHBOARD,
        page: () => DashBoardView(),
        binding: DashBoardBinding(),
        preventDuplicates: true),
    GetPage(
        name: _Paths.MENU,
        page: () => MenuView(),
        binding: MenuBinding(),
        preventDuplicates: true),
    GetPage(
        name: _Paths.PROFILE,
        page: () => ProfileView(),
        binding: ProfileBinding(),
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 500),
        preventDuplicates: true),
    GetPage(
      name: _Paths.EDITPROFILE,
      page: () => EditProfileView(),
      binding: EditProfileBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: _Paths.NOTIFICATIONS,
      page: () => NotificationsView(),
      binding: NotificationsBinding(),
    ),
    GetPage(
      name: _Paths.PREFERENCES,
      page: () => PreferencesView(),
      binding: PreferencesBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: _Paths.AGGREMENT,
      page: () => AggrementView(),
      binding: AggrementBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: _Paths.LANGUAGES,
      page: () => LanguagesView(),
      binding: LanguagesBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: _Paths.UPDATEPASSWORD,
      page: () => UpdatePasswordView(),
      binding: UpdatePasswordBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: _Paths.REPORT,
      page: () => ReportView(),
      binding: ReportBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: _Paths.ABOUT,
      page: () => AboutView(),
      binding: AboutBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: _Paths.QUESTIONNAIRE,
      page: () => QuestionnaireDetailView(),
      binding: QuestionnaireDetailBinding(),
    ),
    GetPage(
      name: _Paths.STAFF,
      page: () => StaffView(),
      binding: StaffBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: _Paths.GATEWAY,
      page: () => GatewayView(),
      binding: GatewayBinding(),
    ),
  ];
}
