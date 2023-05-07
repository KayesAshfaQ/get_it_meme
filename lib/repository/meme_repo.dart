import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../domain/models/meme.dart';

class MemeRepo {
  Future<Meme?> getMeme() async {
    http.Response response =
        await http.get(Uri.parse('https://meme-api.com/gimme/50'));
    try {
      debugPrint('status::: ${response.statusCode}');

      if (response.statusCode == 200) {
        Meme memeResponse = Meme.fromJson(jsonDecode(response.body));

        print(response.body);
        return memeResponse;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
