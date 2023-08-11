part of 'transaction_cubit.dart';

abstract class TransactionState extends Equatable {
  const TransactionState();
}

class TransactionInitial extends TransactionState {
  @override
  List<Object> get props => [];
}

class TransactionSuccess extends TransactionState {
  final List<Transactions> list;
  const TransactionSuccess({
    required this.list,
  });
  @override
  List<Object> get props => [list];
}

class TransactionFailure extends TransactionState {
  @override
  List<Object> get props => [];
}

class TransactionLoading extends TransactionState {
  @override
  List<Object> get props => [];
}
