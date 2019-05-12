import 'wikipedia_page.dart';

/// Return's a list of Topics that are similar to term
Future search(String term) async {
  var parameters = {
    'action':"query",
    'list':"search",
    'srsearch': term,
    'format':"json"
  };
  print(parseWikipediaPage(term, parameters));
}