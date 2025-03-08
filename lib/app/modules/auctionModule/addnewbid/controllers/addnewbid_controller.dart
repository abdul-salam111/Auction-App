import 'package:auction_app/app/modules/modules.dart';

class AddnewbidController extends GetxController {
  final fullNameController = TextEditingController().obs;
  final phoneController = TextEditingController().obs;
  var selectedValue = ''.obs;
  var selectedId = ''.obs;
  List<String> items = ['Spare Parts', 'Vehicle'];
  List<String> sparePartsIDs = ['1', '33', '54', '32', '09'];

  void setSelected(String value) {
    selectedValue.value = value;
    // Initialize cartItems with one item when a type is selected
    if (cartItems.isEmpty) {
      addCartItem(value == "Spare Parts"
          ? {'id': '', 'name': '', 'bidAmount': ''}
          : {'chasisNumber': '', 'name': '', 'bidAmount': ''});
    }
  }

  void setSelectedID(String value) {
    selectedId.value = value;
  }

  List<Map<String, dynamic>> cartItems = <Map<String, dynamic>>[].obs;

  void addCartItem(Map<String, dynamic> item) {
    cartItems.add(item);
  }

  void clearCart() {
    cartItems.clear();
  }

  void submitBid(String fullName, String phoneNumber) {
    final bidData = {
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'cartType': selectedValue.value,
      'items': List<Map<String, dynamic>>.from(cartItems),
    };
    // You can now process or store the bidData as needed
    print(bidData);
    clearCart(); // Clear the cart after submission
  }
}
