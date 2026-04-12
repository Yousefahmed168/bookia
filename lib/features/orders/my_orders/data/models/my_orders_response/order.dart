class Order {
  int? id;
  String? orderCode;
  String? orderDate;
  String? status;
  String? total;

  Order({this.id, this.orderCode, this.orderDate, this.status, this.total});

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json['id'] as int?,
    orderCode: json['order_code']?.toString(),
    orderDate: json['order_date']?.toString(),
    status: json['status']?.toString(),
    total: json['total']?.toString(),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'order_code': orderCode,
    'order_date': orderDate,
    'status': status,
    'total': total,
  };
}
