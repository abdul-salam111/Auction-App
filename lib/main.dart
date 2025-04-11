import 'package:flutter/services.dart';
import 'app/modules/modules.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Auction App',
      initialRoute: Routes.SPLASH,
      theme: AppThemes.lightTheme,
      getPages: AppPages.routes,
    );
  }
}
