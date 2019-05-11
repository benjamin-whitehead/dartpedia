import 'package:dartpedia/dartpedia.dart' as wiki;

main() async {
  try {
    var wikipediaPage = await wiki.page('Dart (programming language)');
    print('Page url: ${wikipediaPage.url}');
    print('Page title: ${wikipediaPage.title}');
    print('Page links: ${wikipediaPage.links}');
    print('Page body: ${wikipediaPage.body}');
  } catch (exception) {
    print(exception);
  }
}