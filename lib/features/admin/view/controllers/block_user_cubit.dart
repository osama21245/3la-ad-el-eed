import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repository/user_repository.dart';
import 'block_user_states.dart';

class BlockUserCubit extends Cubit<BlockUserState> {
  final UserRepository userRepository;

  BlockUserCubit({required this.userRepository}) : super(BlockUserInitial());

  Future<void> blockUser(String userId) async {
    emit(BlockUserLoading());
    try {
      await userRepository.blockUser(userId);
      emit(BlockUserSuccess());
    } catch (e) {
      emit(BlockUserError(error: e.toString()));
    }
  }

  Future<void> checkIfUserBlocked(String userId) async {
    emit(BlockUserLoading());
    try {
      final isBlocked = await userRepository.isUserBlocked(userId);
      if (isBlocked) {
        emit(UserIsBlocked());
      } else {
        emit(UserIsNotBlocked());
      }
    } catch (e) {
      emit(BlockUserError(error: e.toString()));
    }
  }
}
