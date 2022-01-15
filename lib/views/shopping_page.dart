import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_test_app/controllers/cart_controller.dart';
import 'package:get_x_test_app/controllers/shopping_controller.dart';

class ShopingPage extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());
  ShopingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: GetX<ShoppingController>(builder: (controller) {
              return ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.all(12),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${controller.products[index].productName}',
                                      style: TextStyle(
                                          fontSize: 24, color: Colors.black),
                                    ),
                                    Text(
                                      '${controller.products[index].productDescription}',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                                Text('\$${controller.products[index].price}',
                                    style: TextStyle(
                                        fontSize: 24, color: Colors.black)),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {
                                cartController
                                    .addToCart(controller.products[index]);
                              },
                              child: Text('Add to Cart'),
                            ),
                            Obx(() => IconButton(
                                  icon: controller
                                          .products[index].isFavorite.value
                                      ? Icon(Icons.check_box_rounded)
                                      : Icon(Icons
                                          .check_box_outline_blank_outlined),
                                  onPressed: () {
                                    controller.products[index].isFavorite
                                        .toggle();
                                  },
                                ))
                          ],
                        ),
                      ),
                    );
                  });
            })),
            GetX<CartController>(builder: (controller) {
              return Text('Total amount: \$ ${controller.totalPrice} ');
            }),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
      floatingActionButton: Obx(() => FloatingActionButton.extended(
            backgroundColor: Colors.amber,
            onPressed: () {},
            icon: Icon(Icons.add_shopping_cart_rounded),
            label: Text('${cartController.count}'),
          )),
    );
  }
}
