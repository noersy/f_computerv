import 'package:f_computerv/thame/text_style.dart';
import 'package:flutter/material.dart';

class ImageUpload extends StatefulWidget {
  final Function() onPressed;

  const ImageUpload({Key? key, required this.onPressed}) : super(key: key);

  @override
  _ImageUploadState createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 32.0,
      ),
      child: Material(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10.2),
        child: InkWell(
          onTap: widget.onPressed,
          child: SizedBox(
            width: 500,
            height: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.file_copy_outlined, color: Colors.white),
                const SizedBox(height: 8.0),
                Text(
                  "Upload File",
                  style: textCaption.copyWith(color: Colors.white60),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
