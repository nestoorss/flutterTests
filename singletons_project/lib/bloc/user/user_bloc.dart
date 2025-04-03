import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:singletons_project/models/usuario.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {

    UserBloc() : super(const UserInitialState()) {
      on<ActivateUser>((event, emit) => emit(UserSetState(event.user)));
      on<DeleteUser>((event, emit) => emit(UserInitialState()));
      on<ChangeUserAge>((event, emit) {
        if (!state.existUser) return;
        emit(UserSetState(state.user!.copyWith(edad: event.age)));
      });
      on<AddProfession>((event, emit) {
        if (!state.existUser) return;
        final professions = [...state.user!.profesiones, event.profession];
        emit(UserSetState(state.user!.copyWith(profesiones: professions)));
      });
    }

}