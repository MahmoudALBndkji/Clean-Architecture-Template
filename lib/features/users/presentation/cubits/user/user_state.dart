part of 'user_cubit.dart';

class UserState extends Equatable {
  final BaseState<List<DataEntity>> users;
  final BaseState<DataEntity> userDetails;

  const UserState({
    required this.users,
    required this.userDetails,
  });

  factory UserState.initial() {
    return const UserState(
      users: BaseState<List<DataEntity>>(),
      userDetails: BaseState<DataEntity>(),
    );
  }

  UserState copyWith({
    BaseState<List<DataEntity>>? users,
    BaseState<DataEntity>? userDetails,
    bool? isFavorite,
  }) {
    return UserState(
      users: users ?? this.users,
      userDetails: userDetails ?? this.userDetails,
    );
  }

  @override
  List<Object?> get props => [users, userDetails];
}
