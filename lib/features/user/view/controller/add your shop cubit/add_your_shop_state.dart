// delete_your_rejected_request_state.dart

enum AddYourShopStatus { initial, loading, success, error }

class AddYourShopState {
  final AddYourShopStatus status;
  final String? errorMessage;

  const AddYourShopState({
    required this.status,
    this.errorMessage,
  });

  factory AddYourShopState.initial() => const AddYourShopState(status: AddYourShopStatus.initial);

  AddYourShopState copyWith({
    AddYourShopStatus? status,
    String? errorMessage,
  })
  {
    return AddYourShopState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}