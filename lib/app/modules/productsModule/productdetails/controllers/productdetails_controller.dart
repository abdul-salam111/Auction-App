import 'package:auction_app/app/modules/modules.dart';


class ProductdetailsController extends GetxController {


  var selectedStatus = "In-stock".obs;

  final List<String> statusOptions = [
    'In-stock',
    'Out of stock',
    'Coming soon',
  ];

  var currentPage = 0.obs;

  final carImages = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRI2RLOBO8DYvk8aAUNEs6DJzCJzlgHT7HfAg&s",
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGnXBMEkgRLZ4FZ_lq9098XCH7rRfcPOf2oQ&s',
    'https://images.template.net/wp-content/uploads/2016/04/27093503/Sky-Blue-Colored-Car-Wallpaper-for-Download.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhrGXZwNeN1pEdZLQ4T2kyTb8-rIrbkvgRmZZiK5ESwsXwq0voHgn5MwUF_ADAEbfryCc&usqp=CAU',
  ];
  void onPageChanged(int index) {
    currentPage.value = index;
  }
}
