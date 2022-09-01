import 'package:apmatik/app/core/network/api-handler/api-handler.dart';
import 'package:apmatik/app/core/network/api-handler/api-repo.dart';
import 'package:apmatik/app/core/route/app_pages.dart';
import 'package:apmatik/app/core/services/dependency_injection_service.dart';
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
  DependecyInjection.init();
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
    print(Get.width);
    print(Get.height);
    print(storage.read('isLogin'));
    print(storage.read('languages'));
    var isLogin = storage.read('isLogin') ?? false;
    var language = storage.read('languages') ?? 0;
    return ScreenUtilInit(
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          transitionDuration: Duration(seconds: 0),
          defaultTransition: Transition.noTransition,
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('tr', ''),
            Locale('en', ''),
          ],
          locale: language == 0 ? Locale('tr', 'TR') : Locale('en', 'US'),
          fallbackLocale: TranslationService.fallbackLocale,
          translations: TranslationService(),
          title: "Application",
          initialRoute: isLogin ? AppPages.HOME : AppPages.INITIAL,
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
