
class DeleteCart {
  int? id;
  List<Products>? products;
  double? total;
  double? discountedTotal;
  int? userId;
  int? totalProducts;
  int? totalQuantity;
  bool? isDeleted;
  String? deletedOn;

  DeleteCart({this.id, this.products, this.total, this.discountedTotal, this.userId, this.totalProducts, this.totalQuantity, this.isDeleted, this.deletedOn});

  DeleteCart.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    products = json["products"] == null ? null : (json["products"] as List).map((e) => Products.fromJson(e)).toList();
    total = json["total"];
    discountedTotal = json["discountedTotal"];
    userId = json["userId"];
    totalProducts = json["totalProducts"];
    totalQuantity = json["totalQuantity"];
    isDeleted = json["isDeleted"];
    deletedOn = json["deletedOn"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    if(products != null) {
      _data["products"] = products?.map((e) => e.toJson()).toList();
    }
    _data["total"] = total;
    _data["discountedTotal"] = discountedTotal;
    _data["userId"] = userId;
    _data["totalProducts"] = totalProducts;
    _data["totalQuantity"] = totalQuantity;
    _data["isDeleted"] = isDeleted;
    _data["deletedOn"] = deletedOn;
    return _data;
  }

  DeleteCart copyWith({
    int? id,
    List<Products>? products,
    double? total,
    double? discountedTotal,
    int? userId,
    int? totalProducts,
    int? totalQuantity,
    bool? isDeleted,
    String? deletedOn,
  }) => DeleteCart(
    id: id ?? this.id,
    products: products ?? this.products,
    total: total ?? this.total,
    discountedTotal: discountedTotal ?? this.discountedTotal,
    userId: userId ?? this.userId,
    totalProducts: totalProducts ?? this.totalProducts,
    totalQuantity: totalQuantity ?? this.totalQuantity,
    isDeleted: isDeleted ?? this.isDeleted,
    deletedOn: deletedOn ?? this.deletedOn,
  );
}

class Products {
  int? id;
  String? title;
  double? price;
  int? quantity;
  double? total;
  double? discountPercentage;
  double? discountedTotal;
  String? thumbnail;

  Products({this.id, this.title, this.price, this.quantity, this.total, this.discountPercentage, this.discountedTotal, this.thumbnail});

  Products.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    price = json["price"];
    quantity = json["quantity"];
    total = json["total"];
    discountPercentage = json["discountPercentage"];
    discountedTotal = json["discountedTotal"];
    thumbnail = json["thumbnail"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["title"] = title;
    _data["price"] = price;
    _data["quantity"] = quantity;
    _data["total"] = total;
    _data["discountPercentage"] = discountPercentage;
    _data["discountedTotal"] = discountedTotal;
    _data["thumbnail"] = thumbnail;
    return _data;
  }

  Products copyWith({
    int? id,
    String? title,
    double? price,
    int? quantity,
    double? total,
    double? discountPercentage,
    double? discountedTotal,
    String? thumbnail,
  }) => Products(
    id: id ?? this.id,
    title: title ?? this.title,
    price: price ?? this.price,
    quantity: quantity ?? this.quantity,
    total: total ?? this.total,
    discountPercentage: discountPercentage ?? this.discountPercentage,
    discountedTotal: discountedTotal ?? this.discountedTotal,
    thumbnail: thumbnail ?? this.thumbnail,
  );
}