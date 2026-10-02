import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/components/walk_trough_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

// Focus widget keys for this walkthrough
final row3t82ar9u = GlobalKey();
final rowNoaols3s = GlobalKey();
final text36et3j2b = GlobalKey();

/// student work new
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: row3t82ar9u,
        enableOverlayTab: true,
        alignSkip: Alignment.topLeft,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => WalkTroughWidget(
              text:
                  'Assignments can be sorted by course name in ascending or descending order.',
            ),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: rowNoaols3s,
        enableOverlayTab: true,
        alignSkip: Alignment.topLeft,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => WalkTroughWidget(
              text:
                  'Assignments can be sorted by due date in ascending or descending order.',
            ),
          ),
        ],
      ),

      /// Step 3
      TargetFocus(
        keyTarget: text36et3j2b,
        enableOverlayTab: true,
        alignSkip: Alignment.topLeft,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => WalkTroughWidget(
              text:
                  'Only assignments from the last 4 weeks are shown. You can change this filter in App Settings.',
            ),
          ),
        ],
      ),
    ];
