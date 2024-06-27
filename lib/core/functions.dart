import 'package:admin_rebuy_app/utils/theme_app.dart';
import 'package:flutter/material.dart';

void loginshowDialog(BuildContext context, String title, String content) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title, style: CustomTextStyle.textStyle18),
        content: Text(content, style: CustomTextStyle.textStyle16),
        actions: <Widget>[
          TextButton(
              child: Text('Close', style: CustomTextStyle.textStyle18),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ],
      );
    },
  );
}
