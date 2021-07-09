import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:guia_clube/constants/colors.dart';
import 'package:guia_clube/constants/size.config.dart';
import 'package:guia_clube/constants/text_config.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SelfieScreen extends StatefulWidget {
  SelfieScreen({Key key}) : super(key: key);

  @override
  _SelfieScreenState createState() => _SelfieScreenState();
}

class _SelfieScreenState extends State<SelfieScreen> {
  final TextEditingController phoneEditingController = TextEditingController();
  var maskFormatter = new MaskTextInputFormatter(
      mask: '+55 ## #####-####', filter: {"#": RegExp(r'[0-9]')});

  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: displayWidth(context),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Tire',
                          style: kPrimalStyle.copyWith(
                              fontSize: displayWidth(context) * 0.12,
                              color: colorYellow),
                        ),
                        Text(
                          ' uma ',
                          style: kPrimalStyle.copyWith(
                              fontSize: displayWidth(context) * 0.12,
                              color: colorPurple),
                        ),
                      ],
                    ),
                    Text(
                      'selfie ',
                      style: kPrimalStyle.copyWith(
                          fontSize: displayWidth(context) * 0.12,
                          color: colorYellow),
                    ),
                    UIHelper.verticalSpace(28),
                    Center(
                        child: Container(
                      width: displayWidth(context) * 0.7,
                      height: displayHeight(context) * 0.45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          border: Border.all(color: colorPurple, width: 2)),
                      child: _image == null
                          ? InkWell(
                              onTap: getImage,
                              child: Icon(
                                Icons.add_a_photo_outlined,
                                size: displayWidth(context) * 0.3,
                                color: colorYellow,
                              ))
                          : Image.file(_image),
                    )),
                    UIHelper.verticalSpace(28),
                    UIHelper.verticalSpace(30),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/data_screen');
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(displayHeight(context) * 0.4,
                                displayWidth(context) * 0.15),
                            primary: colorPurple),
                        child: Text('Continuar',
                            style: kPrimalStyle.copyWith(
                                fontSize: displayWidth(context) * 0.05)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
