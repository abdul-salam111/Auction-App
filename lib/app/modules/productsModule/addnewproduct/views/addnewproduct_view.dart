import 'package:auction_app/app/modules/modules.dart';

class AddnewproductView extends GetView<AddnewproductController> {
  const AddnewproductView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: const Center(
        child: Text(
          'AddnewproductView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
