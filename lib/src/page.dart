import 'dart:async';
import 'wikipedia_page.dart';
import 'page_response.dart';

export 'page_response.dart';

/// Create's a list of all the links from the Wikipedia Page.
dynamic getLinks(List<dynamic> linkData) {
  List<String> list = List<String>();
  linkData.forEach((e) => list.add(e['*'] as String));
  return list;
}

/// Wraps a WikipediaPage object inside of a Future so it can be used.
Future page(String topic) async {
  var pageResponse = PageResponse();
  var pageData = await pageResponse
      .parse(topic, {'action': 'parse', 'page': topic, 'format': 'json'});
  pageResponse.clean(pageData);
  dynamic pageLinks = getLinks(pageData['parse']['links']);
  WikipediaPage page = WikipediaPage(
      title: pageData['parse']['title'],
      content: pageData['parse']['text']['*'],
      pageId: pageData['parse']['pageid'],
      links: pageLinks);
  return page;
}
