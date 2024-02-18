import 'dart:io';

import 'package:bloc_prac/bloc/image_picker/image_picker_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<ImagePickerBloc, ImagePickerState>(
                builder: (context, state) {
              return state.file == null
                  ? const CircleAvatar(
                      child: Icon(Icons.camera),
                    )
                  : Image.file(File(state.file!.path));
            }),
            ElevatedButton(
              onPressed: () {
                // Add image picker functionality here
                context.read<ImagePickerBloc>().add(const CameraCapture());
              },
              child: const Text('Pick an image'),
            ),
          ],
        ),
      ),
    );
  }
}
