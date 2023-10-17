import 'package:chopmoni_app/config/constants_colors.dart';
import 'package:chopmoni_app/config/image_url.dart';
import 'package:chopmoni_app/controllers/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewOrdersScreen extends StatelessWidget {
  const NewOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<OrderController>();
    return SizedBox(
      child: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => controller.onOrderItemClick(index),
            child: Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Image.asset(
                    userImage,
                    width: 90,
                    height: 90,
                  ),
                  const SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Time: 12:00 PM',
                        textAlign: TextAlign.start,
                      ),
                      const Text('Date: Today'),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.orange.shade100,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          'Pending',
                          style: TextStyle(
                            color: Colors.orange.shade800,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: blackTextColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          '#${index + 1}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          'Eat In',
                          style: TextStyle(
                            color: Colors.blue.shade900,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
