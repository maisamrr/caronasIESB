import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class RoundProfilePicture extends StatefulWidget {
  final String photoPath;
  final double circleSize;

  const RoundProfilePicture({Key? key, required this.photoPath, required this.circleSize}) : super(key: key);

  @override
  _RoundProfilePictureState createState() => _RoundProfilePictureState();
}

class _RoundProfilePictureState extends State<RoundProfilePicture> {
  File? _image;

  Future getImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final appDir = await getExternalStorageDirectory();
      final fileName = DateTime.now().millisecondsSinceEpoch.toString();
      final savedImage = await File(pickedFile.path).copy('${appDir?.path}/$fileName');

      setState(() {
        _image = savedImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        getImage();
      },
      child: Container(
        width: widget.circleSize,
        height: widget.circleSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey,
          image: _image != null
              ? DecorationImage(
                  image: FileImage(_image!),
                  fit: BoxFit.cover,
                )
              : DecorationImage(
                  image: AssetImage(widget.photoPath),
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }
}
/*
class RoundProfilePicture extends StatelessWidget {
  final String photoPath;
  final double size;

  RoundProfilePicture({required this.photoPath, required this.size});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: AssetImage(photoPath),
      radius: size / 2,
    );
  }
}
*/