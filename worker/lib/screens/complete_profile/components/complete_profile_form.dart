import 'package:flutter/material.dart';
import 'package:worker/components/custom_surfix_icon.dart';
import 'package:worker/components/default_button.dart';
import 'package:worker/components/form_error.dart';
import 'package:worker/user.dart';
import 'package:worker/userpref.dart';
import 'package:worker/screens/complete_profile/components/profile_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
//import 'package:worker/screens/complete_profile/components/multidialog.dart';
import 'dart:io';

//import 'package:shop_app/screens/otp/otp_screen.dart';
import 'package:worker/screens/complete_profile/components/multidialog.dart';
import '../../../constants.dart';

class CompleteProfileForm extends StatefulWidget {
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}




class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String?> errors = [];
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? address;
  String? valuechoose;
  void getvaluefromkey(Set selection){
    if(selection != null){
      for(int x in selection.toList()){
        print(valuestopopulate[x]);
      }
    }
  }
  final valuestopopulate = {
    1 : "Carpenter",
    2 : "Plumber",
    3 : "Painter",
    4 : "Electrician",
  };
  List <MultiSelectDialogItem<int>> multiItem = List<String>.filled(4,'0',growable: false ).cast<MultiSelectDialogItem<int>>();
  void populateMultiselect(){
    for(int v in valuestopopulate.keys){
      multiItem.add(MultiSelectDialogItem(v, valuestopopulate[v]!));
    }
  }
  void _showMultiSelect(BuildContext context) async {
    multiItem = [];
    populateMultiselect();
    final items = multiItem;
    // final items = <MultiSelectDialogItem<int>>[
    //   MultiSelectDialogItem(1, 'India'),
    //   MultiSelectDialogItem(2, 'USA'),
    //   MultiSelectDialogItem(3, 'Canada'),
    // ];

    final selectedValues = await showDialog<Set<int>>(
      context: context,
      builder: (BuildContext context) {
        return MultiSelectDialog(
          items: items,
          initialSelectedValues: [1,2].toSet(),
        );
      },
    );

    print(selectedValues);
    getvaluefromkey(selectedValues!);
  }


  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }
  late User user;
  void initState() {
    super.initState();

    user = UserPreferences.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Center(
            child: Stack(
              children: [
                ProfileWidget(
                imagePath: user.imagePath,
                isEdit: true,
                onClicked: () async {
                  final image = await ImagePicker()
                      .getImage(source: ImageSource.gallery);

                  if (image == null) return;

                  final directory = await getApplicationDocumentsDirectory();
                  final name = basename(image.path);
                  final imageFile = File('${directory.path}/$name');
                  final newImage =
                  await File(image.path).copy(imageFile.path);

                  setState(() => user = user.copy(imagePath: newImage.path));
                },
              ),

              ],
            ),
          ),
          SizedBox(height: 20),
          buildFirstNameFormField(),
          SizedBox(height: 20),
          buildLastNameFormField(),
          SizedBox(height: 15),
          buildPhoneNumberFormField(),
          SizedBox(height: 15),
          buildAddressFormField(),
          FormError(errors: errors),
          SizedBox(height: 15),
          RaisedButton(
            child: Text("Select Category"),
            onPressed: () => _showMultiSelect(context),
          ),
          SizedBox(height: 20,),
          DefaultButton(
            text: "continue",
            press: () {

               // Navigator.pushNamed(context, OtpScreen.routeName);

            },
          ),
        ],
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      //keyboardType: TextInputType.multiline,
      maxLines: 2,
      onSaved: (newValue) => address = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAddressNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kAddressNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Description",
        hintText: "Enter your Working Experience",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,

      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone number",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      onSaved: (newValue) => lastName = newValue,
      decoration: InputDecoration(
        labelText: "Last Name",
        hintText: "Enter your last name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      onSaved: (newValue) => firstName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "First Name",
        hintText: "Enter your first name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }
}
