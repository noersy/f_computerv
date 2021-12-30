import 'package:flutter/material.dart';

class UploadForm extends StatefulWidget {
  final Function() onPressed;
  const UploadForm({Key? key, required this.onPressed}) : super(key: key);

  @override
  _UploadFormState createState() => _UploadFormState();
}

class _UploadFormState extends State<UploadForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 102.0,
                vertical: 16.0,
              ),
            ),
            label: const Text("File"),
            icon: const Icon(Icons.upload),
            onPressed: widget.onPressed,
          ),
        ],
      ),
    );
  }
}
