import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tdd_cached_clean_architechture_full_/modules/users/data/model/user_model.dart';
import 'package:tdd_cached_clean_architechture_full_/modules/users/domain/entity/user_entity.dart';
import 'package:tdd_cached_clean_architechture_full_/modules/users/domain/usecase/get_users.dart';
import 'package:tdd_cached_clean_architechture_full_/utils/failures.dart';
import 'package:tdd_cached_clean_architechture_full_/utils/status.dart';

part 'user_state.dart';
part 'user_event.dart';
part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUsersUsecase getUsersUsecase;

  UserBloc(this.getUsersUsecase) : super(const UserState()) {
    on<_USersGetEvent>((event, emit) async {
      emit(state.copyWith(status: ActionStatus.isLoading));
      Either<Failure, List<UserModel>> result = await getUsersUsecase(2);
      result.fold(
          (l) => left(emit(state.copyWith(status: ActionStatus.isFailed))),
          (r) => right(
              emit(state.copyWith(status: ActionStatus.isSuccess, list: r))));
    });
  }
}
