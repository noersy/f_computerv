import 'dart:io';

import 'package:f_computerv/thame/text_style.dart';
import 'package:f_computerv/widget/base_container.dart';
import 'package:f_computerv/widget/image_uploaded.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class BasePage extends StatefulWidget {
  const BasePage({Key? key}) : super(key: key);

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  bool _loading = false;
  File? _image;
  List? _ouput;
  final picker = ImagePicker();

  @override
  void initState() {
    loadModel().then((value) => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      children: [
        Text("Image Classification Untuk Penyakit Padi", style: textTitle),
        ImageUpload(onPressed: pickImage),
        const Text("Image")
      ],
    );
  }

  classstfyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 5,
      threshold: 0.5,
      // imageMean: 127.5,
      // imageStd: 127.5,
    );
    setState(() {
      _ouput = output;
      _loading = false;
    });
  }

  loadModel() async {
    await Tflite.loadModel(
        model: 'assert/model_unquant.tflite', labels: 'assert/labels.txt');
  }

  pickImage() async {
    var image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) return;

    setState(() => _image = File(image.path));
    classstfyImage(_image!);
  }

  pickGalleryImage() async {
    var image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;

    setState(() => _image = File(image.path));
    classstfyImage(_image!);
  }
}
