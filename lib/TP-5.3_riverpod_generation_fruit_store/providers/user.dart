import 'package:aix_1/TP-5.3_riverpod_generation_fruit_store/models/user.dart';
import 'package:aix_1/TP-5.3_riverpod_generation_fruit_store/repo/user_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user.g.dart';

@riverpod
Future<List<User>> getUsers(Ref ref) async {
  return UserRepo().fetchUsers();
}

@riverpod
Future<int> getUserAmount(Ref ref) async {
  final users = await ref.watch(getUsersProvider.future);
  return users.length;
}

@riverpod
Future<User> getUser(Ref ref, String id) async {
  return UserRepo().fetchUser(id);
}
