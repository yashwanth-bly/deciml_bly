part of 'create_transaction_cubit.dart';

abstract class CreateTransactionState extends Equatable {
  const CreateTransactionState();
}

class CreateTransactionInitial extends CreateTransactionState {
  @override
  List<Object> get props => [];
}

class CreateTransactionLoading extends CreateTransactionState {
  @override
  List<Object> get props => [];
}

class CreateTransactionError extends CreateTransactionState {
  @override
  List<Object> get props => [];
}

class CreateTransactionSuccess extends CreateTransactionState {
  @override
  List<Object> get props => [];
}
