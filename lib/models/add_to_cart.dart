
class AddToCart {
  int? id;
  List<Products>? products;
  double? total;
  int? discountedTotal;
  int? userId;
  int? totalProducts;
  int? totalQuantity;

  AddToCart({this.id, this.products, this.total, this.discountedTotal, this.userId, this.totalProducts, this.totalQuantity});

  AddToCart.fromJson(Map<String, dynamic> json) {
    id = json["id"];

    products = json["products"] == null
        ? null
        : (json["products"] as List)
        .map((e) => Products.fromJson(e))
        .toList();

    total = (json["total"] as num?)?.toDouble();               // ✅ FIX
    discountedTotal = json["discountedTotal"];                 // keep int if int
    userId = json["userId"];
    totalProducts = json["totalProducts"];
    totalQuantity = json["totalQuantity"];
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
    return _data;
  }

  AddToCart copyWith({
    int? id,
    List<Products>? products,
    double? total,
    int? discountedTotal,
    int? userId,
    int? totalProducts,
    int? totalQuantity,
  }) => AddToCart(
    id: id ?? this.id,
    products: products ?? this.products,
    total: total ?? this.total,
    discountedTotal: discountedTotal ?? this.discountedTotal,
    userId: userId ?? this.userId,
    totalProducts: totalProducts ?? this.totalProducts,
    totalQuantity: totalQuantity ?? this.totalQuantity,
  );
}

class Products {
  int? id;
  String? title;
  double? price;
  int? quantity;
  double? total;
  double? discountPercentage;
  double? discountedPrice;
  String? thumbnail;

  Products({this.id, this.title, this.price, this.quantity, this.total, this.discountPercentage, this.discountedPrice, this.thumbnail});

  Products.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    price = (json["price"] as num?)?.toDouble();
    quantity = json["quantity"];
    total = (json["total"] as num?)?.toDouble();
    discountPercentage =
        (json["discountPercentage"] as num?)?.toDouble();
    discountedPrice =
        (json["discountedPrice"] as num?)?.toDouble();   // ✅ FIX
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
    _data["discountedPrice"] = discountedPrice;
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
    double? discountedPrice,
    String? thumbnail,
  }) => Products(
    id: id ?? this.id,
    title: title ?? this.title,
    price: price ?? this.price,
    quantity: quantity ?? this.quantity,
    total: total ?? this.total,
    discountPercentage: discountPercentage ?? this.discountPercentage,
    discountedPrice: discountedPrice ?? this.discountedPrice,
    thumbnail: thumbnail ?? this.thumbnail,
  );
}