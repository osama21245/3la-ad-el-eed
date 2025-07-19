abstract class BlockUserState {}

class BlockUserInitial extends BlockUserState {}
class BlockUserLoading extends BlockUserState {}
class BlockUserSuccess extends BlockUserState {}
class BlockUserError extends BlockUserState {
  final String error;
  BlockUserError({required this.error});
}

class UserIsBlocked extends BlockUserState {}
class UserIsNotBlocked extends BlockUserState {}
