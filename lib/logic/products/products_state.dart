part of 'products_bloc.dart';

sealed class ProductsState extends Equatable {
  const ProductsState();
}

final class ProductsLoadingState extends ProductsState {
  @override
  List<Object?> get props => [];
}

final class ProductsFetchedState extends ProductsState {
  final ProductModel products;

  const ProductsFetchedState(this.products);
  @override
  List<Object?> get props => [products];
}

class ProductsError extends ProductsState {
  final String message;

  ProductsError(this.message);

  @override
  List<Object> get props => [message];
}
