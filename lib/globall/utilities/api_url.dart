

enum ApiStatus {initial , loading , success , failure,otpSent,otpAuthenticated}

class ApiEndpoints {
  static const login = '/auth/login';
  static const getProfile = '/auth/me';
  static const getProducts = '/products';
  static String getProductDetails(int id) => '/products/$id';
  static const addToCart = '/carts/add';
  static const allCarts = '/carts';
}

class ApiBaseUrl {
  static const baseUrl = 'https://dummyjson.com';
}

