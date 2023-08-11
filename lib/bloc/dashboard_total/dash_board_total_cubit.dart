import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deciml_bly/models/model.dart';
import 'package:equatable/equatable.dart';

import '../../repository/transaction_repository.dart';

part 'dash_board_total_state.dart';

class DashBoardTotalCubit extends Cubit<DashBoardTotalState> {
  DashBoardTotalCubit({required TransactionRepository transactionRepository})
      : _transactionRepository = transactionRepository,
        super(DashBoardTotalInitial());
  final TransactionRepository _transactionRepository;
  void getTotalAmount() async {
    emit(DashBoardTotalAmountLoading());
    try {
      Query<Map<String, dynamic>> query = await _transactionRepository.list();
      query.snapshots().listen((event) {
        int amt = 0;

        for (var e in event.docs) {
          final data = Transactions.fromJson(e.data(), id: e.id);
          amt += data.invested;
        }

        emit(DashBoardTotalAmountSuccess(amount: amt));
      });
    } catch (e) {
      emit(DashBoardTotalAmountError());
    }
  }
}
