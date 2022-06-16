import 'package:api_practice/Fake-Shop_API/Constants/constants.dart';
import 'package:api_practice/Fake-Shop_API/Models/product_model.dart';
import 'package:http/http.dart' as http;

class HTTPServices {
  static Future<List<ProductsModel>> fetchProducts() async {
    var response = await http.get(
      Uri.parse(
        urlAPI.toString(),
      ),
    );
    if (response.statusCode == 200) {
      var data = response.body;
      print(response.body);
      return productsModelFromJson(data);
    } else {
      throw Exception();
    }
  }
}
