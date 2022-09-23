// ignore_for_file: avoid_print

import 'package:apmatik/app/core/network/api-handler/api-handler.dart';
import 'package:apmatik/app/core/network/api-handler/api-repo.dart';
import 'package:apmatik/app/core/route/app_pages.dart';
import 'package:apmatik/app/core/utils/translation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Get.put(ApiBaseHelper(), permanent: true);
  Get.put(ApiRepository(Get.find()));
  //GlobalBinding().dependencies();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: <SystemUiOverlay>[SystemUiOverlay.top]);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  MyApp({
    Key? key,
  }) : super(key: key);
  final storage = GetStorage();

  @override
  Widget build(BuildContext context) {

    print(storage.read('isLogin'));
    print(storage.read('languages'));
    var isLogin = storage.read('isLogin') ?? false;
    var language = storage.read('languages') ?? 0;
    return ScreenUtilInit(
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          transitionDuration: const Duration(seconds: 0),
          defaultTransition: Transition.noTransition,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('tr', ''),
            Locale('en', ''),
          ],
          locale: language == 0 ? const Locale('tr', 'TR') : const Locale('en', 'US'),
          fallbackLocale: TranslationService.fallbackLocale,
          translations: TranslationService(),
          title: "Application",
          initialRoute: isLogin ? AppPages.HOME : AppPages.INITIAL,
          getPages: AppPages.routes,
          debugShowCheckedModeBanner: false,
          //initialBinding: GlobalBinding(),
          // theme: Themes.light,
          // darkTheme: Themes.dark,
          // themeMode: ThemeService().theme,
        );
      },
    );
  }
}
