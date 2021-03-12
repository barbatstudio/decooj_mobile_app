class OrdersModel {
  final int id;
  final int orderType;
  final int state;
  final String uniqueCode;
  final String orderDate;
  final String imageUrl;

  OrdersModel(
      {this.id,
      this.orderType,
      this.state,
      this.uniqueCode,
      this.orderDate,
      this.imageUrl});
}
