import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../model/models/user_model.dart';
import '../model/services/user_service.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserService service;
  UserBloc(this.service) : super(UserInitial()) {
    List<UserModel> users = [];
    on<GetUserEvent>((event, emit) async {
      try {
        emit(UserLoading());
        users = await service.getUser();
        emit(UserSuccess(data: users));
      } catch (e) {
        emit(UserLoading());
      }
    });
  }
}
