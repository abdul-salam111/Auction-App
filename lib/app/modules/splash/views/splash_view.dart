import '../../modules.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: appLogo(width: context.width * 0.7, height: context.height * 0.2),
    );
  }
}
