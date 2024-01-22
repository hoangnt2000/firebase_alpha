// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'app/ui/theme_data.dart';
import 'app/ui/ui.dart';
import 'app/utils/size/size_config.dart';
import 'generated/locales.g.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
late final FirebaseAuth firebaseAuth;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  firebaseAuth = FirebaseAuth.instance;
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString(UI.textStyle.fontLicense);
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  initializeDateFormatting();
  GetMaterialApp getMaterialApp = GetMaterialApp(
    translationsKeys: AppTranslation.translations,
    locale: const Locale('en', 'US'),
    themeMode: ThemeMode.system,
    theme: AppTheme.lightTheme,
    darkTheme: AppTheme.darkTheme,
    debugShowCheckedModeBanner: false,
    initialRoute: AppPages.INITIAL,
    getPages: AppPages.routes,
    navigatorObservers: [routeObserver],
    builder: EasyLoading.init(
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },
    ),
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(
      LayoutBuilder(builder: (context, constraints) {
        return OrientationBuilder(builder: (context, orientation) {
          SizeConfig(
            designScreenWidth: 375,
            designScreenHeight: 812,
          ).init(constraints, orientation);
          return getMaterialApp;
        });
      }),
    );
  });

  runApp(getMaterialApp);
}
