import 'package:dartpedia/dartpedia.dart' as wiki;

main() async {
  var relatedTopics = await wiki.search('California');
  print(relatedTopics);
}
