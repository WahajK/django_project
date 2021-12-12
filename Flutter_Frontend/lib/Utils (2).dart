import 'package:flutter/material.dart';


showSnackBar(BuildContext context, text){
  if(text is String){
    Scaffold.of(context).showSnackBar(SnackBar(content: Text("$text")));
  }else if(text is Widget){
    Scaffold.of(context).showSnackBar(SnackBar(content: text));
  }
}