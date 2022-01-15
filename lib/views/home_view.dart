import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_test_app/controllers/home_controller.dart';
import 'package:get_x_test_app/views/shopping_page.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  HomeController? home_controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: const Icon(
          Icons.airplane_ticket_outlined,
          size: 30,
        ),
        title: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Expanded(
                  child: Text(
                "AirPortInfo",
                style: TextStyle(
                    fontFamily: 'avenir',
                    fontSize: 20,
                    fontWeight: FontWeight.w900),
              ))
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          TextButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return ShopingPage();
                }));
              },
              child: Text("IR a Shoping")),
          Expanded(
              child: ListView(
            children: [
              Card(
                child: Text(":v"),
              )
            ],
          ))
        ],
      ),
    );
  }
}
