import 'package:api_practice/Src/Models/product_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductTile extends StatelessWidget {
  final ProductsModel product;
  const ProductTile(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size s = MediaQuery.of(context).size;
    return Column(
      children: [
        Card(
          child: Container(
            height: 250,
            width: s.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider(product.image!),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  color: Colors.black54,
                  width: s.width,
                  child: Column(
                    children: [
                      const SizedBox(height: 2),
                      Text(
                        product.title!,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.salsa(
                          textStyle: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 2),
                      if (product.rating != null)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 2),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    product.rating!.rate.toString(),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  const Icon(
                                    Icons.star,
                                    size: 16,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.red,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    '\$${product.price}',
                                    style: GoogleFonts.salsa(),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      const SizedBox(height: 2),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
