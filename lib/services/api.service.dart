import 'package:http/http.dart' as http;

class ApiService{

  Future<http.Response> getCategories() {
    return http.get(Uri.parse('www.themealdb.com/api/json/v1/1/categories.php'));
  }
}