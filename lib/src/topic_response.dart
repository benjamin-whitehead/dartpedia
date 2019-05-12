import 'wikipedia_response.dart';
import 'package:dio/dio.dart';

class TopicResponse implements WikipediaResponse {
  Future parse(String topic, Map<String, dynamic> params) async {
    Response response = await Dio()
        .get("https://en.wikipedia.org/w/api.php", queryParameters: params);
    var pageData = response.data;
    return pageData;
  }

  void clean(dynamic pageData) {
    pageData.remove('batchcomplete');
    pageData.remove('continue');
  }
}
