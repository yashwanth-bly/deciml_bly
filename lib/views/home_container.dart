import 'package:deciml_bly/bloc/bloc.dart';
import 'package:deciml_bly/repository/repository.dart';
import 'package:deciml_bly/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeContainer extends StatefulWidget {
  const HomeContainer({super.key});

  @override
  State<HomeContainer> createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          _getTitleText(),
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: _getBody(),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blueGrey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              iconSize: 50,
              icon: const Icon(Icons.library_books),
              color: index == 0 ? Colors.cyanAccent : Colors.white,
              onPressed: () => _menuSelected(0),
            ),
            IconButton(
              iconSize: 50,
              icon: const Icon(Icons.add_home_rounded),
              color: index == 1 ? Colors.cyanAccent : Colors.white,
              onPressed: () => _menuSelected(1),
            ),
            IconButton(
              iconSize: 50,
              icon: const Icon(Icons.person),
              color: index == 2 ? Colors.cyanAccent : Colors.white,
              onPressed: () => _menuSelected(2),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getBody() {
    switch (index) {
      case 0:
        return BlocProvider<TransactionCubit>(
          create: (context) => TransactionCubit(
            transactionRepository: context.read<TransactionRepository>(),
          ),
          child: const TransactionPage(),
        );
      case 1:
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => DashBoardCubit(
                transactionRepository: context.read<TransactionRepository>(),
              ),
            ),
            BlocProvider<DashBoardTotalCubit>(
              create: (context) => DashBoardTotalCubit(
                transactionRepository: context.read<TransactionRepository>(),
              ),
            ),
          ],
          child: const Dashboard(),
        );
      case 2:
        return const ProfilePage();
    }
    return const Center(
      child: Text('bottom navigation page'),
    );
  }

  void _menuSelected(int i) {
    setState(() {
      index = i;
    });
  }

  String _getTitleText() {
    switch (index) {
      case 0:
        return 'Transactions';
      case 1:
        return 'Dashboard';
      case 2:
        return 'Profile';
    }
    return '';
  }
}
