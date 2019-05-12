// Exception used by Page to determine if a Wikipedia Page exists or not
class MissingTitleException implements Exception {
  String cause;
  MissingTitleException(String cause);
}

class WikipediaPage {
  // Title of the Page, a link friendly version of the title, and the content of the page
  String _title, _titleLink, _content;
  // The Wikipedia Page Identifier
  int _pageId;
  // A list of links found on the WikipediaPage
  dynamic _links;

  // The base URL for the Wikipedia API
  static const String URL = "https://en.wikipedia.org/w/api.php";

  WikipediaPage({String title, String content, int pageId, dynamic links}) {
    this._title = title;
    this._content = content;
    this._pageId = pageId;
    this._links = links;
    // Replaces the spaces in the title with underscores via Wikipedia Syntax
    if (title != null) this._titleLink = title.replaceAll(' ', '_');
  }

  /// Return's a summary of the Wikipedia Article represented by this class.
  Object longSummary() {
    var buffer = StringBuffer();
    buffer.write('TITLE:  ${this._title}\n');
    buffer.write('URL:  http://en.wikipedia.org/wiki/$_titleLink\n');
    buffer.write('ID:  ${this._pageId}\n');
    buffer.write('LINKS:  ${this._links}\n');
    buffer.write('PAGE CONTENT: ${this._content}\n');
    return buffer.toString();
  }

  /// Summary of a Wikipedia Page up to 300 characters long
  Object shortSummary() {
    var buffer = StringBuffer();
    buffer.write('TITLE:  ${this._title}\n');
    buffer.write('URL:  http://en.wikipedia.org/wiki/$_titleLink\n');
    buffer.write('ID:  ${this._pageId}\n');
    buffer.write('LINKS:  ${this._links}\n');
    buffer.write('PAGE CONTENT: ${this.summarizeContentUpTo(300)}\n');
    return buffer.toString();
  }

  /// Summarize's the content of the Wikipedia Page up to length characters long
  Object summarizeContentUpTo(int length) {
    return this._content.substring(0, length);
  }

  // Summarize's the content of the Wikipedia Page from start to end character
  Object summarizeContentFromTo(int start, int end) {
    return this._content.substring(start, end);
  }

  @override
  String toString() {
    return this.title;
  }

  String get title => _title;
  String get content => _content;
  String get url => 'http://en.wikipedia.org/wiki/$_titleLink';
  int get pageId => _pageId;
  dynamic get links => _links;
}
