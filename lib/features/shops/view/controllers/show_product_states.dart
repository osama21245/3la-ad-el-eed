abstract class ShowProductState {}

class ShowProductInitial extends ShowProductState {}

class ShowProductLoading extends ShowProductState {}

class ShowProductSuccess extends ShowProductState {
  final List<Map<String, dynamic>> products;

  ShowProductSuccess({required this.products});
}

class ShowProductError extends ShowProductState {
  final String error;

  ShowProductError({required this.error});
}