import 'package:deciml_bly/bloc/bloc.dart';
import 'package:deciml_bly/models/model.dart';
import 'package:deciml_bly/repository/repository.dart';
import 'package:deciml_bly/utils/transaction_type_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.read<TransactionCubit>().list();
    return BlocListener<TransactionCubit, TransactionState>(
      listener: (context, state) {},
      child: BlocBuilder<TransactionCubit, TransactionState>(
        builder: (context, state) {
          if (state is TransactionLoading) {
            return const Center(child: Text('Loading'));
          }
          if (state is TransactionFailure) {
            return const Center(child: Text('Transaction Failed'));
          }
          if (state is! TransactionSuccess) {
            return const SizedBox();
          }
          return ListView.separated(
            itemCount: state.list.length,
            padding:
                const EdgeInsets.only(left: 24, right: 24, top: 20, bottom: 50),
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 10,
              );
            },
            itemBuilder: (BuildContext context, int index) {
              final Transactions transactionData = state.list[index];
              return Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade100.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                width: double.infinity,
                child: Row(
                  children: [
                    if (transactionData.type == TransactionType.credit)
                      const Icon(
                        Icons.arrow_downward,
                        color: Colors.green,
                        size: 24,
                      )
                    else
                      const Icon(
                        Icons.arrow_upward,
                        color: Colors.red,
                        size: 24,
                      ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ID: ${transactionData.id}',
                              style: const TextStyle(
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              '${transactionData.type.name} : ${transactionData.amount}',
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              DateFormat('dd-MMM-yyyy hh:mm aa')
                                  .format(transactionData.createdAt),
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      "${transactionData.invested}",
                      style: const TextStyle(fontSize: 25),
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
