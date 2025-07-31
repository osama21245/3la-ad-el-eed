import '../data_source/user_remote_data_source.dart';

abstract class UserRepository {
  Future<void> blockUser(String userId);
  Future<bool> isUserBlocked(String userId);
}

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> blockUser(String userId) {
    return remoteDataSource.blockUser(userId);
  }

  @override
  Future<bool> isUserBlocked(String userId) {
    return remoteDataSource.isUserBlocked(userId);
  }
}
