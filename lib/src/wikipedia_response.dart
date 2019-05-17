/// All possible Wikipedia Calls need to have it's own response,
/// this is to abstract the code back a layer to simplify large files
/// Each Response needs to have a parse function, that is responsible
/// for gettings its data, and a clean function, that is responsible
/// for cleaning the data for use in the public API
abstract class WikipediaResponse {
  Future parse(String topic, Map<String, dynamic> params);
  void clean(dynamic pageData);
}
