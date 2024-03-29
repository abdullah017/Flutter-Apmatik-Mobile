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
import 'package:apmatik/app/ui/view/cars/add_cars/add_cars_binding.dart';
import 'package:apmatik/app/ui/view/cars/add_cars/add_cars_view.dart';
import 'package:apmatik/app/ui/view/cars/show_cars/show_cars_binding.dart';
import 'package:apmatik/app/ui/view/cars/show_cars/show_cars_view.dart';
import 'package:apmatik/app/ui/view/common/common_binding.dart';
import 'package:apmatik/app/ui/view/common/common_view.dart';
import 'package:apmatik/app/ui/view/dashboard/dashboard_binding.dart';
import 'package:apmatik/app/ui/view/dashboard/dashboard_view.dart';
import 'package:apmatik/app/ui/view/gateway/gateway_binding.dart';
import 'package:apmatik/app/ui/view/gateway/gateway_view.dart';
import 'package:apmatik/app/ui/view/gateway/payment_method/credit_card/manage_card/manage_card_binding.dart';
import 'package:apmatik/app/ui/view/gateway/payment_method/credit_card/manage_card/manage_card_view.dart';
import 'package:apmatik/app/ui/view/gateway/payment_method/credit_card/select_card_binding.dart';
import 'package:apmatik/app/ui/view/gateway/payment_method/credit_card/select_card_view.dart';
import 'package:apmatik/app/ui/view/gateway/payment_method/credit_card/show_card/show_card_binding.dart';
import 'package:apmatik/app/ui/view/gateway/payment_method/credit_card/show_card/show_card_view.dart';
import 'package:apmatik/app/ui/view/gateway/payment_method/money_transfer/money_transfer_binding.dart';
import 'package:apmatik/app/ui/view/gateway/payment_method/money_transfer/money_transfer_view.dart';
import 'package:apmatik/app/ui/view/guest_card/add_guest_card/add_guest_binding.dart';
import 'package:apmatik/app/ui/view/guest_card/add_guest_card/add_guest_view.dart';
import 'package:apmatik/app/ui/view/guest_card/edit_guest_card/edit_guest_binding.dart';
import 'package:apmatik/app/ui/view/guest_card/edit_guest_card/edit_guest_view.dart';
import 'package:apmatik/app/ui/view/guest_card/show_guest_card/show_guestcard_binding.dart';
import 'package:apmatik/app/ui/view/guest_card/show_guest_card/show_guestcard_view.dart';
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
import 'package:apmatik/app/ui/view/payments/detail_payments/detail_payments_binding.dart';
import 'package:apmatik/app/ui/view/payments/detail_payments/detail_payments_view.dart';
import 'package:apmatik/app/ui/view/payments/show_payments/show_payments_binding.dart';
import 'package:apmatik/app/ui/view/payments/show_payments/show_payments_view.dart';
import 'package:apmatik/app/ui/view/questionnaire_detail/questionnaire_detail_binding.dart';
import 'package:apmatik/app/ui/view/questionnaire_detail/questionnaire_detail_view.dart';
import 'package:apmatik/app/ui/view/splash/splah_view.dart';
import 'package:apmatik/app/ui/view/splash/splash_binding.dart';
import 'package:apmatik/app/ui/view/troubles/add_troubles/add_troubles_binding.dart';
import 'package:apmatik/app/ui/view/troubles/add_troubles/add_troubles_view.dart';
import 'package:apmatik/app/ui/view/troubles/detail_troubles/detail_troubles_binding.dart';
import 'package:apmatik/app/ui/view/troubles/detail_troubles/detail_troubles_view.dart';
import 'package:apmatik/app/ui/view/troubles/show_troubles/show_troubles_binding.dart';
import 'package:apmatik/app/ui/view/troubles/show_troubles/show_troubles_view.dart';
import 'package:get/get.dart';
import '../../ui/view/menu/staff/staff_view.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const INITIAL = Routes.LOGIN;
  static const HOME = Routes.LOGIN;
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
        transitionDuration: const Duration(milliseconds: 130),
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
        transitionDuration: const Duration(milliseconds: 130),
        preventDuplicates: true),
    GetPage(
      name: _Paths.EDITPROFILE,
      page: () => EditProfileView(),
      binding: EditProfileBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 130),
    ),
    GetPage(
      name: _Paths.NOTIFICATIONS,
      page: () => NotificationsView(),
      binding: NotificationsBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 130),
    ),
    GetPage(
      name: _Paths.PREFERENCES,
      page: () => PreferencesView(),
      binding: PreferencesBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 130),
    ),
    GetPage(
      name: _Paths.AGGREMENT,
      page: () => AggrementView(),
      binding: AggrementBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 130),
    ),
    GetPage(
      name: _Paths.LANGUAGES,
      page: () => LanguagesView(),
      binding: LanguagesBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 130),
    ),
    GetPage(
      name: _Paths.UPDATEPASSWORD,
      page: () => UpdatePasswordView(),
      binding: UpdatePasswordBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 130),
    ),
    GetPage(
      name: _Paths.REPORT,
      page: () => ReportView(),
      binding: ReportBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 130),
    ),
    GetPage(
      name: _Paths.ABOUT,
      page: () => AboutView(),
      binding: AboutBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 130),
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
      transitionDuration: const Duration(milliseconds: 130),
    ),
    GetPage(
      name: _Paths.GATEWAY,
      page: () => GatewayView(),
      binding: GatewayBinding(),
    ),
    GetPage(
      name: _Paths.SELECTCREDITCARD,
      page: () => SelectCreditCardView(),
      binding: SelectCreditCardBinding(),
    ),
    GetPage(
      name: _Paths.SHOWCARD,
      page: () => ShowCardView(),
      binding: ShowCardBinding(),
    ),
    GetPage(
      name: _Paths.MANAGECARD,
      page: () => ManageCardView(),
      binding: ManageCardBinding(),
    ),
    GetPage(
      name: _Paths.MONEYTRANSFER,
      page: () => MoneyTransferView(),
      binding: MoneyTransferBinding(),
    ),
    GetPage(
      name: _Paths.SHOWGUESTCARD,
      page: () => ShowGuestCardView(),
      binding: ShowGuestCardBinding(),
    ),
    GetPage(
      name: _Paths.ADDGUESTCARD,
      page: () => AddGuestCardView(),
      binding: AddGuestBinding(),
    ),
    GetPage(
      name: _Paths.EDITGUESTCARD,
      page: () => EditGuestCardView(),
      binding: EditGuestBinding(),
    ),
    GetPage(
      name: _Paths.SHOWTROUBLES,
      page: () => ShowTroublesView(),
      binding: ShowTroublesBinding(),
    ),
    GetPage(
      name: _Paths.DETAILTROUBLES,
      page: () => DetailTroublesView(),
      binding: DetailTroublesBinding(),
    ),
    GetPage(
      name: _Paths.ADDTROUBLES,
      page: () => AddTroublesView(),
      binding: AddTroublesBinding(),
    ),
    GetPage(
      name: _Paths.SHOWPAMENTS,
      page: () => ShowPaymentsView(),
      binding: ShowPaymentsBinding(),
    ),
    GetPage(
      name: _Paths.DETAILPAYMENTS,
      page: () => DetailPaymentsView(),
      binding: DetailPaymentsBinding(),
    ),
    GetPage(
      name: _Paths.SHOWCARS,
      page: () => ShowCarsView(),
      binding: ShowCarsBinding(),
    ),
    GetPage(
      name: _Paths.SHOWCARS,
      page: () => ShowCarsView(),
      binding: ShowCarsBinding(),
    ),
    GetPage(
      name: _Paths.ADDCARS,
      page: () => AddCarsView(),
      binding: AddCarsBinding(),
    ),
  ];
}
