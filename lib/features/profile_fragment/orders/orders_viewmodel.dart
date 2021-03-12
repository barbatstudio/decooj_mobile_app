import 'package:decooj_buyers/features/profile_fragment/orders/orders_model.dart';
import 'package:decooj_buyers/generics/base_view_model.dart';
import 'package:decooj_buyers/tools/constants.dart';
import 'package:decooj_buyers/widgets/loading_widget.dart';
import 'package:decooj_buyers/widgets/order_card_widget.dart';
import 'package:flutter/cupertino.dart';

class OrdersViewModel extends BaseViewModel {
  final BuildContext context;
  Widget orderListView = LoadingWidget();
  int selectedState = -1;
  OrdersViewModel({this.context}) : super(context: context) {
    getOrders();
  }

  List<OrdersModel> orders = [
    OrdersModel(
        id: 1,
        orderType: ORDER_TYPE_NORMAL,
        state: ORDER_STATE_ACTIVE,
        uniqueCode: 'dec47985',
        orderDate: '11/10/1400',
        imageUrl: null),
    OrdersModel(
        id: 1,
        orderType: ORDER_TYPE_NORMAL,
        state: ORDER_STATE_WAITING_FOR_VIEW,
        uniqueCode: 'dec47985',
        orderDate: '11/10/1400',
        imageUrl: null),
    OrdersModel(
        id: 1,
        orderType: ORDER_TYPE_SPECIAL,
        state: ORDER_STATE_WAITING_FOR_PAYMENT,
        uniqueCode: 'dec47985',
        orderDate: '11/10/1400',
        imageUrl: null),
    OrdersModel(
        id: 1,
        orderType: ORDER_TYPE_SPECIAL,
        state: ORDER_STATE_WAITING_FOR_BILL,
        uniqueCode: 'dec47985',
        orderDate: '11/10/1400',
        imageUrl: null),
    OrdersModel(
        id: 1,
        orderType: ORDER_TYPE_NORMAL,
        state: ORDER_STATE_FINISHED,
        uniqueCode: 'dec47985',
        orderDate: '11/10/1400',
        imageUrl: null),
    OrdersModel(
        id: 1,
        orderType: ORDER_TYPE_NORMAL,
        state: ORDER_STATE_RETURNED,
        uniqueCode: 'dec47985',
        orderDate: '11/10/1400',
        imageUrl: null),
    OrdersModel(
        id: 1,
        orderType: ORDER_TYPE_SPECIAL,
        state: ORDER_STATE_ACTIVE,
        uniqueCode: 'dec47985',
        orderDate: '11/10/1400',
        imageUrl: null),
    OrdersModel(
        id: 1,
        orderType: ORDER_TYPE_NORMAL,
        state: ORDER_STATE_ACTIVE,
        uniqueCode: 'dec47985',
        orderDate: '11/10/1400',
        imageUrl: null),
  ];

  void getOrders() {
    orderListView = ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, i) {
          return OrderCardWidget(
            model: orders[i],
            onViewClick: (selected) {},
          );
        });

    notifyListeners();
  }

  void updateSelectedState(int state)
  {
    selectedState = state;
    notifyListeners();
  }
}
