import 'package:chopmoni_app/orders_screens/order_details_screen.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  var selectedIndex = 0.obs; // 0 for New Order, 1 for Complete Order
  var orderList = [
    {"qty": "1x", "item": "Afang Soup", "price": "1000"},
    {"qty": "1x", "item": "Afang Soup", "price": "1000"},
    {"qty": "1x", "item": "Afang Soup", "price": "1000"},
    {"qty": "1x", "item": "Afang Soup", "price": "1000"},
    {"qty": "1x", "item": "Afang Soup", "price": "1000"},
    {"qty": "1x", "item": "Afang Soup", "price": "1000"},
    {"qty": "1x", "item": "Afang Soup", "price": "1000"},
    {"qty": "1x", "item": "Afang Soup", "price": "1000"},
    {"qty": "1x", "item": "Afang Soup", "price": "1000"},
    {"qty": "1x", "item": "Afang Soup", "price": "1000"},
    {"qty": "1x", "item": "Afang Soup", "price": "1000"},
    {"qty": "1x", "item": "Afang Soup", "price": "1000"},
    {"qty": "1x", "item": "Afang Soup", "price": "1000"},
    {"qty": "1x", "item": "Afang Soup", "price": "1000"},
    {"qty": "1x", "item": "Afang Soup", "price": "1000"},
  ];

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }

  onOrderItemClick(int index) {
    // pass order id
    Get.to(() => OrderDetailsScreen(index: index, orderType: 'new',));
  }

  markAsComplete(int index) {
    //
  }

  onCompletedOrderClick(int index) {
    // pass order id
    Get.to(()=> OrderDetailsScreen(index: index, orderType: 'completed',));
  }
}
