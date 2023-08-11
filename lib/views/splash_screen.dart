import 'package:deciml_bly/repository/repository.dart';
import 'package:deciml_bly/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/splash/splash_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashCubit>(
      create: (context) => SplashCubit(
        localRepository: context.read<LocalRepository>(),
      )..getUser(),
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is SplashUserLoggedIn) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const HomeContainer()),
            );
          }
        },
        child: const Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Deciml',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w300,
                      color: Colors.black87),
                ),
                Text('By Yashwanth B L'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
