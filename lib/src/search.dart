import 'topic_response.dart';

/// Get's a list of topic related to the topic passed into the function
Future<List<String>> search(String topic) async {
  List<String> relatedTopics = List<String>();
  Map<String, dynamic> params = {
    "action": "query",
    "list": "search",
    "srsearch": topic,
    "format": "json"
  };
  var topicResponse = TopicResponse();
  var pageData = await topicResponse.parse(topic, params);
  topicResponse.clean(pageData);
  pageData['query']['search']
      .forEach((e) => {relatedTopics.add(e['title'] as String)});
  return relatedTopics;
}
