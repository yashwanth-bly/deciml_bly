import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/repository.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit({required LocalRepository localRepository})
      : _localRepository = localRepository,
        super(SplashInitial());
  final LocalRepository _localRepository;
  void getUser() async {
    final String userId = _localRepository.getUserId();
    if (userId.isEmpty) {
      await FirebaseAuth.instance.signInAnonymously();
      var user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        var uid = user.uid;
        _localRepository.setUserId(uid);
      }
    }
    // Random delay to show Splash screen
    await Future<void>.delayed(const Duration(seconds: 2));
    emit(SplashUserLoggedIn());
  }
}
