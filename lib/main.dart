import 'package:deciml_bly/repository/repository.dart';
import 'package:deciml_bly/views/views.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  final LocalRepository localRepository = await LocalRepository.instance;
  runApp(MyApp(
    localRepository: localRepository,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.localRepository});

  final LocalRepository localRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<LocalRepository>(
          create: (context) => localRepository,
        ),
        RepositoryProvider<TransactionRepository>(
          create: (context) => TransactionRepository(
            localRepository: localRepository,
          ),
        ),
        RepositoryProvider<UserRepository>(
          create: (context) => UserRepository(
            localRepository: localRepository,
          ),
        ),
      ],
      child: GlobalLoaderOverlay(
        overlayOpacity: 0.5,
        overlayColor: Colors.brown.withOpacity(0.5),
        useDefaultLoading: false,
        overlayWidget: const Center(
          child: Text(
            'Loading...',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            primaryColor: Colors.blueGrey,
            useMaterial3: true,
            appBarTheme: const AppBarTheme(
              color: Colors.blueGrey,
            ),
          ),
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
