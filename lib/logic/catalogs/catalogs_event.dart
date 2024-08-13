part of 'catalogs_bloc.dart';

sealed class CatalogsEvent extends Equatable {
  const CatalogsEvent();
}

final class CatalogsFetchedEvent extends CatalogsEvent {
  @override
  List<Object?> get props => [];
}
