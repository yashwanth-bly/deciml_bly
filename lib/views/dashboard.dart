import 'package:deciml_bly/bloc/bloc.dart';
import 'package:deciml_bly/repository/repository.dart';
import 'package:deciml_bly/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<DashBoardCubit>().getMonthlyAmount();
    context.read<DashBoardTotalCubit>().getTotalAmount();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade100.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    const Text(
                      "Total",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                    ),
                    BlocBuilder<DashBoardTotalCubit, DashBoardTotalState>(
                      builder: (context, state) {
                        int amount = 0;
                        if (state is DashBoardTotalAmountSuccess) {
                          amount = state.amount;
                        }
                        return Text('₹ $amount');
                      },
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade100.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    const Text(
                      "This month",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                    ),
                    BlocBuilder<DashBoardCubit, DashBoardState>(
                      builder: (context, state) {
                        int amount = 0;
                        if (state is DashBoardMonthAmountSuccess) {
                          amount = state.amount;
                        }
                        return Text('₹ $amount');
                      },
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () => _showTransactionModal(context),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue,
              ),
              width: 120,
              height: 40,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.currency_exchange,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Invest',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _showTransactionModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return BlocProvider<CreateTransactionCubit>(
          create: (context) => CreateTransactionCubit(
            transactionRepository: context.read<TransactionRepository>(),
          ),
          child: const CreateTransactionModal(),
        );
      },
    );
  }
}
