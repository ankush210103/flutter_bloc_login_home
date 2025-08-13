import 'package:equatable/equatable.dart';
import '../../data/models/photo_model.dart';

enum PhotoStatus { initial, loading, success, failure }

class PhotoState extends Equatable {
  final PhotoStatus status;
  final List<PhotoModel> photos;
  final String errorMessage;

  const PhotoState({
    this.status = PhotoStatus.initial,
    this.photos = const [],
    this.errorMessage = '',
  });

  PhotoState copyWith({
    PhotoStatus? status,
    List<PhotoModel>? photos,
    String? errorMessage,
  }) {
    return PhotoState(
      status: status ?? this.status,
      photos: photos ?? this.photos,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [status, photos, errorMessage];
}
