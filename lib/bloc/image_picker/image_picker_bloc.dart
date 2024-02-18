import 'package:bloc/bloc.dart';
import 'package:bloc_prac/utils/image_picker_utils.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'image_picker_event.dart';
part 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePickerUtils _imagePickerUtils;
  ImagePickerBloc(this._imagePickerUtils) : super(const ImagePickerState()) {
    on<CameraCapture>(_pickCameraImage);
    on<GalleryCapture>(_pickGalleryImage);
  }

  void _pickCameraImage(
      ImagePickerEvent event, Emitter<ImagePickerState> emit) async {
    XFile? file = await _imagePickerUtils.pickCameraImage();
    emit(state.copyWith(file: file));
  }

  void _pickGalleryImage(
      ImagePickerEvent event, Emitter<ImagePickerState> emit) async {
    XFile? file = await _imagePickerUtils.pickGalleryImage();
    emit(state.copyWith(file: file));
  }
}
