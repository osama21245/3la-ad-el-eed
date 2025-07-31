// delete_your_rejected_request_state.dart

enum DeleteYourRejectedRequestStatus { initial, loading, success, error }

class DeleteYourRejectedRequestState {
  final DeleteYourRejectedRequestStatus status;
  final String? errorMessage;

  const DeleteYourRejectedRequestState({
    required this.status,
    this.errorMessage,
  });

  factory DeleteYourRejectedRequestState.initial() => const DeleteYourRejectedRequestState(status: DeleteYourRejectedRequestStatus.initial);

  DeleteYourRejectedRequestState copyWith({
    DeleteYourRejectedRequestStatus? status,
    String? errorMessage,
  })
  {
    return DeleteYourRejectedRequestState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}