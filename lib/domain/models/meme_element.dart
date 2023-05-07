
class MemeElement {
  String? postLink;
  String? subreddit;
  String? title;
  String? url;
  bool? nsfw;
  bool? spoiler;
  String? author;
  int? ups;
  List<String>? preview;

  MemeElement({
    this.postLink,
    this.subreddit,
    this.title,
    this.url,
    this.nsfw,
    this.spoiler,
    this.author,
    this.ups,
    this.preview,
  });

  factory MemeElement.fromJson(Map<String, dynamic> json) => MemeElement(
    postLink: json["postLink"],
    subreddit: json["subreddit"],
    title: json["title"],
    url: json["url"],
    nsfw: json["nsfw"],
    spoiler: json["spoiler"],
    author: json["author"],
    ups: json["ups"],
    preview: json["preview"] == null ? [] : List<String>.from(json["preview"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "postLink": postLink,
    "subreddit": subreddit,
    "title": title,
    "url": url,
    "nsfw": nsfw,
    "spoiler": spoiler,
    "author": author,
    "ups": ups,
    "preview": preview == null ? [] : List<dynamic>.from(preview!.map((x) => x)),
  };
}