enum TransactionType {
  credit,
  debit;

  String toJson() => name;
  static TransactionType fromJson(String json) => values.byName(json);
}
