import 'dart:convert';

List<Bookmarks> bookmarksFromJson(String str) =>
    List<Bookmarks>.from(json.decode(str).map((x) => Bookmarks.fromJson(x)));

String bookmarksToJson(List<Bookmarks> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Bookmarks {
  Bookmarks({
    required this.title,
    required this.word,
  });

  String title;
  String word;

  factory Bookmarks.fromJson(Map<String, dynamic> json) => Bookmarks(
        title: json["title"],
        word: json["word"],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['word'] = word;
    return data;
  }
}
