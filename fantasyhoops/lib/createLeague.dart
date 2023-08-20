import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class CreateLeague extends StatefulWidget {
  const CreateLeague({Key? key}) : super(key: key);

  @override
  _CreateLeagueState createState() => _CreateLeagueState();
}

class _CreateLeagueState extends State<CreateLeague> {
  final ImagePicker _imagePicker = ImagePicker();
  File? selectedImage;

  ImageFromCamera() async {
    final image =
      await _imagePicker.pickImage(
          source: ImageSource.camera,
          imageQuality: 50
      );
    setState(() {
      selectedImage = File(image!.path);
    });
  }

  ImageFromLibrary()async {
    final image =
      await _imagePicker.pickImage(
          source: ImageSource.gallery,
          imageQuality: 50
      );
    setState(() {
      selectedImage = File(image!.path);
    });
  }

  void ShowPicker() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc){
          return Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.photo),
                title: Text("Photo Library"),
                onTap: (){
                  ImageFromLibrary();
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt_rounded),
                title: Text("Take a picture"),
                onTap:(){
                  ImageFromCamera();
                  Navigator.of(context).pop();
                } ,
              )
            ],
          );
        }
    );
  }

  Padding ImageContainer(double width, double height) {
    return Padding(
      padding: EdgeInsets.all(1),
      child: Container(
          height: height * 0.5,
          width: width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent,
              border: Border.all(
                  color: Colors.black
              )
          ),
          child: selectedImage == null
              ? IconButton(
            icon: Icon(Icons.camera_alt,
              size: 100,
            ),
            onPressed: () {
              ShowPicker();
            },
          )
              : Stack(
            children: [
              GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  child: Image.file(
                      File(selectedImage!.path)
                  ),
                ),
                onTap: () {
                  ShowPicker();
                },
              ),
            ],
          )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageContainer(width * 0.6, height*0.6)
        ],
      ),
    );
  }
}
