import 'package:BrainScopeAI/features/home/domain/entity/result_entity.dart';
import 'package:BrainScopeAI/features/home/presentation/controller/new_scan_controller.dart';
import 'package:BrainScopeAI/features/intro/presentation/ui/intro_screen.dart';
import 'package:BrainScopeAI/features/setting/presentation/controller/app_translations.dart';
import 'package:BrainScopeAI/features/setting/presentation/controller/setting_controller.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:BrainScopeAI/core/theme/app_theme.dart';
import 'package:BrainScopeAI/features/home/presentation/ui/home_screen/home_screen.dart';
import 'package:BrainScopeAI/features/home/presentation/ui/new_scan/new_scan_screen.dart';
import 'package:BrainScopeAI/features/setting/presentation/ui/setting_screen.dart';
import 'package:BrainScopeAI/features/splash/presentation/UI/splash_screen.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ResultEntityAdapter());
  if (!await Hive.boxExists('main')) {
    await Hive.openBox<ResultEntity>('main');
  }

  runApp(DevicePreview(
    enabled: false,
    builder: (context) => MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ScannerController());
    final settingController = Get.put(SettingsController());
    return Obx(() {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        theme: appThemeLight(),
        locale: Locale(settingController.currentLocale.value),
        darkTheme: appThemeDark(),
        themeMode: settingController.getCurrentTheme(),
        initialRoute: '/splash',
        translations: AppTranslations(),
        getPages: [
          GetPage(name: '/splash', page: () => const SplashScreen()),
          GetPage(name: '/home', page: () => const HomeScreen()),
          GetPage(name: '/setting', page: () => const SettingScreen()),
          GetPage(name: '/NewScanScreen', page: () => const NewScanScreen()),
          GetPage(name: '/IntroductionScreen', page: () => const IntroScreen()),
        ],
      );
    });
  }
}
