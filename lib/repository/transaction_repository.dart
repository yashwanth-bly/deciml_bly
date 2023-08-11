import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deciml_bly/models/model.dart';
import 'package:deciml_bly/repository/repository.dart';
import 'package:deciml_bly/utils/transaction_type_enum.dart';
import 'package:intl/intl.dart';

class TransactionRepository {
  TransactionRepository({required LocalRepository localRepository})
      : _localRepository = localRepository;
  final LocalRepository _localRepository;

  final FirebaseFirestore db = FirebaseFirestore.instance;

  bool saveTransaction({
    TransactionType type = TransactionType.debit,
    required int amount,
    int roundUp = 10,
    required int invested,
  }) {
    try {
      db.collection('Transaction').doc().set(
        {
          'type': type.toJson(),
          'amount': amount,
          'roundUp': roundUp,
          'invested': invested,
          'uid': _localRepository.getUserId(),
          'createdAt': DateTime.now().millisecondsSinceEpoch,
        },
        SetOptions(
          merge: true,
        ),
      );
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<Query<Map<String, dynamic>>> list() async {
    return db
        .collection('Transaction')
        .where('uid', isEqualTo: _localRepository.getUserId())
        .orderBy('createdAt', descending: true);
  }

  Future<Query<Map<String, dynamic>>> currentMonthList() async {
    final today = DateTime.now();
    DateTime thisStartMonthDate = DateTime(
      today.year,
      today.month,
      1,
    );
    print(DateFormat('dd-MMM-yyyy hh:mm aa').format(thisStartMonthDate));
    return db
        .collection('Transaction')
        .where('uid', isEqualTo: _localRepository.getUserId())
        .where('createdAt',
            isGreaterThanOrEqualTo: thisStartMonthDate.millisecondsSinceEpoch)
        .orderBy('createdAt', descending: true);
  }
}
