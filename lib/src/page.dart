import 'dart:async';
import 'wikipedia_page.dart';

/// The data recieved by the Wikipedia API is messy, this get's rid of unessential data
void cleanData(dynamic pageData) {
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

/// Create's a list of all the links from the Wikipedia Page.
dynamic getLinks(List<dynamic> linkData) {
  List<String> list = List<String>();
  linkData.forEach((e) => list.add(e['*'] as String));
  return list;
}

/// Wraps a WikipediaPage object inside of a Future so it can be used.
Future page(String topic) async {
  var pageData = await parseWikipediaPage(
      topic, {'action': 'parse', 'page': topic, 'format': 'json'});
  cleanData(pageData);
  dynamic pageLinks = getLinks(pageData['parse']['links']);
  WikipediaPage page = WikipediaPage(
      title: pageData['parse']['title'],
      content: pageData['parse']['text']['*'],
      pageId: pageData['parse']['pageid'],
      links: pageLinks);
  return page;
}
