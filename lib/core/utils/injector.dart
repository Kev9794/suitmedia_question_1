import 'package:get_it/get_it.dart';
import 'package:suitmedia_question_1/bloc/user_bloc.dart';
import 'package:suitmedia_question_1/model/services/user_service.dart';

final GetIt locator = GetIt.instance;

void init() {
  locator.registerFactory(() => UserBloc(locator()));
  locator.registerLazySingleton<UserService>(() => UserService());
}
