import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/models/catalog_model.dart';
import '../../data/repository/catalog_repository.dart';

part 'catalogs_event.dart';
part 'catalogs_state.dart';

class CatalogsBloc extends Bloc<CatalogsEvent, CatalogsState> {
  final CatalogRepository catalogRepository;
  CatalogsBloc({required this.catalogRepository}) : super(CatalogsLoadingState()) {
    on<CatalogsFetchedEvent>((event, emit) async {
      try {
        final catalogs = await catalogRepository.getCatalog();
        emit(state.copyWith(catalogs: catalogs));
      } catch (e) {
        // emit(const CatalogsError('Failed to fetch catalogs'));
        emit(state.copyWith(isFailure: true));
      }
    });

    on<CatalogsNameChanged>((event, emit) async {
      emit(state.copyWith(name: event.name));
    });

    on<CatalogsPickImageEvent>((event, emit) async {
      try {
        // emit(CatalogImagePickerSuccessState(event.image));
        emit(state.copyWith(image: event.image));
      } catch (e) {
        //emit(const CatalogsError('Failed to Upload catalogs image.'));
        emit(state.copyWith(isFailure: true));
      }
    });
  }
}
