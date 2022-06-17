import 'package:api_practice/Src/Controllers/product_controllers.dart';
import 'package:api_practice/Src/Widgets/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopScreen extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  ShopScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "ShopMe",
                    style: GoogleFonts.getFont(
                      "Salsa",
                      textStyle: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(
              () {
                if (productController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    itemCount: productController.productList.length,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    itemBuilder: (context, index) {
                      return ProductTile(productController.productList[index]);
                    },
                    staggeredTileBuilder: (index) {
                      return const StaggeredTile.fit(1);
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
