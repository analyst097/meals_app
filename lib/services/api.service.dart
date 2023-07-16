import 'package:http/http.dart' as http;

class ApiService{
  const ApiService();

  static Future<http.Response> getAllCategories() {
    final url = Uri.https("www.themealdb.com", "api/json/v1/1/categories.php");
    return http.get(
        url,
        headers: {
          'Content-Type': 'application/json'
      }
    );
  }
}