import 'package:bloc/bloc.dart';
import 'package:deciml_bly/models/model.dart';
import 'package:deciml_bly/repository/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit({required TransactionRepository transactionRepository})
      : _transactionRepository = transactionRepository,
        super(TransactionInitial());
  final TransactionRepository _transactionRepository;
  final FirebaseFirestore db = FirebaseFirestore.instance;
  void list() async {
    emit((TransactionLoading()));

    try {
      Query<Map<String, dynamic>> query = await _transactionRepository.list();
      query.snapshots().listen((event) {
        final List<Transactions> list = event.docs
            .map((e) => Transactions.fromJson(e.data(), id: e.id))
            .toList();
        emit(TransactionSuccess(list: list));
      });
    } catch (e) {
      emit(TransactionFailure());
    }
  }
}
