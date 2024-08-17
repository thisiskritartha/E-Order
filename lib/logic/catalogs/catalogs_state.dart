part of 'catalogs_bloc.dart';

class CatalogsState extends Equatable {
  final String? name;
  final CatalogModel? catalogs;
  final XFile? image;
  final bool? isLoading;
  final bool? isSuccess;
  final bool? isFailure;

  const CatalogsState({
    this.name,
    this.image,
    this.isFailure,
    this.isLoading,
    this.catalogs,
    this.isSuccess,
  });

  factory CatalogsState.initial() {
    return const CatalogsState(
      name: '',
      image: null,
      isFailure: false,
      isLoading: true,
      catalogs: null,
      isSuccess: false,
    );
  }

  CatalogsState copyWith({
    String? name,
    CatalogModel? catalogs,
    XFile? image,
    bool? isLoading,
    bool? isSuccess,
    bool? isFailure,
  }) {
    return CatalogsState(
      name: name ?? this.name,
      catalogs: catalogs ?? this.catalogs,
      image: image ?? this.image,
      isLoading: isLoading ?? this.isLoading,
      isFailure: isFailure ?? this.isFailure,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }

  @override
  List<Object?> get props => [
        name,
        catalogs,
        image,
        isLoading,
        isSuccess,
        isFailure,
      ];
}

final class CatalogsLoadingState extends CatalogsState {
  @override
  List<Object?> get props => [];
}

// sealed class CatalogsState extends Equatable {
//   const CatalogsState();
// }
//
// final class CatalogsLoadingState extends CatalogsState {
//   @override
//   List<Object?> get props => [];
// }
//
// final class CatalogsFetchedState extends CatalogsState {
//   final CatalogModel catalogs;
//   final String? catalogName;
//   final XFile? image;
//
//   const CatalogsFetchedState({
//     required this.catalogs,
//     this.catalogName,
//     this.image,
//   });
//
//   CatalogsFetchedState copyWith({
//     CatalogModel? catalogs,
//     String? catalogName,
//     XFile? image,
//   }) {
//     return CatalogsFetchedState(
//       catalogs: catalogs ?? this.catalogs,
//       catalogName: catalogName ?? this.catalogName,
//       image: image ?? this.image,
//     );
//   }
//
//   @override
//   List<Object?> get props => [catalogs, catalogName, image];
// }
//
// class CatalogsError extends CatalogsState {
//   final String message;
//
//   const CatalogsError(this.message);
//
//   @override
//   List<Object> get props => [message];
// }
