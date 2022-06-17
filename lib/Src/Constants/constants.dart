import 'package:fluttertoast/fluttertoast.dart';

///API URL
String? urlAPI = "https://fakestoreapi.com/products";

///Flutter Toast Globally  accessible
void showMessage(String msg) {
  Fluttertoast.showToast(msg: msg);
}
