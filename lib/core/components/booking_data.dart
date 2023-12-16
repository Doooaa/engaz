// ignore_for_file: public_member_api_docs, sort_constructors_first
class BookingOrder {
  String? orderId;
  String? orderName;
  String? orderImage;
  String? orderDate;
  String? BookingTime;
  String? BookingDate;
  String? orderDescription;
  //user info
  String? clientName;
  String? clientPhone;
  String? clientCity;
  String? fullAddress;
  BookingOrder({
    this.orderId,
    this.orderName,
    this.orderImage,
    this.orderDate,
    this.BookingTime,
    this.BookingDate,
    this.orderDescription,
    this.clientName,
    this.clientPhone,
    this.clientCity,
    this.fullAddress,
  });
  static List<BookingOrder> BookingOrderList = [
    BookingOrder(
      orderId: "44",
      orderName: "نجار",
      orderDescription: "عايز 5 كراسي بحجم 44*22",
      orderImage: "",
      orderDate: "22-12-2023",
      BookingTime: "12:00 Am",
      BookingDate: "27-12-2023",
      clientName: "doaa gamal",
      clientPhone: "012755672363",
      clientCity: "city",
      fullAddress: "street",
    ),
    BookingOrder(
      orderId: "222",
      orderName: "نقاش",
      orderDescription: "عايز 5 اي حاجه اي حاج يعم 44*22",
      orderImage: "",
      orderDate: "22-12-2023",
      BookingTime: "1:00 Am",
      BookingDate: "28-12-2023",
      clientName: "doaa gamal",
      clientPhone: "012755672363",
      clientCity: "city",
      fullAddress: "street",
    ),
  ];
}
