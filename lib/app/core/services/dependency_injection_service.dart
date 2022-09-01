import 'package:apmatik/app/ui/view/apartment/add_apartment/add_apertment_controller.dart';
import 'package:apmatik/app/ui/view/apartment/qr/qr_controller.dart';
import 'package:apmatik/app/ui/view/apartment/select_apartment/select_apartment_controller.dart';
import 'package:apmatik/app/ui/view/auth/additional_details/additional_details_controller.dart';
import 'package:apmatik/app/ui/view/auth/forgot_password/forgotpassword_controller.dart';
import 'package:apmatik/app/ui/view/auth/login/login_controller.dart';
import 'package:apmatik/app/ui/view/auth/otp/otp_controller.dart';
import 'package:apmatik/app/ui/view/auth/register/register_controller.dart';
import 'package:apmatik/app/ui/view/auth/update_password/update_password_controller.dart';
import 'package:apmatik/app/ui/view/blank/blank_controller.dart';
import 'package:apmatik/app/ui/view/common/common_controller.dart';
import 'package:apmatik/app/ui/view/dashboard/dashboard_controller.dart';
import 'package:apmatik/app/ui/view/home/home_controller.dart';
import 'package:apmatik/app/ui/view/menu/menu_controller.dart';
import 'package:apmatik/app/ui/view/menu/preferences/preferences_controller.dart';
import 'package:apmatik/app/ui/view/menu/preferences/settings/about/about_controller.dart';
import 'package:apmatik/app/ui/view/menu/preferences/settings/aggrement/aggrement_controller.dart';
import 'package:apmatik/app/ui/view/menu/preferences/settings/languages/languages_controller.dart';
import 'package:apmatik/app/ui/view/menu/preferences/settings/problem_report/report_controller.dart';
import 'package:apmatik/app/ui/view/menu/profile/edit_profile/edit_profile_controller.dart';
import 'package:apmatik/app/ui/view/menu/profile/show_profile/profile_controller.dart';
import 'package:apmatik/app/ui/view/menu/staff/staff_controller.dart';
import 'package:apmatik/app/ui/view/notifications/notifications_controller.dart';
import 'package:apmatik/app/ui/view/questionnaire_detail/questionnaire_detail_controller.dart';
import 'package:apmatik/app/ui/view/splash/splash_controller.dart';
import 'package:get/get.dart';

class DependecyInjection {
  static void init() {
    Get.put<SplashController>(SplashController());
    Get.put<LoginController>(LoginController());
    Get.put<RegisterController>(RegisterController());
    Get.put<HomeController>(HomeController());
    Get.put<AddApertmentController>(AddApertmentController());
    Get.put<CommonController>(CommonController());
    // Get.put<OtpController>(OtpController());
    Get.put<AdditionalDetailsController>(AdditionalDetailsController());
    Get.put<ForgotPasswordController>(ForgotPasswordController());
    Get.put<BlankController>(BlankController());
    Get.put<QrController>(QrController());
    Get.put<SelectApartmentController>(SelectApartmentController());
    Get.put<DashBoardController>(DashBoardController());

    Get.put<MenuController>(MenuController());
    Get.put<ProfileController>(ProfileController());
    Get.put<EditProfileController>(EditProfileController());
    Get.put<NotificationsController>(NotificationsController());
    Get.put<PreferencesController>(PreferencesController());
    Get.put<AggrementController>(AggrementController());
    Get.put<LanguagesController>(LanguagesController());

    Get.put<UpdatePasswordController>(UpdatePasswordController());
    Get.put<ReportController>(ReportController());
    Get.put<AboutController>(AboutController());
    Get.put<QuestionnaireDetailController>(QuestionnaireDetailController());
    Get.put<StaffController>(StaffController());
  }
}
