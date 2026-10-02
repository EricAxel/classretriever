import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'termsand_conditions_auth_model.dart';
export 'termsand_conditions_auth_model.dart';

class TermsandConditionsAuthWidget extends StatefulWidget {
  const TermsandConditionsAuthWidget({super.key});

  static String routeName = 'TermsandConditionsAuth';
  static String routePath = '/TermsandConditionsAuth';

  @override
  State<TermsandConditionsAuthWidget> createState() =>
      _TermsandConditionsAuthWidgetState();
}

class _TermsandConditionsAuthWidgetState
    extends State<TermsandConditionsAuthWidget> {
  late TermsandConditionsAuthModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermsandConditionsAuthModel());
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
                                context.pushNamed(SignupWidget.routeName);
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
                                            child: SelectionArea(
                                                child: Text(
                                              'Terms of Service for Class Retriever',
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineLargeFamily,
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                        lineHeight: 1.5,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineLargeIsCustom,
                                                      ),
                                            )),
                                          ),
                                          RichText(
                                            textScaler: MediaQuery.of(context)
                                                .textScaler,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text:
                                                      'Effective Date:  October 1, 2025\n\nPlease read the Terms of Service (“Terms of Service”) carefully before accessing and using (i) any of our downloadable applications (the “Application(s)”), (ii) the website classretriever.com (the “Website”) or (iii) any content or material of any kind and in any form uploaded, downloaded or appearing on the Application(s) or the Website, including without limitation, any 3D models, STL files, images, graphics, data, videos, features, text, user interface and software (collectively, the “Content”). The Application, the Websites and the Content collectively constitute the services (the “Services”) offered by Smart Data Consultants LLC (“we”, “us” or “our”). “You” and “your” means you personally, unless defined otherwise. The Terms of Service govern your access to and use of the Services and constitute a legally binding agreement between you and us. If you have any questions about the Terms of Service, please contact us at support@classretriever.com.\n\nAcceptance of the Terms of Service\n\nBy accessing and using the Services in any manner (including without limitation, installing and using our Application(s), visiting and browsing our Website, using the Content or creating or using User Content (defined below)), you agree to be bound by the Terms of Service. You may use the Services only if you have the power to form a contract with us and are not barred under any applicable laws from doing so. If you are using the Services on behalf of an organization or other legal entity, you are agreeing to the Terms of Service for that organization or other legal entity and promising that you have the authority to bind that organization or legal entity to the Terms of Service. In that case, “you” and “your” will refer to that organization or other legal entity. If you do not have such authority or if you do not agree with the Terms of Service, then you may not use the Services.\n\nYou may use the Services (including without limitation creating User Content (defined below)) only in compliance with the Terms of Service. The Terms of Service apply to all users of the Services, including without limitation, users who are contributors of User Content (defined below).\n\nEligibility\n\nYou must be 13 years or older to use the Services. We may, in our sole discretion, refuse to offer the Services to any person or entity and change our eligibility criteria at any time. You are solely responsible for ensuring that you comply fully with the Terms of Service. You may not use the Services for any illegal, unauthorized purpose or in any other way contrary to these Terms of Service. The Services are offered to you only for your use and not for the benefit of any third party.\n\nModifications\n\nThe Services may continue to change over time as we update, refine and add more features. We reserve the right, in our sole discretion, to modify or replace any of the provisions of the Terms of Service, or change, suspend, or discontinue any of the Services at any time. We may also impose limits on certain features and services or restrict your access to parts or all of the Services without notice or any liability to us.\n\nPlease check classretriever.com for the most current revised Terms of Service. It is your responsibility to check the Terms of Service periodically for changes. By continuing to access or use the Services after any changes to the Terms of Service become effective, you agree to be bound by the revised Terms of Service. If you do not agree to the revised Terms of Service, then please stop using the Services.\n\nLicense for You to Use the Services\n\nThe Services (excluding any User Content) are our intellectual property and are protected by United States and other applicable copyright, patent and other laws and international treaty provisions. Subject to your full and complete compliance with the Terms of Service, we grant you a worldwide, non-exclusive, non-sublicensable and non-transferable license to use the Services solely for personal, non-commercial purposes. Use, reproduction, modification, distribution or storage of any of the Services for other than personal, non-commercial use is expressly prohibited without prior written permission from us. You shall not sell, license, rent, or otherwise use or exploit any of the Services for commercial use or in any way that violates any third party right.\n\nIntellectual Property Notices\n\nThe Services may contain content specifically provided by us or others (including but not limited to software components) which are protected by copyrights, trademarks, service marks, patents, trade secrets or other proprietary rights and laws. You shall abide by and maintain all copyright notices, information, and restrictions contained in any of the Services.\n\nUser Content\n\nUser Content is any content that is created, originated, edited, modified, uploaded or shared by users (including you) in any way and in any form using the Services, whether or not shared publicly or privately (“User Content”). \n\nYour Intellectual Property. We claim no intellectual property rights over any User Content, including your User Content.\n\nYour Sole Responsibility and Risk. Any User Content created, originated, edited, modified, uploaded or shared in any way and in any form by you (publicly or privately) using the Services is your sole responsibility and subject to these Terms of Service. In addition, you acknowledge that any use of the Services by you (including without limitation, creating and disseminating User Content) is at your own risk and you will be solely responsible for any damage or loss to you or any other party resulting directly or indirectly from your use of the Services.\n\nLicense Grant to Us for Your User Content Shared with Us. Subject to our ',
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                ),
                                                TextSpan(
                                                  text: 'Privacy Policy',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMediumIsCustom,
                                                      ),
                                                  mouseCursor:
                                                      SystemMouseCursors.click,
                                                  recognizer:
                                                      TapGestureRecognizer()
                                                        ..onTap = () async {
                                                          await launchURL(
                                                              'https://classretriever.com/privacy-policy/');
                                                        },
                                                ),
                                                TextSpan(
                                                  text:
                                                      ', you hereby grant, and you represent and warrant that you have the right to grant, to us, an irrevocable, nonexclusive, royalty-free and fully paid, worldwide license to reproduce, distribute, publicly display and perform, prepare derivative works of, incorporate into other works, and otherwise use any of your User Content that you share with us either electronically or through any other means, and to grant sublicenses of the foregoing, solely for the purposes of including such User Content shared with us in any Services. You agree to irrevocably waive (and cause to be waived) any claims and assertions of moral rights or attribution with respect to any of such User Content shared with us.\n\nRemoval of User Content. We make no guarantees regarding the availability of your User Content through the Services. We have no obligation to monitor any User Content but we reserve the right to (i) remove, edit or modify any User Content in our sole discretion, at any time, without notice to you and for any reason (including, but not limited to, upon receiving claims or allegations from third parties or authorities relating to such User Content or if we are concerned that you may have violated the Terms of Service), or for no reason at all and (ii) to remove or block any User Content from the Services.\n\nConduct Rules\n\nAs a condition of use, you promise not to use the Services for any purpose that is prohibited by the Terms of Service. You are solely responsible for all of your activity in connection with the Services (including, without limitation, your User Content) and you are solely responsible for your conduct and your communication with others when using the Services.\n\nYou shall not (and shall not permit any other person or entity to) either (a) take any action or (b) upload, download, create, generate, post, submit or otherwise distribute or facilitate distribution of any content or material (including without limitation any User Content) on or through the Services that:\n\n• infringes any intellectual property, including without limitation, patent, trademark, trade secret, copyright, right of publicity or other right of any other person or entity or violates any law or contractual duty (see the Copyright Policy below);\n\n• you know is false, misleading, untruthful or inaccurate;\n\n• is unlawful, threatening, abusive, harassing, defamatory, libelous, slanderous, deceptive, fraudulent, invasive of another’s privacy, stalking, tortious, obscene, vulgar, pornographic, offensive, bigoted, racist, prejudiced, profane, contains or depicts nudity, contains or depicts sexual activity, or is otherwise inappropriate as determined by us in our sole discretion;\n\n• is harmful to minors in any way;\n\n• directly or indirectly promotes or provides instructional information about illegal activities, including, without limitation, the designing or making of anything (in whole or in part) that could cause injury or death, including without limitation guns or any other type of weapon or other instrument that could inflict harm;\n\n• constitutes unauthorized or unsolicited advertising, spam, junk or bulk email;\n\n• contains software viruses or any other computer codes, files, or programs that are designed or intended to disrupt, damage, limit or interfere with the function of any software, hardware, or telecommunications equipment or to damage or obtain unauthorized access to any system, data, password or other information of ours or of any third party;\n\n• impersonates any person or entity, including without limitation, any of our employees or representatives; or\n\n• includes anyone’s identification documents or sensitive financial information; or\n\n• depicts cruelty to animals.\n\nYou shall not: (i) take any action that imposes or may impose (as determined by us in our sole discretion) an unreasonable or disproportionately large load on our (or our third party providers’) infrastructure, system or network; (ii) interfere or attempt to interfere with the working of the Services or any activities conducted on the Services; (iii) bypass, circumvent or attempt to bypass or circumvent any measures we may use to prevent or restrict access to the Services (or other accounts, computer systems or networks connected to the Services); (iv) run any form of auto-responder or “spam” on the Services; (v) use manual or automated software, devices, or other processes to “crawl” or “spider” any page of the website; (vi) harvest or scrape any Content from the Services; or (vii) otherwise take any action in violation of the Terms of Service.\n\nYou shall not directly or indirectly: (i) decipher, decompile, disassemble, reverse engineer or otherwise attempt to derive any source code or underlying ideas or algorithms of any part of the Services (including without limitation any application), (ii) modify, translate, or otherwise create derivative works of any part of the Services, or (iii) copy, rent, lease, distribute, or otherwise transfer any of the rights that you receive hereunder. You shall abide by all applicable local, state, national and international laws and regulations.\n\nWe also reserve the right to access, read, retain, and disclose any information as we reasonably believe is necessary to (i) satisfy any applicable law, regulation, legal process or governmental request, (ii) enforce the Terms of Service, including investigation of potential violations hereof, (iii) detect, prevent, or otherwise address fraud, security or technical issues, (iv) respond to user support requests, or (v) protect the rights, property or safety of us, our users and the public.\n\nThird Party Services and Products\n\nThe Services may enable access or provide links to third party websites, services or resources on the Internet, and other third party websites, services or resources may contain links to the Services. Third party websites, services or resources are not under our control, and you acknowledge that we are not responsible or liable for their content, products, services, functions, accuracy, legality, appropriateness, connectivity or any other aspect of such third party websites, services and resources. Links to third party websites, services and resources are provided solely as a convenience to you. The inclusion of any such link in the Services does not imply our endorsement or any association between us and their owners or operators. You acknowledge sole responsibility for and assume all risk arising from your access or use of any third party websites, services and resources accessed on the Services. You further acknowledge and agree that we shall not be responsible or liable, directly or indirectly, for any claim, damage or loss caused or alleged to be caused by or in connection with the use of or reliance on any content, goods or services available on or through any such third party websites, services and resources.\n\nWe reserve the right to change, suspend, remove, or disable access to any third party websites, resources and services at any time without notice. In no event will we be liable for the removal of or disabling of access to any such third party websites, resources and services. We may also impose limits on the use of or access to certain third party websites, resources and services, in any case and without notice to you and without liability to us.\n\nPlease note that references to or descriptions or images of third party products in connection with the Services should not be interpreted as endorsements of such products.\n\nTermination\n\nThe Terms of Service will continue to apply to you until terminated by either you or us.\n\nYou may stop using our Services at any time.\n\nWe may suspend or terminate your access to all or any part of the Services at any time, with or without cause, with or without notice, effective immediately, which may result in the forfeiture and destruction of all information associated with your use of the Services. For example, we may suspend or terminate use if you are not complying with the Terms of Service, or use the Services in any way that would cause us legal liability, or disrupt others’ use of the Services.\n\nIn the event of your termination in all instances, your license to use the Services shall terminate immediately. Upon termination, you shall stop accessing or otherwise using the Services, and shall destroy all copies, full and partial of the Application that you installed on any or all of your devices.\n\nAll provisions of the Terms of Service which by their nature should survive termination shall survive termination, including, without limitation, ownership provisions, warranty disclaimers, indemnity and limitations of liability.\n\nNo Warranty\n\nYOU EXPRESSLY ACKNOWLEDGE AND AGREE THAT USE OF THE SERVICES IS AT YOUR SOLE RISK AND THAT THE ENTIRE RISK AS TO SATISFACTORY QUALITY, PERFORMANCE, ACCURACY AND EFFORT IS WITH YOU. TO THE MAXIMUM EXTENT PERMITTED BY APPLICABLE LAW, THE SERVICES ARE PROVIDED “AS IS”, “AS AVAILABLE”, WITH ALL FAULTS AND WITHOUT WARRANTY OF ANY KIND, EXPRESS, IMPLIED OR STATUTORY, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF TITLE, NON-INFRINGEMENT OF THIRD PARTY RIGHTS, MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, ACCURACY, QUIET ENJOYMENT, AND ANY WARRANTIES IMPLIED BY ANY COURSE OF PERFORMANCE OR USAGE OF TRADE, ALL OF WHICH ARE EXPRESSLY DISCLAIMED. WE, AND OUR DIRECTORS, EMPLOYEES, AGENTS, SUPPLIERS, PARTNERS AND CONTENT PROVIDERS, DO NOT WARRANT: (I) AGAINST INTERFERENCE WITH YOUR ENJOYMENT OF THE SERVICES, (II) THAT THE FUNCTIONS CONTAINED IN OR PERFORMED OR PROVIDED BY THE SERVICES WILL MEET YOUR REQUIREMENTS, (III) THAT THE OPERATION OF THE SERVICES WILL BE UNINTERRUPTED, ERROR-FREE, SECURE OR AVAILABLE AT ANY PARTICULAR TIME OR LOCATION, (IV) THAT ANY ERRORS OR DEFECTS IN THE SERVICES WILL BE CORRECTED, OR (V) THAT ANY CONTENT OR SOFTWARE AVAILABLE AT OR THROUGH THE SERVICES IS FREE OF VIRUSES OR OTHER HARMFUL COMPONENTS. NO ORAL OR WRITTEN INFORMATION OR ADVICE GIVEN BY US OR OUR AUTHORIZED REPRESENTATIVE SHALL CREATE A WARRANTY. SHOULD THE SERVICES PROVE DEFECTIVE, YOU ASSUME THE ENTIRE COST OF ALL NECESSARY SERVICING, REPAIR OR CORRECTION. SOME JURISDICTIONS DO NOT ALLOW THE EXCLUSION OF IMPLIED WARRANTIES OR LIMITATIONS ON APPLICABLE STATUTORY RIGHTS OF A CONSUMER, SO THE ABOVE EXCLUSION AND LIMITATIONS MAY NOT APPLY TO YOU.\n\nIndemnification\n\nYou shall defend, indemnify, and hold harmless us, our affiliates and each of our and their respective employees, contractors, directors, suppliers and representatives from all liabilities, claims, proceedings and expenses (including reasonable attorneys’ fees) brought by a third party, that arise from or relate to (i) your use or misuse of, or access to, the Services, or otherwise from your User Content (ii) your violation of the Terms of Service, or (iii) any infringement of any intellectual property or other right of any person or entity by you or any third party using your device or computer to access or use the Services. We reserve the right to assume the exclusive defense and control of any matter otherwise subject to indemnification by you, in which event you will assist and cooperate with us in asserting any available defenses.\n\nLimitation of Liability\n\nIN NO EVENT SHALL WE, NOR OUR DIRECTORS, EMPLOYEES, AGENTS, PARTNERS, SUPPLIERS OR CONTENT PROVIDERS, BE LIABLE UNDER CONTRACT, TORT, STRICT LIABILITY, NEGLIGENCE OR ANY OTHER LEGAL OR EQUITABLE THEORY WITH RESPECT TO THE SERVICES (I) FOR ANY LOSS OF USE, LOSS OF BUSINESS, LOSS OF GOODWILL, LOST PROFITS, DATA LOSS, BUSINESS INTERRUPTION, COST OF PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES, OR FOR ANY SPECIAL, INDIRECT, INCIDENTAL, PUNITIVE, COMPENSATORY OR CONSEQUENTIAL DAMAGES OF ANY KIND WHATSOEVER (HOWEVER ARISING), (II) FOR ANY BUGS, VIRUSES, TROJAN HORSES, OR THE LIKE (REGARDLESS OF THE SOURCE OF ORIGINATION), OR (III) FOR ANY DIRECT DAMAGES IN EXCESS OF (IN THE AGGREGATE) OF FIFTY U.S. DOLLARS (\$50.00). SOME STATES DO NOT ALLOW THE EXCLUSION OR LIMITATION OF INCIDENTAL OR CONSEQUENTIAL DAMAGES, SO THE ABOVE LIMITATIONS AND EXCLUSIONS MAY NOT APPLY TO YOU.\n\nCopyright Policy\n\nWe will respond to notices of alleged copyright infringement if they comply with the law and are properly provided to us. We reserve the right to delete or disable any material or content on or accessible through our Services alleged to be infringing and to terminate repeat infringers. If you believe that material or content on or accessible through our Services infringes a copyright, please send a notice of alleged copyright infringement containing all of the following information to the designated agent listed below:\n\n• identify in sufficient detail the copyrighted work that you believe has been infringed upon;\n\n• identify the material you claim is infringing the copyrighted work, including information regarding the location of the allegedly infringing materials in the Services, with sufficient detail so that we are capable of finding and verifying its existence;\n\n• provide your contact information, including address, telephone number and, if available, email address;\n\n• include the following statement: “I have a good faith belief that use of the copyrighted work is not authorized by the copyright owner, its agent, or the law.”;\n\n• include the following statement: “I swear, under penalty of perjury that the information in the notification is accurate and that I am the copyright owner or I am authorized to make the complaint on behalf of the copyright owner.”; and\n\n• sign the notice physically or electronically.\n\nPlease send the notice of alleged copyright infringement to our designated agent as follows: If via postal mail: Copyright Agent, Smart Data Consultants LLC, 2726 Bancroft Street, Missoula, Montana 59801. If via email: support@classretriever.com.\n\nGoverning Law and Jurisdiction\n\nThe Terms of Service shall be governed by and construed in accordance with the laws of the State of Montana, including its conflicts of law rules. You agree that any dispute arising from or relating to the subject matter of the Terms of Service or the Services shall be governed by the exclusive jurisdiction and venue of the state and federal courts of Missoula, Montana.\n\nEntire Agreement\n\nThe Terms of Service are the entire and exclusive agreement between you and us with respect to the Services and supersede and replace all prior agreements, terms or conditions in any form (including oral, written or electronic) between you and us with respect to the Services.\n\nWaiver\n\nOur failure to enforce any right or provision of the Terms of Service will not be deemed a waiver of such right or provision. In addition, our waiver of compliance in any particular instance does not mean that we will waive compliance in the future.\n\nSeverability\n\nIf any provision of the Terms of Service is found to be unenforceable, the remaining provisions will remain in full force and effect and an enforceable term will be substituted reflecting our intent as closely as possible.\n\nAssignment\n\nYou cannot assign, transfer or sublicense any of your rights or obligations under the Terms of Service. We may assign, transfer or delegate any of our rights or obligations under the Terms of Service without your consent.\n\nForce Majeure\n\nWe will not be liable or responsible for failure to perform any of the Services where the failure results from any cause beyond our reasonable control, including, without limitation, mechanical, electronic or communications failures.\n\nQuestions or Concerns\n\nPlease send all questions, comments and feedback to use at support@classretriever.com.',
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
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
                                        ].divide(SizedBox(height: 24.0)),
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
