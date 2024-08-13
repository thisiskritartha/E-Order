part of 'catalogs_bloc.dart';

sealed class CatalogsState extends Equatable {
  const CatalogsState();
}

final class CatalogsLoadingState extends CatalogsState {
  @override
  List<Object?> get props => [];
}

final class CatalogsFetchedState extends CatalogsState {
  final CatalogModel catalogs;

  const CatalogsFetchedState(this.catalogs);

  @override
  List<Object> get props => [catalogs];
}

class CatalogsError extends CatalogsState {
  final String message;

  const CatalogsError(this.message);

  @override
  List<Object> get props => [message];
}
