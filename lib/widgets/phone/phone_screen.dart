import 'package:flutter/material.dart';
import 'package:guia_clube/constants/colors.dart';
import 'package:guia_clube/constants/size.config.dart';
import 'package:guia_clube/constants/text_config.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PhoneScreen extends StatefulWidget {
  PhoneScreen({Key key}) : super(key: key);

  @override
  _PhoneScreenState createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
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
                        Text('Qual', style: kPrimalStyle.copyWith(fontSize: displayWidth(context)*0.12, color: colorYellow),),
                         Text(' o ', style: kPrimalStyle.copyWith(fontSize: displayWidth(context)*0.12, color: colorPurple),),
                          Text('seu ', style: kPrimalStyle.copyWith(fontSize: displayWidth(context)*0.12, color: colorYellow),),
                      ],
                    ),
                     Text('número? ', style: kPrimalStyle.copyWith(fontSize: displayWidth(context)*0.12,color: colorPurple),),
                      UIHelper.verticalSpace(28),
                    Text(
                        'Por favor, digite um número de telefone válido. Nós iremos enviar por SMS um código de 6 dígitos para verificarmos sua conta.',
                        style: kPrimalStyle.copyWith(color: Colors.black, fontSize: displayWidth(context)*0.04, fontWeight: FontWeight.normal),),
                    
                    UIHelper.verticalSpace(28),
                    Center(
                      child: Container(
                        width: displayWidth(context) * 0.7,
                        child: TextFormField(
                          inputFormatters: [maskFormatter],
                          controller: phoneEditingController,
                          keyboardType: TextInputType.phone,
                          style: TextStyle(
                            decorationColor: colorPurple,
                            color: colorPurple,
                            fontFamily: 'OpenSans',
                          ),
                          decoration: InputDecoration(
                            focusColor: colorPurple,
                            fillColor: colorPurple,
                            hoverColor: colorPurple,

                            hintText: '+55 99 99999-9999',
                            hintStyle: kHintTextStyle.copyWith(
                                color: colorPurple,
                                fontSize: displayWidth(context) * 0.07),
                          ),
                        ),
                      ),
                    ),
                    UIHelper.verticalSpace(30),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/cod_screen');
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
