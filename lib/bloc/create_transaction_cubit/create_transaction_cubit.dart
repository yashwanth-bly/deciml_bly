import 'package:bloc/bloc.dart';
import 'package:deciml_bly/repository/repository.dart';
import 'package:deciml_bly/utils/utils.dart';
import 'package:equatable/equatable.dart';

part 'create_transaction_state.dart';

class CreateTransactionCubit extends Cubit<CreateTransactionState> {
  CreateTransactionCubit({required TransactionRepository transactionRepository})
      : _transactionRepository = transactionRepository,
        super(CreateTransactionInitial());
  final TransactionRepository _transactionRepository;

  void save({
    TransactionType type = TransactionType.debit,
    required int amount,
    int roundUp = 10,
  }) {
    emit(CreateTransactionLoading());
    int invested = 0;

    if (amount % roundUp != 0) {
      if (amount % roundUp < roundUp) {
        var temp = amount ~/ roundUp;
        invested = (temp + 1) * roundUp - amount;
      }
    } else {
      invested = 0;
    }

    final bool response = _transactionRepository.saveTransaction(
      amount: amount,
      invested: invested,
      type: type,
      roundUp: roundUp,
    );
    if (response) {
      emit(CreateTransactionSuccess());
    } else {
      emit(CreateTransactionError());
    }
  }
}
