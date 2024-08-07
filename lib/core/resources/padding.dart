// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class padd extends StatelessWidget {
  Widget paddwidget;
  double paddnumber;
  padd({
    Key? key,
    required this.paddwidget,
    required this.paddnumber,
  }) : super(key: key);
  // Widget nnn;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(paddnumber),
      child: paddwidget,
    );
  }
}
