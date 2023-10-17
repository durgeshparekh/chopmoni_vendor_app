import 'package:chopmoni_app/config/constants_colors.dart';
import 'package:chopmoni_app/controllers/order_controller.dart';
import 'package:chopmoni_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetailsScreen extends StatelessWidget {
  final int index;
  final String orderType;

  const OrderDetailsScreen({
    super.key,
    required this.index,
    required this.orderType,
  });

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<OrderController>();
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      appBar: AppBar(
        title: const Text(
          'Order Details',
          style: TextStyle(color: blackTextColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Qty',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Item',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Price (₦)',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemCount: controller.orderList.length,
                    itemBuilder: (context, index) {
                      String qty =
                          controller.orderList[index]["qty"].toString();
                      String item =
                          controller.orderList[index]["item"].toString();
                      String price =
                          controller.orderList[index]["price"].toString();
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Text(qty),
                            const Spacer(),
                            Text(item),
                            const Spacer(),
                            Text(price),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
                const Divider(thickness: 1),
                const SizedBox(
                  width: double.infinity,
                  child: Text(
                    '₦2600',
                    style: TextStyle(color: blackTextColor),
                    textAlign: TextAlign.end,
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          const SizedBox(height: 10),
          if (orderType == 'new')
            CustomButtons(
              text: 'Mark as Complete',
              buttonColor: blackTextColor,
              textColor: greenTextColor,
              onBtnPressed: () => controller.markAsComplete(index),
            ),
          const SizedBox(height: 20),
          const Text(
            'Press the button above if you’re done packing the customers items.',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
