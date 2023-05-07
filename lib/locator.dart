// TODO 2:  create get-it locator
import 'package:get_it/get_it.dart';
import 'package:get_it_meme/domain/meme_controller.dart';
import 'package:get_it_meme/repository/meme_repo.dart';

final locator = GetIt.instance;

// TODO 3:  create a setup method and create our services
void setup() {
  locator.registerLazySingleton<MemeRepo>(() => MemeRepo());
  locator.registerLazySingleton<MemeDomainController>(
      () => MemeDomainController());
}
