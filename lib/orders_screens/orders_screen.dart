import 'package:chopmoni_app/config/constants_colors.dart';
import 'package:chopmoni_app/controllers/order_controller.dart';
import 'package:chopmoni_app/orders_screens/complete_orders_screen.dart';
import 'package:chopmoni_app/orders_screens/new_orders_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(OrderController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Orders',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: blackTextColor,
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.only(top: 10),
        child: Obx(
          () => Column(
            children: [
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, 1),
                      blurRadius: 2,
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(5),
                child: ToggleButtons(
                  isSelected: [
                    controller.selectedIndex.value == 0,
                    controller.selectedIndex.value == 1
                  ],
                  onPressed: (index) => controller.onItemTapped(index),
                  borderRadius: BorderRadius.circular(10.0),
                  fillColor: Colors.transparent,
                  renderBorder: false,
                  splashColor: Colors.transparent,
                  children: [
                    Container(
                      width: 150,
                      height: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: controller.selectedIndex.value == 0
                            ? blackTextColor
                            : null,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'New',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: controller.selectedIndex.value == 0
                              ? Colors.white
                              : blackTextColor,
                          fontWeight: controller.selectedIndex.value == 0
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                    Container(
                      width: 150,
                      height: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: controller.selectedIndex.value == 1
                            ? greenShade
                            : null,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Complete',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: controller.selectedIndex.value == 1
                              ? Colors.white
                              : blackTextColor,
                          fontWeight: controller.selectedIndex.value == 1
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              if (controller.selectedIndex.value == 0)
                const Expanded(child: NewOrdersScreen())
              else
                const Expanded(child: CompleteOrdersScreen())
            ],
          ),
        ),
      ),
    );
  }
}
