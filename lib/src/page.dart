import 'package:dio/dio.dart';

class MissingTitleException implements Exception {
  String cause;
  MissingTitleException(String cause);
}

class ParamaterException implements Exception {
  String cause;
  ParamaterException(String cause);
}

class Page {
  // Base URL for the Wikipedia API
  static const String URL = "https://en.wikipedia.org/w/api.php";

  String topic, title;
  int pageId;
  Map<String, dynamic> pageData;

  Page(String topic) {
    this.topic = topic;
    buildPage(topic);
  }

  void buildPage(String topic) async {
    Map<String, dynamic> params = {
      'action': 'parse',
      'page': topic,
      'format': 'json'
    };
    await parseWikipediaPage(topic, params);
    //pageData[k].replaceAll(RegExp("<[^>]*>"), "")

    pageData['parse']['text']['*'] = pageData['parse']['text']['*'].replaceAll(RegExp("<[^>]*>"), "");
    print(pageData['parse']['text']['*']);
  }

  Future parseWikipediaPage(String topic, Map<String, dynamic> params) async {
    Response response = await Dio().get(URL, queryParameters: params);
    pageData = response.data;
    if (pageData['error'] != null) {
      final errorCode = pageData['error']['code'];
      if (errorCode == 'missingtitle')
        throw MissingTitleException('Title not found');
      else if (errorCode == 'params')
        throw ParamaterException('Invalid Parameters');
    }
  }
}

main() {
  Page x = Page('New York City');
}
