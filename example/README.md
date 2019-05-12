## Examples:
The following are example programs using the dartpedia package:
* Getting all unique words in a given Wikipedia Page
* Getting the sum of all lengths of words in a given Wikipedia's Sub Pages

## Examples
### Getting all unique words in a given Wikipedia Page:
```dart
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
```
### Summing up the lengths of all the words in each sub page of a given topic:
```dart
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
```
### Getting all related topics for a certain phrase
```dart
import 'package:dartpedia/dartpedia.dart' as wiki;

main() async {
  var relatedTopics = await wiki.search('California');
  print(relatedTopics);
}
```
