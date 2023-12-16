// ignore_for_file: public_member_api_docs, sort_constructors_first
class Order {
  String? orderId;
  String? orderName;
  String? orderImage;
  String? orderDate;
  String? orderDescription;
  //user info
  String? clientName;
  String? clientPhone;
  String? clientCity;
  String? fullAddress;
  Order({
    this.orderId,
    this.orderName,
    this.orderImage,
    this.orderDate,
    this.orderDescription,
    this.clientName,
    this.clientPhone,
    this.clientCity,
    this.fullAddress,
  });
  static List<Order> ordersList = [
    Order(
      orderId: "22",
      orderName: "نجار",
      orderDescription: "عايز 5 كراسي بحجم 44*22",
      orderImage: "",
      orderDate: "22-12-2023",
      clientName: "doaa gamal",
      clientPhone: "012755672363",
      clientCity: "city",
      fullAddress: "street",
    ),
    Order(
      orderId: "22",
      orderName: "سباك",
      orderDescription: "عايز 5 كراسي بحجم 44*22",
      orderImage: "",
      orderDate: "22-12-2023",
      clientName: "doaa gamal",
      clientPhone: "012755672363",
      clientCity: "city",
      fullAddress: "street",
    ),
  ];
}


