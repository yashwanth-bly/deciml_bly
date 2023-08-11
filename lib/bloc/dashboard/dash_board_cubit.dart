import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deciml_bly/models/model.dart';
import 'package:equatable/equatable.dart';

import '../../repository/transaction_repository.dart';

part 'dash_board_state.dart';

class DashBoardCubit extends Cubit<DashBoardState> {
  DashBoardCubit({required TransactionRepository transactionRepository})
      : _transactionRepository = transactionRepository,
        super(DashBoardInitial());
  final TransactionRepository _transactionRepository;

  void getMonthlyAmount() async {
    emit(DashBoardMonthAmountLoading());
    try {
      Query<Map<String, dynamic>> query =
          await _transactionRepository.currentMonthList();
      query.snapshots().listen((event) {
        int amt = 0;
        for (var e in event.docs) {
          final data = Transactions.fromJson(e.data(), id: e.id);
          amt += data.invested;
        }

        emit(DashBoardMonthAmountSuccess(amount: amt));
      });
    } catch (e) {
      emit(DashBoardMonthAmountError());
    }
  }
}
