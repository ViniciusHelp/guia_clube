import 'dart:io';

import 'package:flutter/material.dart';
import 'package:guia_clube/constants/colors.dart';
import 'package:guia_clube/constants/size.config.dart';
import 'package:guia_clube/constants/text_config.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class DataScreen extends StatefulWidget {
  DataScreen({Key key}) : super(key: key);

  @override
  _DataScreenState createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
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
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Preencha',
                            style: kPrimalStyle.copyWith(
                                fontSize: displayWidth(context) * 0.11,
                                color: colorYellow),
                          ),
                          Text(
                            ' seus ',
                            style: kPrimalStyle.copyWith(
                                fontSize: displayWidth(context) * 0.11,
                                color: colorPurple),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'dados ',
                      style: kPrimalStyle.copyWith(
                          fontSize: displayWidth(context) * 0.11,
                          color: colorYellow),
                    ),
                    UIHelper.verticalSpace(100),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text(
                        'Nome completo:',
                        style: kPrimalStyle.copyWith(
                            fontSize: displayWidth(context) * 0.07,
                            color: colorPurple),
                      ),
                      Text(
                        'Endereço:',
                        style: kPrimalStyle.copyWith(
                            fontSize: displayWidth(context) * 0.07,
                            color: colorPurple),
                      ),
                      ],
                    ),
                    
                    UIHelper.verticalSpace(50),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          //Navigator.pushNamed(context, '/cod_screen');
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(displayHeight(context) * 0.4,
                                displayWidth(context) * 0.15),
                            primary: colorPurple),
                        child: Text('Salvar e visualizar descontos',
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
