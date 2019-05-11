import 'package:test/test.dart';
import 'package:dartpedia/dartpedia.dart' as prefix1;

void main() {
  /* If a topic is unknown, the code will throw a MissingTitleException, this should be caught  */
  test("Testing MissingTitleException", () {
    prefix1.Page page = prefix1.Page();
    // Function throws an Exception
    expect(
        page.parseWikipediaPage(
            'zzzzz', {'action': 'parse', 'page': 'zzzzz', 'format': 'json'}),
        throwsException);

    // Function throws a MissingTitleException
    expect(
        page.parseWikipediaPage(
            'zzzzz', {'action': 'parse', 'page': 'zzzzz', 'format': 'json'}),
        throwsA(prefix1.MissingTitleException));
  });
}
