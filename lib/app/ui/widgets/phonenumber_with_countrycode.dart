import 'package:apmatik/app/ui/style/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhonenumberWithCountryCode extends StatelessWidget {
  final void Function(bool)? onInputValidated;
  final void Function(PhoneNumber)? onInputChanged;
  final bool? errormessageVisible;
  final String? errormessage;
  const PhonenumberWithCountryCode({
    Key? key,
    this.onInputValidated,
    this.onInputChanged,
    this.errormessageVisible = false,
    this.errormessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Telefon Numarası',
            style: TextStyle(color: Colors.grey),
          ),
          Container(
            decoration: const BoxDecoration(
                border:
                    Border(bottom: BorderSide(width: 1, color: Colors.grey))),
            child: Stack(
              children: [
                Positioned(
                  bottom: 10,
                  top: 10,
                  left: 0,
                  child: Container(
                    height: 30,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      children: const [
                        Spacer(),
                        Icon(
                          CupertinoIcons.chevron_down,
                          size: 16,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: InternationalPhoneNumberInput(
                    errorMessage: null,
                    hintText: 'Telefon Numarası',
                    onInputValidated: onInputValidated,
                    onInputChanged: onInputChanged,
                    ignoreBlank: false,
                    autoValidateMode: AutovalidateMode.disabled,
                    selectorTextStyle: const TextStyle(
                      color: Colors.black,
                    ),
                    selectorConfig: const SelectorConfig(
                      selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                      setSelectorButtonAsPrefixIcon: false,
                      leadingPadding: 10,
                      showFlags: false,
                      trailingSpace: true,
                    ),
                    initialValue: PhoneNumber(isoCode: 'TR'),
                    textFieldController: TextEditingController(),
                    formatInput: false,
                    keyboardType: const TextInputType.numberWithOptions(
                        signed: true, decimal: true),
                    inputDecoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 4),
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 0)),
                      errorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 0)),
                      floatingLabelAlignment: FloatingLabelAlignment.start,
                      // labelText: 'Telefon Numarası',
                    ),
                    textStyle: const TextStyle(color: Colors.black),
                    
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: errormessageVisible!,
            child: Text(
              errormessage!,
              style: AppTextStyle().getSfProDisplayRegular_Other(Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
