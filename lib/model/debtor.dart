import 'package:tooolbox/model/creditor.dart';

class Debtor {
  final String name;
  final List<Creditor> creditors;

  Debtor({
    required this.name,
    required this.creditors,
  });

  Debtor copyWith({
    String? name,
    List<Creditor>? creditors,
  }) {
    return Debtor(
      name: name ?? this.name,
      creditors: creditors ?? this.creditors,
    );
  }

  @override
  String toString() => 'Debtor(name: $name, creditors: $creditors)';
}
