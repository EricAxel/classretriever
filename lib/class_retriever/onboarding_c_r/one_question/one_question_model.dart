import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'one_question_widget.dart' show OneQuestionWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OneQuestionModel extends FlutterFlowModel<OneQuestionWidget> {
  ///  Local state fields for this page.

  List<String> selections = [];
  void addToSelections(String item) => selections.add(item);
  void removeFromSelections(String item) => selections.remove(item);
  void removeAtIndexFromSelections(int index) => selections.removeAt(index);
  void insertAtIndexInSelections(int index, String item) =>
      selections.insert(index, item);
  void updateSelectionsAtIndex(int index, Function(String) updateFn) =>
      selections[index] = updateFn(selections[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for SocialMedia widget.
  bool? socialMediaValue;
  // State field(s) for Facebook widget.
  bool? facebookValue;
  // State field(s) for Google widget.
  bool? googleValue;
  // State field(s) for Friend widget.
  bool? friendValue;
  // State field(s) for Internet widget.
  bool? internetValue;
  // State field(s) for Other widget.
  bool? otherValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
