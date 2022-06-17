import 'package:api_practice/Src/Services/http_services.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = [].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await HTTPServices.fetchProducts();
      if (products != null) {
        productList.value = products;
      } else {
        throw Exception();
      }
    } finally {
      isLoading(false);
    }
  }
}
