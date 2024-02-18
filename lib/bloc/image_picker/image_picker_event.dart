part of 'image_picker_bloc.dart';

sealed class ImagePickerEvent extends Equatable {
  const ImagePickerEvent();

  @override
  List<Object> get props => [];
}

class CameraCapture extends ImagePickerEvent {
  const CameraCapture();
}

class GalleryCapture extends ImagePickerEvent {
  const GalleryCapture();
}
