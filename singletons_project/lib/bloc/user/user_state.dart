part of 'user_bloc.dart';

@immutable
abstract class UserState {

  final bool existUser;
  final Usuario? user;

  const UserState({this.existUser = false, this.user});

}