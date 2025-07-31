// delete_your_rejected_request_state.dart

enum AddShopStatus { initial, loading, success, error }

class AddShopState {
  final AddShopStatus status;
  final String? errorMessage;

  const AddShopState({
    required this.status,
    this.errorMessage,
  });

  factory AddShopState.initial() => const AddShopState(status: AddShopStatus.initial);

  AddShopState copyWith({
    AddShopStatus? status,
    String? errorMessage,
  })
  {
    return AddShopState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}