import 'package:dartpedia/dartpedia.dart' as wiki;

int addWordsInPage(wiki.WikipediaPage page) {
  print('Summing Words in: ${page.title}');
  int subSum = 0;
  ((page.content).split(' ')).forEach((e) => {subSum += e.length});
  return subSum;
}

main() async {
  int sum = 0;
  try {
    var page = await wiki.page('\"Hello, World!\" program');
    for (var x in page.links) {
      var subPage = await wiki.page(x);
      sum += addWordsInPage(subPage);
    }
  } catch (ex) {
    print(ex);
  }
  print('Total $sum');
}
