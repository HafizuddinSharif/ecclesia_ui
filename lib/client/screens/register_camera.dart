import 'package:ecclesia_ui/client/widgets/custom_appbar.dart';
import 'package:ecclesia_ui/client/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegisterCamera extends StatefulWidget {
  const RegisterCamera({super.key});

  @override
  State<RegisterCamera> createState() => _RegisterCameraState();
}

class _RegisterCameraState extends State<RegisterCamera> {
  XFile? _image;

  Future getImage(bool isCamera) async {
    XFile? image;

    ImagePicker picker = ImagePicker();

    if (isCamera) {
      image = await picker.pickImage(source: ImageSource.camera);
    } else {
      image = await picker.pickImage(source: ImageSource.gallery);
    }

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(back: true, disableBackGuard: true, disableMenu: false),
      endDrawer: const CustomDrawer(),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
          margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12.0), boxShadow: [
            BoxShadow(
                color: const Color.fromARGB(255, 211, 211, 211).withOpacity(0.5), //color of shadow
                spreadRadius: 3, //spread radius
                blurRadius: 7, // blur radius
                offset: const Offset(0, 6)),
          ]),
          child: ElevatedButton(
            onPressed: () {
              debugPrint('Camera Open');
              getImage(true);
            },
            child: const Text('Open Camera'),
          ),
        ),
      ),
    );
  }
}
