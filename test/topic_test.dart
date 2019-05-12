import 'package:test/test.dart';
import 'package:dartpedia/dartpedia.dart' as wiki;

void topic_test() {
  test(
      'Testing Successful Topic Search',
      () => {
            expect(wiki.search("Nelson Mandela").runtimeType.toString(),
                equals("Future<List<String>>"))
          });
}

main() {
  topic_test();
}
