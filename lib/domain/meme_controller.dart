import 'package:get_it_meme/locator.dart';
import 'package:get_it_meme/repository/meme_repo.dart';

import 'models/meme.dart';

class MemeDomainController {
  Future<Meme?> getNextMeme() async {
    // TODO 6: call the repository to get meme
    return locator.get<MemeRepo>().getMeme();
  }
}
