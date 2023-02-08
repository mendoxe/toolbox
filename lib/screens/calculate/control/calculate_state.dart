import 'package:tooolbox/model/debtor.dart';
import 'package:tooolbox/model/enums.dart';

class CalculateState {
  final List<Debtor> debtors;
  final LoadingState loadingState;

  CalculateState({
    required this.debtors,
    required this.loadingState,
  });

  factory CalculateState.initial() {
    return CalculateState(
      debtors: [],
      loadingState: LoadingState.initial,
    );
  }

  CalculateState copyWith({
    List<Debtor>? debtors,
    LoadingState? loadingState,
  }) {
    return CalculateState(
      debtors: debtors ?? this.debtors,
      loadingState: loadingState ?? this.loadingState,
    );
  }
}
