import 'package:test/test.dart';
import 'package:dartpedia/dartpedia.dart' as wiki;

main() {
  test("Testing MissingTitleException", () => {
    expect(wiki.parseWikipediaPage('zzzzz', {'action': 'parse', 'page': 'zzzzz', 'format': 'json'}), throwsException)
  });


  test("Testing summarizeContentUpTo", () => {
    expect(wiki.WikipediaPage(content: 'Hello World').summarizeContentUpTo(5), equals("Hello"))
  });


  test("Testing summarizeContentFromTo", () => {
    expect(wiki.WikipediaPage(content: 'Hello World').summarizeContentFromTo(6, 11), equals("World"))
  });

}