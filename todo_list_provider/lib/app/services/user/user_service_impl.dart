import 'package:firebase_auth/firebase_auth.dart';

import 'package:todo_list_provider/app/repositories/user/user_repository.dart';
import 'package:todo_list_provider/app/services/user/user_service.dart';

class UserServiceImpl implements UserService {
  final UserRepository _userRepository;
  UserServiceImpl({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  Future<User?> register(String email, String password) =>
      _userRepository.register(email, password);

  @override
  Future<User?> login(String email, String password) =>
      _userRepository.login(email, password);

  @override
  Future<void> forgotPassword(String email) async =>
      await _userRepository.forgotPassword(email);

  @override
  Future<User?> googleLogin() async => await _userRepository.googleLogin();

  @override
  Future<void> logout() async => await _userRepository.logout();

  @override
  Future<void> updateDisplayName(String name) async =>
      await _userRepository.updateDisplayName(name);
}
