part of 'dash_board_cubit.dart';

abstract class DashBoardState extends Equatable {
  const DashBoardState();
}

class DashBoardInitial extends DashBoardState {
  @override
  List<Object> get props => [];
}

class DashBoardMonthAmountLoading extends DashBoardState {
  @override
  List<Object> get props => [];
}

class DashBoardMonthAmountError extends DashBoardState {
  @override
  List<Object> get props => [];
}

class DashBoardMonthAmountSuccess extends DashBoardState {
  const DashBoardMonthAmountSuccess({required this.amount});
  final int amount;
  @override
  List<Object> get props => [amount];
}
