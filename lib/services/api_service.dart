// abstract class ApiService {
// Future<List<dynamic>> fetchData(); // Abstract method
// }

abstract class ApiService<T> {
  Future<List<T>> fetchData();
}
