part of 'catalogs_bloc.dart';

sealed class CatalogsEvent extends Equatable {
  const CatalogsEvent();
}

final class CatalogsFetchedEvent extends CatalogsEvent {
  @override
  List<Object?> get props => [];
}

final class CatalogsImageUploadEvent extends CatalogsEvent {
  @override
  List<Object?> get props => [];
}

final class CatalogsPickImageEvent extends CatalogsEvent {
  final XFile? image;

  const CatalogsPickImageEvent(this.image);
  @override
  List<Object?> get props => [image];
}
