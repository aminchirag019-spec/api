
class AllCarts {
  List<Carts>? carts;
  int? total;
  int? skip;
  int? limit;

  AllCarts({this.carts, this.total, this.skip, this.limit});

  AllCarts.fromJson(Map<String, dynamic> json) {
    carts = json["carts"] == null ? null : (json["carts"] as List).map((e) => Carts.fromJson(e)).toList();
    total = json["total"];
    skip = json["skip"];
    limit = json["limit"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(carts != null) {
      _data["carts"] = carts?.map((e) => e.toJson()).toList();
    }
    _data["total"] = total;
    _data["skip"] = skip;
    _data["limit"] = limit;
    return _data;
  }

  AllCarts copyWith({
    List<Carts>? carts,
    int? total,
    int? skip,
    int? limit,
  }) => AllCarts(
    carts: carts ?? this.carts,
    total: total ?? this.total,
    skip: skip ?? this.skip,
    limit: limit ?? this.limit,
  );
}

class Carts {
  int? id;
  List<Products>? products;
  double? total;
  double? discountedTotal;
  int? userId;
  int? totalProducts;
  int? totalQuantity;

  Carts({this.id, this.products, this.total, this.discountedTotal, this.userId, this.totalProducts, this.totalQuantity});

  Carts.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    products = json["products"] == null ? null : (json["products"] as List).map((e) => Products.fromJson(e)).toList();
    total = json["total"];
    discountedTotal = json["discountedTotal"];
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

  Carts copyWith({
    int? id,
    List<Products>? products,
    double? total,
    double? discountedTotal,
    int? userId,
    int? totalProducts,
    int? totalQuantity,
  }) => Carts(
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
  double? discountedTotal;
  String? thumbnail;

  Products({this.id, this.title, this.price, this.quantity, this.total, this.discountPercentage, this.discountedTotal, this.thumbnail});

  Products.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    price = (json["price"] as num?)?.toDouble();                // ✅ FIX
    quantity = json["quantity"];
    total = (json["total"] as num?)?.toDouble();                // ✅ FIX
    discountPercentage =
        (json["discountPercentage"] as num?)?.toDouble();       // ✅ FIX
    discountedTotal =
        (json["discountedTotal"] as num?)?.toDouble();          // ✅ FIX
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