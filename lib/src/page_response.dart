import 'wikipedia_response.dart';
import 'package:dio/dio.dart';
import 'wikipedia_page.dart';

class PageResponse implements WikipediaResponse {
  Future parse(String topic, Map<String, dynamic> params) async {
    Response response = await Dio()
        .get("https://en.wikipedia.org/w/api.php", queryParameters: params);
    var pageData = response.data;
    if (pageData['error'] != null) {
      final errorCode = pageData['error']['code'];
      if (errorCode == 'missingtitle') {
        throw MissingTitleException('Title not found');
      }
      else {
        throw Exception;
      }
    } else
      return pageData;
  }

  void clean(dynamic pageData) {
    pageData['parse'].remove('langlinks');
    pageData['parse'].remove('categories');
    pageData['parse'].remove('templates');
    pageData['parse'].remove('images');
    pageData['parse'].remove('externallinks');
    pageData['parse'].remove('sections');
    pageData['parse'].remove('parsewarnings');
    pageData['parse'].remove('iwlinks');
    pageData['parse'].remove('properties');
    pageData['parse']['text']['*'] = pageData['parse']['text']['*']
        .replaceAll(RegExp("<[^>]*>"), "")
        .replaceAll(RegExp("[&][#][0-9]{2}"), " ")
        .replaceAll('\n', '');
  }
}
