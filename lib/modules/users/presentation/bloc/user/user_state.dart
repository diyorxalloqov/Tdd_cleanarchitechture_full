part of 'user_bloc.dart';

@freezed
class UserState with _$UserState {
  const factory UserState(
      {@Default(ActionStatus.isPure) ActionStatus status,
      @Default([]) List<UserEntity> list}) = _UsersState;
}
