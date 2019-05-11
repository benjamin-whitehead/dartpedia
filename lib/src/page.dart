import 'dart:async';
import 'package:dio/dio.dart';

class MissingTitleException implements Exception {
  String cause;
  MissingTitleException(String cause);
}

/*
  TODO:
    - Add different language support
    - 
*/

class WikipediaPage {
  // Base URL for the Wikipedia API
  static const String URL = "https://en.wikipedia.org/w/api.php";

  String topic, title, titleLink, content;
  int pageId;
  Map<String, dynamic> pageData;
  List<dynamic> links;

  WikipediaPage({String topic}) {
    this.topic = topic;
    if (this.topic != null) buildPage(topic);
  }

  void buildPage(String topic) async {
    Map<String, dynamic> params = {
      'action': 'parse',
      'page': topic,
      'format': 'json'
    };
    await parseWikipediaPage(topic, params).then((value) {
      pageData['parse']['text']['*'] = pageData['parse']['text']['*']
          .replaceAll(RegExp("<[^>]*>"), "")
          .replaceAll(RegExp("[&][#][0-9]{2}"), "");
    });
    setData();
  }

  void setData() {
    /* DELETING UNNCESSARY DATA */
    pageData.remove('properties');
    pageData.remove('images');
    pageData.remove('templates');
    pageData.remove('parsewarnings');
    pageData.remove('langlinks');
    title = pageData['parse']['title'];
    titleLink = title.replaceAll(RegExp(' +'), '_');
    content = pageData['parse']['text']['*'];
  }

  Future parseWikipediaPage(String topic, Map<String, dynamic> params) async {
    Response response = await Dio().get(URL, queryParameters: params);
    pageData = response.data;
    if (pageData['error'] != null) {
      final errorCode = pageData['error']['code'];
      if (errorCode == 'missingtitle')
        throw MissingTitleException('Title not found');
    }
  }

  String get url => 'http://en.wikipedia.org/wiki/$titleLink';
}

Future page(String topic) {}
