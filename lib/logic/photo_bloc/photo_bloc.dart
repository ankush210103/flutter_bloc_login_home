import 'package:flutter_bloc/flutter_bloc.dart';
import 'photo_event.dart';
import 'photo_state.dart';
import '../../data/repositories/photo_repository.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final PhotoRepository photoRepository;

  PhotoBloc(this.photoRepository) : super(const PhotoState()) {
    on<FetchPhotos>(_onFetchPhotos);
  }

  Future<void> _onFetchPhotos(FetchPhotos event, Emitter<PhotoState> emit) async {
    emit(state.copyWith(status: PhotoStatus.loading));
    try {
      final photos = await photoRepository.fetchPhotos();
      emit(state.copyWith(status: PhotoStatus.success, photos: photos));
    } catch (e) {
      emit(state.copyWith(status: PhotoStatus.failure, errorMessage: e.toString()));
    }
  }
}
