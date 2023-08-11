import 'package:deciml_bly/utils/transaction_type_enum.dart';
import 'package:equatable/equatable.dart';

class Transactions extends Equatable {
  const Transactions({
    required this.amount,
    required this.roundUp,
    required this.invested,
    required this.type,
    required this.uid,
    required this.createdAt,
    required this.id,
  });

  final String id;
  final int amount;
  final int roundUp;
  final int invested;
  final TransactionType type;
  final String uid;
  final DateTime createdAt;

  static Transactions fromJson(Map<String, dynamic> json, {String id = ''}) {
    return Transactions(
      amount: json['amount'],
      roundUp: json['roundUp'],
      invested: json['invested'],
      type: TransactionType.fromJson(json['type']),
      uid: json['uid'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(json['createdAt']),
      id: id,
    );
  }

  toJson() {
    return {
      'amount': amount,
      'roundUp': roundUp,
      'invested': invested,
      'type': type.toJson(),
      'uid': uid,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'id': id,
    };
  }

  @override
  List<Object?> get props => [amount, roundUp, invested, type, uid, createdAt];
}
