import 'package:confnect/controller/Controller.dart';
import 'package:confnect/controller/ValidatorFactory.dart';
import 'package:confnect/controller/database/Database.dart';
import 'package:confnect/model/Tag.dart';
import 'package:confnect/view/Page.dart';
import 'package:confnect/view/pages/admin/TagManager.dart';
import 'package:confnect/view/style/TextStyle.dart';
import 'package:confnect/view/widgets/forms/FormFieldContainer.dart';
import 'package:confnect/view/widgets/forms/FormTextField.dart';
import 'package:confnect/view/widgets/SquareButton.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class CreateCodes extends StatefulPage {
  final Function _onTalkAdded;
  CreateCodes(Controller controller, this._onTalkAdded, {Key key})
      : super(controller, key: key);

  @override
  State<CreateCodes> createState() {
    return _CreateCodesState(super.getController(), _onTalkAdded);
  }
}

class _CreateCodesState extends State<CreateCodes> {
  final Controller _controller;
  final Function _onTalkAdded;

  final talkTitleController = TextEditingController();
  final talkDescriptionController = TextEditingController();
  final speakerUsernameController = TextEditingController();
  final talkImageURLController = TextEditingController();
  final tagNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  List<Tag> _selectedTags;

  @override
  void initState() {
    _selectedTags = [];
    super.initState();
  }

  @override
  void dispose() {
    _selectedTags.clear();
    super.dispose();
  }

  _CreateCodesState(this._controller, this._onTalkAdded);

  @override
  Widget build(BuildContext context) {
    Database db = _controller.getDatabase();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Registry Code: " + generateCode(),
          style: pageTitleTextStyle,
        ),
      ),
      body: ListView(),
    );
  }

  String generateCode() {
    var code;
    do {
      var uuid = Uuid();
      code = uuid.v4().substring(0, 8);
    } while (!isCodeNew(code));
    return code;
  }

  bool isCodeNew(String code) {
    // _talks.forEach((talk) {
    //   if (talk.getCode() == code) return false;
    // });
    return true;
  }
}
