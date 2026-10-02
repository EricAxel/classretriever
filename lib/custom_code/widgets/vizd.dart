// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:visibility_detector/visibility_detector.dart';

class Vizd extends StatefulWidget {
  const Vizd({
    super.key,
    this.width,
    this.height,
    required this.onVisible,
    this.index,
    this.onout,
  });

  final double? width;
  final double? height;
  final Future Function() onVisible;
  final int? index;
  final Future Function()? onout;

  @override
  State<Vizd> createState() => _VizdState();
}

class _VizdState extends State<Vizd> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    VisibilityDetectorController.instance.updateInterval = Duration.zero;
  }

  void _onVisibilityChanged(VisibilityInfo info) async {
    if (info.visibleFraction == 1.0 && !_isVisible) {
      _isVisible = true;
      await widget.onVisible();
    } else if (info.visibleFraction == 0.0 && _isVisible) {
      _isVisible = false;
      if (widget.onout != null) {
        await widget.onout!();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('vizualizer_key_${widget.index}'),
      onVisibilityChanged: _onVisibilityChanged,
      child: Container(
        width: widget.width ?? double.infinity,
        height: widget.height ?? 50.0,
        color: Colors.transparent,
      ),
    );
  }
}
