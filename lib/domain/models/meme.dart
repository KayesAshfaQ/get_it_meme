import 'meme_element.dart';

class Meme {
  int? count;
  List<MemeElement>? memes;

  Meme({
    this.count,
    this.memes,
  });

  factory Meme.fromJson(Map<String, dynamic> json) => Meme(
    count: json["count"],
    memes: json["memes"] == null ? [] : List<MemeElement>.from(json["memes"]!.map((x) => MemeElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "memes": memes == null ? [] : List<dynamic>.from(memes!.map((x) => x.toJson())),
  };
}