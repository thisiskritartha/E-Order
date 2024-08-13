import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/products/products_bloc.dart';

class ProductsPage extends StatelessWidget {
  final String? catalogId;

  const ProductsPage({super.key, this.catalogId});

  @override
  Widget build(BuildContext context) {
    if (catalogId != null) {
      context.read<ProductsBloc>().add(ProductsFetchedEvent(id: catalogId!));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        centerTitle: true,
      ),
      body: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductsFetchedState) {
            final products = state.products.data;
            return products!.isEmpty
                ? const Center(
                    child: Text("Empty Product"),
                  )
                : ListView.builder(
                    itemCount: products?.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(products![index].name!),
                        subtitle: Text(products[index].description!),
                      );
                    },
                  );
          } else if (state is ProductsError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return const Center(child: Text('No products found'));
        },
      ),
    );
  }
}
