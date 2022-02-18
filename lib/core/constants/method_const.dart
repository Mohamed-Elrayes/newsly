import 'package:flutter/material.dart';
import '../../presentation/widgets/button_widget.dart';
import '../../presentation/widgets/custom_text_widget.dart';
import 'package:timeago/timeago.dart' as timeago;


InputDecoration inputDecoration({
  required BuildContext context,
  required String hintText,
  String? errorText,
}) {
  return InputDecoration(
      hintText: hintText,
      errorText: errorText,
      labelText: hintText,
      labelStyle: Theme.of(context).textTheme.headline3);
}

InputDecoration inputDecorationPassword({
  required BuildContext context,
  required String hintText,
  required Widget suffixIcon,
  String? errorText,
}) {
  return InputDecoration(
      helperMaxLines: 2,
      errorMaxLines: 2,
      suffixIcon: suffixIcon,
      errorText: errorText,
      hintText: hintText,
      labelText: hintText,
      labelStyle: Theme.of(context).textTheme.headline3);
}

String? textErrorInput({required bool isValueFieldEmpty  ,required bool isNotValidate ,required String msg}) {
 return isValueFieldEmpty
      ? null
      : isNotValidate
          ?  msg
          :null ;
}
  String convertTime(String? date) {
    if (date != null) {
      final timePassing = DateTime.parse(date);
      return timeago.format(timePassing);
    } else {
      return 'UnKnown';
    }
  }
Future<dynamic> errorDialog(BuildContext context,  state) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          titlePadding: EdgeInsets.zero,
          clipBehavior: Clip.antiAlias,
          title: Container(
            width: double.maxFinite,
            height: 60,
            color: Colors.redAccent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: CustomTextWidget(
                  "Error 😥",
                  style: Theme.of(context).textTheme.headline1?.copyWith(
                        fontSize: 20,
                      ),
                )),
              ],
            ),
          ),
          content: CustomTextWidget.paragraph(state.errorMessage!),
          actions: [
            Center(
              child: ButtonWidget(
                  onTap: () => Navigator.of(context).pop(), label: 'Ok'),
            )
          ],
        );
      },
    );
  }
