import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/product_model.dart';
import '../../data/repository/product_repository.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductRepository productRepository;
  ProductsBloc({required this.productRepository}) : super(ProductsLoadingState()) {
    on<ProductsFetchedEvent>((event, emit) async {
      try {
        final products = await productRepository.getProducts(event.id);
        emit(ProductsFetchedState(products));
      } catch (e) {
        emit(ProductsError('Failed to fetch catalogs'));
      }
    });
  }
}
