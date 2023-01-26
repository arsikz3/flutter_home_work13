class Endpoints {
  Endpoints._();

  static const String baseUrl = "https://api.escuelajs.co";

  static const int receiveTimeout = 15000;

  static const int connectionTimeout = 30000;

  static const String getPosts = "$baseUrl/posts";

  static const String getCategories = "$baseUrl/api/v1/categories";
  static const String getProducts = "$baseUrl/api/v1/products";
}
