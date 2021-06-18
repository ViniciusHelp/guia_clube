import 'package:flutter/material.dart';
import 'package:guia_clube/constants/colors.dart';
import 'package:guia_clube/constants/size.config.dart';
import 'package:guia_clube/constants/text_config.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pinput/pin_put/pin_put.dart';

class CodScreen extends StatefulWidget {
  CodScreen({Key key}) : super(key: key);

  @override
  _CodScreenState createState() => _CodScreenState();
}

class _CodScreenState extends State<CodScreen> {
  final TextEditingController pinController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final TextEditingController phoneEditingController = TextEditingController();
  var maskFormatter = new MaskTextInputFormatter(
      mask: '+55 ## #####-####', filter: {"#": RegExp(r'[0-9]')});
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
                          'Digite',
                          style: kPrimalStyle.copyWith(
                              fontSize: displayWidth(context) * 0.12,
                              color: colorYellow),
                        ),
                        Text(
                          ' o ',
                          style: kPrimalStyle.copyWith(
                              fontSize: displayWidth(context) * 0.12,
                              color: colorPurple),
                        ),
                        Text(
                          'seu ',
                          style: kPrimalStyle.copyWith(
                              fontSize: displayWidth(context) * 0.12,
                              color: colorYellow),
                        ),
                      ],
                    ),
                    Text(
                      'código',
                      style: kPrimalStyle.copyWith(
                          fontSize: displayWidth(context) * 0.12,
                          color: colorPurple),
                    ),
                    UIHelper.verticalSpace(28),
                    Text(
                      'Digite o código de 6 dígitos que enviamos para: ',
                      style: kPrimalStyle.copyWith(
                          color: Colors.black,
                          fontSize: displayWidth(context) * 0.04,
                          fontWeight: FontWeight.normal),
                    ),
                    UIHelper.verticalSpace(28),
                    Center(
                      child: Container(
                       
                        child: PinPut(
                          fieldsCount: 6,
                          focusNode: _pinPutFocusNode,
                          controller: pinController,
                          textStyle:
                              TextStyle(color: Colors.black, fontSize: 28),
                          eachFieldHeight: displayHeight(context)*0.125,
                          eachFieldWidth: displayWidth(context)*0.12,
                          submittedFieldDecoration: BoxDecoration(
                            border: Border.all(color: colorPurple),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          selectedFieldDecoration: BoxDecoration(
                            border: Border.all(color: colorGrey),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          followingFieldDecoration: BoxDecoration(
                            border: Border.all(color: colorYellow),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                    ),
                    UIHelper.verticalSpace(30),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {},
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
