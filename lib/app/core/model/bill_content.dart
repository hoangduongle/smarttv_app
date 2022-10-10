class BillContent {
  String? id;
  double? totalAmount;
  String? createDate;
  String? updateDate;
  String? createBy;
  String? lastModifyBy;

  BillContent(
      {this.id,
      this.totalAmount,
      this.createDate,
      this.updateDate,
      this.createBy,
      this.lastModifyBy});

  @override
  String toString() {
    return 'BillContent(id: $id, totalAmount: $totalAmount, createDate: $createDate, updateDate: $updateDate, createBy: $createBy, lastModifyBy: $lastModifyBy)';
  }
}
