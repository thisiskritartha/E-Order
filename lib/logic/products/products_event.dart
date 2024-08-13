part of 'products_bloc.dart';

sealed class ProductsEvent extends Equatable {}

final class ProductsFetchedEvent extends ProductsEvent {
  final String id;
  ProductsFetchedEvent({required this.id});
  @override
  List<Object?> get props => [id];
}
