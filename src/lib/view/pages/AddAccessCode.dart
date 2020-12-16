import 'package:confnect/controller/Controller.dart';
import 'package:confnect/controller/ValidatorFactory.dart';
import 'package:confnect/controller/database/Database.dart';
import 'package:confnect/model/Code.dart';
import 'package:confnect/view/Page.dart';
import 'package:confnect/view/style/TextStyle.dart';
import 'package:confnect/view/widgets/forms/FormFieldContainer.dart';
import 'package:confnect/view/widgets/forms/FormTextField.dart';
import 'package:confnect/view/widgets/SquareButton.dart';
import 'package:flutter/material.dart';

class AddAccessCode extends StatelessPage {
  AddAccessCode(Controller controller, {Key key}) : super(controller, key: key);

  final accessCodeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Controller controller = super.getController();
    Database db = controller.getDatabase();
    List<Code> codes = db.getCodes();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Insert Access Code",
          style: pageTitleTextStyle,
        ),
      ),
      body: ListView(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                FormFieldContainer(
                  FormTextField(
                    'Access Code',
                    accessCodeController,
                    validator: ValidatorFactory.getValidator('Code',
                        fieldRequired: true,
                        lowerLimit: 8,
                        upperLimit: 9, extender: (code) {
                      List<Code> c = codes
                          .where((element) => element.getCode() == code)
                          .toList();
                      if (c.isEmpty) return "Code " + code + " does not exist!";
                      String role = controller
                          .getLoggedInUser()
                          .getRole(c[0].getConference());
                      if (role != null)
                        return "You already belong to conference";
                    }),
                  ),
                  margin: EdgeInsets.fromLTRB(0, 50, 0, 20),
                ),
                FormFieldContainer(
                  SquareButton(
                    'Confirm',
                    () {
                      if (_formKey.currentState.validate()) {
                        String code = accessCodeController.text;

                        print(codes.length);
                        codes.removeWhere((c) => c.getCode() == code);
                        print(codes.length);

                        //TODO: adicionar ao fórums do utiizador

                        Navigator.pop(context);
                      }
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
