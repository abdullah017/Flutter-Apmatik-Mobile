import 'package:apmatik_app/app/core/network/api-handler/api-handler.dart';
import 'package:apmatik_app/app/core/network/api-handler/api-repo.dart';
import 'package:apmatik_app/app/core/network/check_connection/check_connecition.dart';
import 'package:apmatik_app/app/core/route/app_pages.dart';
import 'package:apmatik_app/app/core/utils/translation_service.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ApiBaseHelper(), permanent: true);
  Get.put(ApiRepository(Get.find()));
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white.withOpacity(0.0),
    // navigation bar color
    statusBarColor: Colors.white.withOpacity(0.0), // status bar color
  ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('tr', ''),
            Locale('en', ''),
          ],
          locale: TranslationService.locale,
          fallbackLocale: TranslationService.fallbackLocale,
          translations: TranslationService(),
          title: "Application",
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          debugShowCheckedModeBanner: false,
          // theme: Themes.light,
          // darkTheme: Themes.dark,
          // themeMode: ThemeService().theme,
        );
      },
    );
  }
}
