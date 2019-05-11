import 'package:dartpedia/dartpedia.dart' as wiki;

main() async {
  var words = [];
  try {
    var page = await wiki.page('New York City');
    var pageContents = ((page.content).split(' '));
    pageContents.forEach((e) {
      if (!words.contains(e)) {
        words.add(e);
      }
    });
  } catch (exception) {
    print(exception);
  }
  print(words);
}
