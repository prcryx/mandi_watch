import 'package:mandi_watch/data/models/mandi_data.dart';
import 'package:mandi_watch/services/http/http_client.dart';

class HomeRepository {
  final HttpClient _client;
  const HomeRepository(this._client);
  Future<MandiData> getMandiData() async {
    String reqStr = "/3e67b151-ff77-4d4c-ac5c-e5e8048f94e4";
    final response = await _client.get(reqStr);
    return MandiData.fromJson(response);
  }
}
