

enum ApiStatus {initial , loading , success , failure}

class ApiEndpoints {
  static const login = '/auth/login';
  static const getProfile = '/auth/me';
  static const getProducts = '/products';
  static String getProductDetails(int id) => '/products/$id';
}

class ApiBaseUrl {
  static const baseUrl = 'https://dummyjson.com';
}


final bannerList = [
  "assets/images/slider_image.png",
  "assets/images/new_product.png",
  "https://yourbanner3.png",
];
