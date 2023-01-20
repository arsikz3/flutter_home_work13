class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "https://api.escuelajs.co";

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 30000;

  // booking endpoints
  static const String getPosts = "$baseUrl/posts";

  static const String getCategories = "$baseUrl/api/v1/categories";
  static const String getProducts = "$baseUrl/api/v1/products";
  // https://api.escuelajs.co/api/v1/products/?categoryId=1
}
