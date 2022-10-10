import 'package:smarttv_app/app/core/model/service_content.dart';

class BillDetailContent {
  String? billId;
  ServiceContent? serviceContent;
  String? billDate;
  int? quantity;
  double? price;
  double? amount;
  bool? status;

  BillDetailContent(
      {this.billId,
      this.serviceContent,
      this.billDate,
      this.quantity,
      this.price,
      this.amount,
      this.status});

  @override
  String toString() {
    return 'BillDetailContent(billId: $billId, serviceContent: $serviceContent, billDate: $billDate, quantity: $quantity, price: $price, amount: $amount, status: $status)';
  }
}
