import 'package:get_it/get_it.dart';
import 'package:warframe_quick/services/user/auth_services.dart';

final getIt = GetIt.instance;

void initGetIt() {
  getIt.registerSingleton<AuthServices>(AuthServices());
}
