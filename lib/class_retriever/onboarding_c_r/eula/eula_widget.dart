import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'eula_model.dart';
export 'eula_model.dart';

class EulaWidget extends StatefulWidget {
  const EulaWidget({super.key});

  static String routeName = 'EULA';
  static String routePath = '/EULA';

  @override
  State<EulaWidget> createState() => _EulaWidgetState();
}

class _EulaWidgetState extends State<EulaWidget> {
  late EulaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EulaModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body:
            // Replace background image here.
            Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: MediaQuery.sizeOf(context).height * 1.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                Theme.of(context).brightness == Brightness.dark
                    ? 'assets/images/Yellow-Dark03.jpg'
                    : 'assets/images/Yellow-Waves.jpg',
              ).image,
            ),
          ),
          child:
              // Make sure you remove the background color (Surface Dim) for all the block containers:
              //
              // 1. Top navigation / Header
              // 2. Primary Navigation
              // 3. Body
              // 4. Bottom navigation / Footer
              Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (responsiveVisibility(
                context: context,
                phone: false,
              ))
                Container(
                  width: 24.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  decoration: BoxDecoration(),
                ),
              Flexible(
                child: SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Responsive safe area,
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: () {
                          if (MediaQuery.sizeOf(context).width <
                              kBreakpointSmall) {
                            return 111.0;
                          } else if (MediaQuery.sizeOf(context).width <
                              kBreakpointMedium) {
                            return 111.0;
                          } else if (MediaQuery.sizeOf(context).width <
                              kBreakpointLarge) {
                            return 64.0;
                          } else {
                            return 64.0;
                          }
                        }(),
                        decoration: BoxDecoration(),
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(Welcome1Widget.routeName);
                              },
                              child: Icon(
                                Icons.arrow_back_ios_new_outlined,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 28.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        primary: false,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, -1.0),
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 200),
                                curve: Curves.linear,
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                constraints: BoxConstraints(
                                  maxWidth: kBreakpointSmall,
                                ),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(32.0),
                                    topRight: Radius.circular(32.0),
                                    bottomLeft: Radius.circular(32.0),
                                    bottomRight: Radius.circular(32.0),
                                  ),
                                ),
                                alignment: AlignmentDirectional(0.0, -1.0),
                                child: Align(
                                  alignment: AlignmentDirectional(-1.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 24.0, 20.0, 24.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Align(
                                            alignment: AlignmentDirectional(
                                                -1.0, -1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 10.0, 0.0, 0.0),
                                              child: SelectionArea(
                                                  child: Text(
                                                'Please Read and Accept or Decline the Class Retriever End User Licensing Agreement',
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLarge
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineLargeFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          lineHeight: 1.5,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineLargeIsCustom,
                                                        ),
                                              )),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 50.0, 0.0, 0.0),
                                            child: RichText(
                                              textScaler: MediaQuery.of(context)
                                                  .textScaler,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        'Effective Date: October 1, 2025\n\nEND USER LICENSE AGREEMENT\n\nThis End User License Agreement (“EULA” or the “Agreement”) is a legal agreement between you (the individual and your organization – the “User”) and Smart Data Consultants LLC (“Smart Data”) (each a “Party” and, collectively, the “Parties”) and it governs your use of the licensed software (the “Software”).\n\nBy clicking the “I Agree” button and downloading the Software, you are agreeing to be bound by the terms and conditions of this EULA, as updated from time to time at Smart Data’s sole discretion. Please read this EULA carefully before clicking the “I Agree” button or downloading the Software. By clicking the “I Agree” button or downloading the Software, you are agreeing to be bound by the terms and conditions of this Agreement. If you do not agree to the terms of this Agreement, do not click on the “I Agree” button, download, or use the Software.\n\nThe Software is licensed, not sold, to you by Smart Data for use strictly in accordance with the terms of this Agreement.\n\nLicense\n\nSmart Data grants you a revocable, non-exclusive, non-transferable, limited license to use the Software solely for and purposes strictly in accordance with the terms of this Agreement, so long as you have satisfied your obligations under it.\n\nSmart Data retains all rights to the Software not granted to you in this paragraph. “Software” means any software programs, tools, add-ons, databases, libraries, guides, manuals, documentation, code including source code, object code, and binary code, and other related materials developed by Smart Data, including any modifications, enhancements, or upgrades made thereto at any time. This EULA does not grant you any rights to copyrights, patents, trademarks, trade secrets, or other intellectual property rights in or to the Software beyond the limited license granted in this paragraph, and you shall take no action or assert any right inconsistent with Smart Data’s sole ownership thereof.\n\nEligibility\n\nYou must be 13 years or older to use the Software. We may, in our sole discretion refuse to allow you to use the Software or change our eligibility criteria at any time. You are solely responsible for ensuring that you comply fully with this End User License Agreement. You may not use the Software for any illegal, unauthorized purpose or in any other way contrary to this End User License Agreement. The Software is offered to you only for your use and not for the benefit of any third party.\n\nRestrictions\n\nYou agree not to, and you will not permit any other person or entity to, perform any of the following prohibited activities, including but not limited to:\n\n - license, sell, rent, lease, assign, distribute, transmit, host, outsource, disclose, access, or otherwise commercially exploit the Software or make the Software available to any third party;\n\n - copy or use the Software for any purpose other than as permitted under the above section ‘License’;\n\n - modify, make derivative works of, disassemble, decrypt, reverse compile, or reverse engineer any part of the Software;\n\n - remove, alter, deface, or obscure any proprietary notice (including any notice of patent, copyright, or trademark) of Smart Data or its affiliates, partners, suppliers, or the licensors of the Software;\n\n - use the Software to distribute viruses, scripts, Trojan horses, worms, malware, timebombs, or other harmful components to or from Smart Data’s or other systems; and\n\n - transmit, store, or distribute any material that violates any applicable law, including export or encryption laws or regulations.\n\nIntellectual Property and Confidential or Proprietary Information Ownership\n\nThe Software, including without limitation all copyrights, patents, trademarks, trade secrets, and other intellectual property rights are, and shall remain, the sole and exclusive property of Smart Data. The Software incorporates confidential and proprietary information developed, acquired by, or licensed to Smart Data. In using the Software, you may learn additional information that is confidential and proprietary to Smart Data (the “Confidential Information”). You will take all commercially reasonable precautions necessary to safeguard the confidentiality of the Confidential Information, including (i) those taken to protect your own Confidential Information and (ii) those which Smart Data may reasonably request from time to time. You will take all commercially reasonable precautions necessary to prevent the removal or defacement of any confidentiality or proprietary notice or notice of any intellectual property right or ownership by Smart Data placed on the Software or other items of Confidential Information. The placement of copyright notices on these items will not constitute publication or otherwise impair their confidential nature.\n\nAll patents, copyrights, trademarks, trade secrets, and other proprietary rights in or related to the Software are and will remain the exclusive property of Smart Data or its licensors, whether or not specifically recognized or perfected under the laws of the jurisdiction or territory in which you or your organization is exercising the Software license hereunder. You will not take any action that jeopardizes Smart Data’s or its licensors’ proprietary rights or acquire or attempt to acquire any right in the Software or Confidential Information, except the limited rights specified in this Agreement. Smart Data or its licensors own all rights and title in and to any copy, translation, modification, adaptation, or derivation of the Software or other items of Confidential Information, including any improvement to or development, update, or enhancement thereof.\n\nAuthority\n\nThe Parties represent and warrant that the execution, delivery, and performance of this Agreement does not, and the consummation of the transactions contemplated hereby will not: (i) result in a material breach of any provision of or constitute a material default under (a) the governing documents, operating policies, or procedures of either Party, (b) any agreement or instrument to which either Smart Data or you are a party or by which either is bound, or (c) any statute or regulatory provision affecting either Party; or, (ii) require the consent of or approval of any other person, entity, or governmental agency or authority that has not been obtained.\n\nOwnership/Use of Your Data\n\nSmart Data owns rights in data that is generated in connection with the Software, such as metadata generated in connection with the Software. Smart Data has a limited license to use your data to monitor and administer the Software, resolve service requests, address performance, operation, and use of the Software, or conduct research and development activities relating to potential modifications of and improvements to the Software. Please review our ',
                                                    style: TextStyle(),
                                                  ),
                                                  TextSpan(
                                                    text: 'privacy policy ',
                                                    style: TextStyle(
                                                      decoration: TextDecoration
                                                          .underline,
                                                    ),
                                                    mouseCursor:
                                                        SystemMouseCursors
                                                            .click,
                                                    recognizer:
                                                        TapGestureRecognizer()
                                                          ..onTap = () async {
                                                            await launchURL(
                                                                'https://classretriever.com/privacy-policy/');
                                                          },
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        'for further information on our use of your data.\n\nInvestigations\n\nSmart Data reserves the right to investigate any potential violations of the EULA by: (a) restricting your access to the Software; (b) removing or requiring the removal of any potentially offending or illegal material; or (c) exercising any other rights and remedies available to Smart Data at law or in equity. Before undertaking any responsive actions, Smart Data will seek to provide you with at least three days’ written notice to cure suspected violations, unless Smart Data deems it necessary to act sooner with or without notice.\n\nYour Suggestions\n\nAny feedback, comments, ideas, improvements, or suggestions (collectively, “Suggestions“) provided by you to Smart Data with respect to the Software shall remain the sole and exclusive property of Smart Data.\nSmart Data shall be free to use, copy, modify, publish, or redistribute the Suggestions for any purpose and in any way without any credit or any compensation to you.\n\nThird-Party Services\n\nThe Software may display, include, or make available third-party content (including data, information, software, applications, and other products services) or provide links to third-party websites or services (“Third-Party Services“).\n\nYou acknowledge and agree that Smart Data shall not be responsible for any Third-Party Services, including their accuracy, completeness, timeliness, validity, copyright compliance, legality, decency, quality, or any other aspect thereof. Smart Data does not assume and shall not have any liability or responsibility to you or any other person or entity for any Third-Party Services.\n\nThird-Party Services and links thereto are provided solely as a convenience to you, and you access and use them entirely at your own risk and subject to such third parties’ terms and conditions.\n\nPrivacy Statement\n\nSmart Data collects, stores, maintains, and shares information about you in accordance with its Privacy Statement, which is available at  ',
                                                    style: TextStyle(),
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        'https://classretriever.com/privacy-policy/. ',
                                                    style: TextStyle(
                                                      decoration: TextDecoration
                                                          .underline,
                                                    ),
                                                    mouseCursor:
                                                        SystemMouseCursors
                                                            .click,
                                                    recognizer:
                                                        TapGestureRecognizer()
                                                          ..onTap = () async {
                                                            await launchURL(
                                                                'https://classretriever.com/privacy-policy/');
                                                          },
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        'You are strongly encouraged to read that Privacy Statement, which addresses important information about the handling of your personal information. By accepting this Agreement, you acknowledge that you hereby agree and consent to the terms and conditions of our Privacy Statement, as updated from time to time at Smart Data’s sole discretion.\n\nThird Party Requests for Access to Your Data\n\nIn the event that a third party seeks access to your data deployed in the Software and it is required to be disclosed by law or any governmental authority or other similar requirements, Smart Data will (if not prohibited by law) notify you of the compelled disclosure so that you can seek to avoid disclosure by means of a protective order or other relevant means. It is your responsibility to ensure that you comply with any request for preservation, access, or production of your data any other relevant electronically stored information such as metadata associated with your data and any related preservation duties under the law. You must provide Smart Data any notices relating to this Paragraph by sending an email to support@classretriever.com ATTN: Smart Data Compliance.\n\nTerm and Termination\n\nThis Agreement shall remain in effect until: (i) terminated by Smart Data; (ii) Smart Data receives notification in writing from you indicating your desire to terminate your business relationship with Smart Data and any and all agreements therewith, subject to the terms of such agreements; or (iii) otherwise terminated as specified below.\n\nSmart Data may, in its sole discretion, at any time and for any or no reason, suspend or terminate this Agreement with or without prior notice. This Agreement will terminate immediately, without prior notice from Smart Data, in the event that you fail to comply with any material provision of this Agreement.\n\nYou may also terminate this Agreement by providing written notification and acknowledgment that you have deleted the Software (where downloaded) and all copies thereof from your devices and computer systems and ceasing all use of the Software. Smart Data reserves the right to conduct an audit or use a third-party auditor if any concerns arise.\n\nTermination of this Agreement will not limit any of Smart Data’s rights or remedies at law or in equity in case of breach by you (during the term of this Agreement) of any of your obligations under the present Agreement or any other agreements related to your business relationship with Smart Data.\n\nIndemnification\n\nYou agree to indemnify and hold Smart Data and its parents, subsidiaries, affiliates, officers, employees, agents, partners, and licensors (collectively, the “Smart Data Indemnitees”) harmless from any claim or demand, including reasonable attorneys’ fees, due to or arising out of your: (a) use of the Software; (b) violation of this Agreement or any law or regulation; (c) breach of representations, warranties, obligations, or covenants set forth in this Agreement; (d) your gross negligence or willful misconduct; or (e) violation of any right of a third party.\n\nNo Warranties\n\nThe Software is provided to you “AS IS” and “AS AVAILABLE” and with all faults and defects without warranty of any kind. To the maximum extent permitted under applicable law, Smart Data, on its own behalf and on behalf of its affiliates and its and their respective licensors and service providers, expressly disclaims all warranties, whether express, implied, statutory, or otherwise, with respect to the Software, including all implied warranties of merchantability, fitness for a particular purpose, title, and non-infringement, and warranties that may arise out of course of dealing, course of performance, usage, or trade practice. Without limitation to the foregoing, Smart Data provides no warranty or undertaking, and makes no representation of any kind that the Software will meet your requirements, achieve any intended results, be compatible or work with any other software, applications, systems, or services, operate without interruption, meet any performance or reliability standards or be error free or that any errors or defects can or will be corrected.\n\nWithout limiting the foregoing, neither Smart Data nor any Smart Data’s licensors or service provider makes any representation or warranty of any kind, express or implied: (i) as to the operation or availability of the Software, or the information, content, and materials or products included thereon; (ii) that the Software will be uninterrupted or error-free; (iii) as to the accuracy, reliability, or currency of any information or content provided through the Software; or (iv) that the Software, its servers, the content, or e-mails sent from or on behalf of Smart Data are free of viruses, scripts, trojan horses, worms, malware, timebombs, or other harmful components.\n\nSome jurisdictions do not allow the exclusion of or limitations on implied warranties or the limitations on the applicable statutory rights of a consumer, so some or all of the above exclusions and limitations may not apply to you.\n\nLimitation of Liability\n\nNotwithstanding any damages that you might incur, the entire collective aggregate liability of Smart Data and any of its licensors, service providers, or suppliers under any provision of this Agreement and under any legal or equitable theory, including breach of contract, tort (including negligence), strict liability, or otherwise, and your exclusive remedy for all of the foregoing, shall be limited to the amount actually paid by you for the Software license fee for the twelve months preceding the date on which the cause of action arises.\n\nTo the maximum extent permitted by applicable law, in no event shall Smart Data or its suppliers be liable for any special, incidental, indirect, or consequential damages whatsoever (including, but not limited to, damages for loss of profits, loss of data or other information, business interruption, personal injury, loss of privacy arising out of or in any way related to the use of or inability to use the Software, third-party software, and/or third-party hardware used with the Software, or otherwise in connection with any provision of this Agreement), even if Smart Data or any supplier has been advised of the possibility of such damages and even if the remedy fails of its essential purpose.\n\nSome jurisdictions do not allow the exclusion or limitation of incidental or consequential damages, so the above limitation or exclusion may not apply to you.\n\nSeverability\n\nIf any provision of this Agreement is held to be unenforceable or invalid, such provision will be changed and interpreted to accomplish the objectives of such provision to the greatest extent possible under applicable law, and the remaining provisions will continue in full force and effect.\n\nWaiver\n\nExcept as provided herein, the failure to exercise a right or to require performance of an obligation under this Agreement shall not effect a party’s ability to exercise such right or require such performance at any time thereafter nor shall be the waiver of a breach constitute waiver of any subsequent breach.\n\nExport Compliance\n\nYou may not export or re-export the Software except as authorized by United States law and the laws of the jurisdiction in which the Software was obtained.\n\nIn particular, but without limitation, the Software may not be exported or re-exported (a) into or to a nation or a resident of any U.S. embargoed countries or (b) to anyone on the U.S. Treasury Department’s list of Specially Designated Nationals or the U.S. Department of Commerce Denied Person’s List or Entity List.\n\nBy installing or using any component of the Software, you represent and warrant that you are not located in, under control of, or a national or resident of any such country or on any such list.\n\nAmendments to this Agreement\n\nSmart Data reserves the right, at its sole discretion, to modify or replace this Agreement at any time. If a revision is material, we will provide at least 30 days’ notice prior to any new terms taking effect. What constitutes a material change will be determined at our sole discretion.\n\nBy continuing to access or use our Software after any revisions become effective, you agree to be bound by the revised terms. If you do not agree to the new terms, you are no longer authorized to use the Software.\n\nGoverning Law\n\nThe laws of the State of Montana, excluding its conflicts of law rules, shall govern this Agreement and your use of the Software. Your use of the Software may also be subject to other local, state, national, or international laws.\n\nThis Agreement shall not be governed by the United Nations Convention on Contracts for the International Sale of Good.\n\nContact Information\n\nIf you have any questions about this Agreement, please contact us at:\n\nSmart Data Consultants LLC\n2726 Bancroft St.\nMissoula, MT  59801\nEmail: support@classretriever.com\n\nEntire Agreement\n\nExcept as specified below, the Agreement constitutes the entire contract between you and Smart Data regarding your use of the Software and supersedes all prior and contemporaneous written or oral agreements between you and Smart Data.\n\nYou may be subject to additional terms and conditions that apply when you use or purchase other Smart Data services, which Smart Data will provide to you at the time of such use or purchase.',
                                                    style: TextStyle(),
                                                  )
                                                ],
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 20.0, 0.0, 5.0),
                                            child: Text(
                                              'I have read and agree to the Class Retriever end user licensing agreement.',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumIsCustom,
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                FFButtonWidget(
                                                  onPressed: () async {
                                                    context.pushNamed(
                                                        OneQuestionWidget
                                                            .routeName);
                                                  },
                                                  text: 'I accept',
                                                  options: FFButtonOptions(
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    textStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallIsCustom,
                                                            ),
                                                    elevation: 0.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                                FFButtonWidget(
                                                  onPressed: () async {
                                                    GoRouter.of(context)
                                                        .prepareAuthEvent();
                                                    await authManager.signOut();
                                                    GoRouter.of(context)
                                                        .clearRedirectLocation();

                                                    context.goNamedAuth(
                                                        LoginWidget.routeName,
                                                        context.mounted);
                                                  },
                                                  text: 'I decline',
                                                  options: FFButtonOptions(
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    textStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallIsCustom,
                                                            ),
                                                    elevation: 0.0,
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 25.0)),
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 5.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ].divide(SizedBox(height: 4.0)),
                  ),
                ),
              ),
              if (responsiveVisibility(
                context: context,
                phone: false,
              ))
                Container(
                  width: 24.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  decoration: BoxDecoration(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
