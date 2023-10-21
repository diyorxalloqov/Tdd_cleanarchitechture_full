import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdd_cached_clean_architechture_full_/modules/users/data/repository/user_repositoryImpl.dart';
import 'package:tdd_cached_clean_architechture_full_/modules/users/domain/usecase/get_users.dart';
import 'package:tdd_cached_clean_architechture_full_/modules/users/presentation/bloc/user/user_bloc.dart';
import 'package:tdd_cached_clean_architechture_full_/modules/users/presentation/ui/widgets/user_card.dart';
import 'package:tdd_cached_clean_architechture_full_/utils/status.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<HomePage> {
  late UserBloc usersBloc;

  @override
  void initState() {
    usersBloc = UserBloc(
      GetUsersUsecase(repo: UserRepositoryImpl()),
    )..add(const UserEvent.getUsers());
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: usersBloc,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Users Page',
            ),
          ),
          body: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state.status == ActionStatus.isLoading) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              } else if (state.status == ActionStatus.isSuccess) {
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: (c, index) =>
                      UserCard(entity: state.list[index]),
                  itemCount: state.list.length,
                );
              } else {
                return const Text('error');
              }
            },
          ),
        ),
      );
}
