

enum ApiStatus {initial , loading , success , failure}

class ApiEndpoints {
  static const login = '/auth/login';
  static const getProfile = '/auth/me';
  static const getProducts = '/products';
  static const getProductDetails = '/products';
}

class ApiBaseUrl {
  static const baseUrl = 'https://dummyjson.com';
}