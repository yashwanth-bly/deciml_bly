part of 'dash_board_total_cubit.dart';

abstract class DashBoardTotalState extends Equatable {
  const DashBoardTotalState();
}

class DashBoardTotalInitial extends DashBoardTotalState {
  @override
  List<Object> get props => [];
}

class DashBoardTotalAmountLoading extends DashBoardTotalState {
  @override
  List<Object> get props => [];
}

class DashBoardTotalAmountError extends DashBoardTotalState {
  @override
  List<Object> get props => [];
}

class DashBoardTotalAmountSuccess extends DashBoardTotalState {
  const DashBoardTotalAmountSuccess({required this.amount});
  final int amount;
  @override
  List<Object> get props => [amount];
}
