import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'privacy_policy_model.dart';
export 'privacy_policy_model.dart';

class PrivacyPolicyWidget extends StatefulWidget {
  const PrivacyPolicyWidget({super.key});

  static String routeName = 'PrivacyPolicy';
  static String routePath = '/PrivacyPolicy';

  @override
  State<PrivacyPolicyWidget> createState() => _PrivacyPolicyWidgetState();
}

class _PrivacyPolicyWidgetState extends State<PrivacyPolicyWidget> {
  late PrivacyPolicyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrivacyPolicyModel());
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
                                context.pushNamed(SettingsWidget.routeName);
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
                                                      12.0, 0.0, 0.0, 0.0),
                                              child: SelectionArea(
                                                  child: Text(
                                                'Privacy Policy',
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLarge
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineLargeFamily,
                                                          fontSize: 22.0,
                                                          letterSpacing: 0.0,
                                                          lineHeight: 1.5,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineLargeIsCustom,
                                                        ),
                                              )),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 0.0, 0.0),
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.8,
                                                height: 5.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 0.0, 0.0),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, -1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    12.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Smart Data Consultants LLC (“Smart Data,” “we,” or “us”) has established this Privacy Policy to let you know how we collect, use, share, and protect information that we may gather from the technology, software, systems, and websites that support our operations (collectively referred to as the “Site”) or that is provided to us by you or third parties.  This Privacy Policy does not apply to information that we may collect from you outside of our Site, such as over the phone, by fax, or through conventional mail.  This Privacy Policy does not apply to the practices of companies that Smart Data does not own or control or to people that Smart Data does not employ or manage.\n\nNON-PERSONAL AND AGGREGATED INFORMATION COLLECTED AUTOMATICALLY\n\nEach time you visit our Site, we log non-personal information that your browser automatically transmits to us.  We may also use third-party website analytics tools (such as Google Analytics) that collect information about user interactions with the Site.  Such information may include your IP address, operating system and browser type, domain name, the name of the Web page from which you entered our website, which pages you visit on our website, and how much time you spend on each page.  We use this information to monitor and improve our website and for internal analysis.  In particular, we use IP addresses to analyze trends, administer the Site, and gather information for aggregate use.  However, IP addresses are not linked to personal information.\n\nUSE OF COOKIES\n\nOur Site may use “cookies” to help personalize your online experience.  A cookie is a text file that is placed on your hard disk by a web page server.  Cookies cannot be used to run programs or deliver viruses to your computer.  Cookies are uniquely assigned to you.  We use cookies to keep track of how you are using our Site and to tailor our content to your interests.  Smart Data cookies do not contain any personal information about students enrolled in Smart Data’s educational programs.  We will not share or sell non-aggregated information contained within cookies to any third party.  The cookies we use are erased when you log off the Site or completely close your browser.\n\nPERSONAL INFORMATION YOU PROVIDE\n\nYou can use portions of our Site without divulging any personal information, including your e-mail address.  Our Site does not collect personal information about individuals except when such individuals specifically provide such information on a voluntary basis.  When you register yourself or children for whom you are the parent or legal guardian for a Smart Data program or participate in a Smart Data program, we may collect information regarding you and your children, as applicable.  This personal information may be collected on our Site or collected via telephone or conventional mail.  The types of information that you may be asked to provide, depending on what services you would like to receive, may include without limitation: your first and last name and age; billing address; the names and ages of your children; registration and enrollment information about your children, if applicable; and an e-mail address where we can contact you.  Once you have registered yourself or your children for a Smart Data program (whether you registered on our Site or through offline communications), there is an online service for all such programs.  There will be a personal information page on the Site that contains some or all of your personal information.\n\nYou may also be assigned a User ID and password and may create, at your discretion, a User ID for your children over 13 years of age any time you are logged on to the Site.  The User ID will allow Smart Data to recognize: your or your child’s first and last name; registration ID; type of account, such as parent/guardian or student; school affiliation or the Smart Data program in which you or your children are enrolled; and the e-mail address you provided.  The User ID and the Site will also allow you to track your or your children’s school assignments and to track your or your children’s progress.  Smart Data will not disclose your password to any third party, except as may be required by law or as otherwise described in this Privacy Policy or the Smart Data Terms of Service at https://classretriever.com/terms-of-service/.\n\nSTUDENT RECORDS\n\nSmart Data also collects personal information made available to Smart Data by contracting educational agencies and institutions, such as student names, student identification numbers, e-mail addresses, courses, teachers, grades, assignments, status of assignments, and/or related information.\n\nSmart Data operates in compliance with federal and state school privacy laws, including The Family Educational Rights and Privacy Act of 1974 (20 U.S.C. § 1232g; 34 CFR Part 99) (“FERPA”).  FERPA is a federal law that protects the privacy of student educational records, and applies to all schools receiving federal funding.  With certain exceptions, this law prohibits schools from releasing personal information of students under the age of 18 without parental consent.  By designating Smart Data as a “school official” and/or a designated contractor with a “legitimate educational interest,” educational agencies and institutions are permitted to share personal information with Smart Data without express, parental consent under the exception provided by 34 CFR § 99.31(a)(1).  You may find out more information about FERPA at http://www.ed.gov/policy/gen/guid/fpco/ferpa/index.html.\n\nThe classification as a “school official,” or as a contracted company with a “legitimate educational interest” is described by the Family Policy Compliance Office (“FPCO”).  The FPCO’s FERPA policy and advisory materials on this issue can be found at https://www2.ed.gov/policy/gen/guid/fpco/ferpa/index.html.\n\nCHILDREN’S ONLINE PRIVACY PROTECTION ACT (COPPA)\n\nProtecting Your child’s privacy is important to us. We comply with the Children’s Online Privacy Protection Act (“COPPA”) to protect children’s privacy online. COPPA requires us to inform parents and legal guardians how we collect, use and disclose personal information from children who are under 13 years of age.\n\nA. Information We Collect from Children\n\nIf you allow your child to open an account with us, we will ask you to consent to our collection, use and disclosure of your child’s personal information in connection with that account. During sign-up, we will ask for your child’s name and school email address. To access his or her account online, your child will  authorize their Google Classroom connection with a Smart Data program using Google OAuth protocols. As part of registering your child’s account, you agree that we can collect the information your child authorizes.\n\nWe won’t require you or your child to provide more information about your child than is reasonably necessary. If we discover that we have collected information from a child in a manner inconsistent with COPPA, we will take appropriate steps to delete the information or seek consent from a parent or legal guardian.\n\nB. How We Use Children’s Personal Information\n\nInformation collected from children (including personal information and information collected automatically) is never used or disclosed for third-party or behaviorally targeted advertising. We never sell or rent children’s personal information, including to marketers, advertisers, or any other third parties.\n\nWe use children’s information in the following ways: to provide our services, process transactions, verify their identity, respond to their requests and communicate with them, perform analytics about how they use our services, improve our business, prevent fraud, ensure security and safety, enforce our terms and account agreements, and for any other use that we disclose to you in connection with your child’s account. Where permissible, we may also use children’s data that has been collected on an aggregate or anonymous basis (meaning that your child is not identified) for various business purposes.\n\nPlease be aware that by allowing your child to have an online account, you are consenting to your child viewing our normal marketing messages that may be displayed to all accounts.\n\nC. Disclosure of Children’s Personal Information\n\nWe may share children’s personal information with our affiliates and other third parties where necessary and permitted. For example, we may share their information with our service providers, our affiliates, in connection with a corporate transaction, to comply with legal requirements, to enforce our terms and other rights and policies, to address fraud, security or technical issues, to respond to an emergency, or where it is otherwise necessary to protect our customers or third parties.\nWe do not allow children to make their personal information publicly available through our services.\n\nD. Parents’ Rights\n\nParents and legal guardians have the legal right to: review the personal information we have collected from your child online, refuse to allow further use or collection of personal information from your child, and delete the personal information we have collected from your child online (unless we are required by law to retain it). However, if you decide that you don’t want us to use or collect your child’s personal information, or you ask us to delete it, we may have to remove their online profile or close their account.\n\nHOW WE USE INFORMATION WE COLLECT\n\nPERSONAL INFORMATION ABOUT YOUR CHILDREN (if applicable)\n\nSmart Data only receives personal information about your children as set forth in the “Student Records” section above and/or directly from you when you enroll your children into a Smart Data program.  If your children are enrolled in a Smart Data program, we will collect, use, and maintain personal information about your children solely (i) to provide Smart Data programs to them and for other authorized educational purposes, and/or (ii) as otherwise authorized by you.\n\nYou can review certain personal information that Smart Data has regarding your children by making such a request in writing to support@classretriever.com.  Please be aware that some personal information relating to your children’s educational records may not be able to be disclosed by Smart Data due to state and/or federal law.  You can request that your children’s personal information not be used by Smart Data and contractors and service providers acting on behalf of Smart Data by making a request in writing to support@classretriever.com.  Please be aware that if you make such a request, your children can no longer continue to be enrolled in a Smart Data program or to use most features on our Site.  Therefore, a request by you for Smart Data and our contractors and service providers to no longer use your children’s personal information will terminate your children’s participation in the Smart Data program in which they are enrolled.\n\nYOUR PERSONAL INFORMATION\n\nSmart Data may use your personal information to:\n\n•\tContact you about your or your children’s participation in a Smart Data program and for other customer service purposes;\n\n•\tProvide you with resources, products, and services, including but not limited to support services related to your use of the Site, that you request from us;\n\n•\tProvide you with information about new products and services available through Smart Data and resources and support services related to your use of the Site, if you choose to receive such information.  If you have opted in to receive such information, you can request to opt out of receiving this information in the future by making a request in writing to support@classretriever.com;\n\n•\tHelp diagnose problems with and administer our Site;\n\n•\tCarry out our obligations and enforce our rights arising from any contracts entered into between you and us; and\n\n•\tComply with applicable legal requirements and industry standards.\n\nWe may aggregate your information with the information of other users for our own internal statistical, design, and/or operational purposes, such as to estimate our audience size, measure aggregate traffic patterns, and understand demographic, customer interest, and other trends among our guests and customers.  This aggregate information generally will not personally identify you or be correlated to you individually for external purposes.\n\nWe also may use the information we obtain about you in other ways for which we provide specific notice at the time of collection.\n\nINFORMATION WE SHARE\n\nWe may collect, compile, store, publish, promote, report, sell, or otherwise disclose or use any and all aggregate information, provided that, such information does not personally identify you.  When we share such information with other companies, or with contracting schools, it is not traceable to any particular user, and will not be used to contact you.\n\nWe do not sell or otherwise disclose personal information except as described in this Privacy Policy.  Smart Data will not disclose your personal information or personal information about your children to third parties except:\n\n•\tIf you authorize Smart Data to do so;\n\n•\tTo contractors, service providers, and other third parties we use to support our business for the purposes described in this Privacy Policy.  Such third parties are bound by contractual obligations to keep personal information confidential and use it only for the purposes for which we disclose it to them;\n\n•\tTo enforce or apply our Terms of Service and other agreements; and/or\n\n•\tAs required by law and when Smart Data believes the disclosure is necessary to protect our rights and/or comply with a judicial proceeding, court order, or legal process served on our Site.  Smart Data will supply such information, based on the advice of counsel, that Smart Data is legally required to supply.\n\nLINKS\n\nThe Site may contain links to other websites, chat rooms, or other resources that we provide for your convenience (“Linked Sites”).  Linked Sites are not under the control of Smart Data, and Smart Data is not responsible for the content available on any Linked Site.  Such links do not imply Smart Data’s endorsement of material on any Linked Site, and Smart Data expressly disclaims all liability with regard to your access to such Linked Sites.  Access to any Linked Site is at your own risk.\n\nOUR COMMITMENT TO DATA SECURITY\n\nWe use industry standard practices designed to safeguard the confidentiality of your personal information and personal information about your children.  To prevent unauthorized access, maintain data accuracy, and ensure the correct use of such information, we have put in place physical, electronic, and managerial procedures designed to safeguard and secure the personal information we collect.  We also use 128-bit Secure Sockets Layer (SSL) protocol to protect information when route between your browser and Smart Data’s server and when in route between Smart Data’s server and another other browser or server.\n\nPersonal information residing on Smart Data’s servers is password-protected, and access is provided only to those employees of Smart Data who require such access to administer and maintain our Site or to provide requested customer support to users of the Site.  Each Smart Data employee who has access to the data residing on our servers has agreed in writing to respect the privacy of all such personal information.\n\nCHANGES IN CORPORATE STRUCTURE\n\nNotwithstanding any other provision of this Privacy Policy, any information Smart Data receives from you or from third parties is an asset of Smart Data and may be transferred if all or part of Smart Data is sold, merged, consolidated or otherwise transferred to another entity as part of that transaction or process.  Should such a sale, merger, or transfer occur, Smart Data will give users reasonable notice and an opportunity to remove personal information from the Site.  In any event, Smart Data will take steps to ensure that the transferee will use personal information in a manner consistent with and will otherwise abide by the version of the Smart Data Privacy Policy under which it was collected.  FERPA protects your children’s educational records in the event of such a transaction.\n\nYOUR CHOICES\n\nWe offer you the following choices about what information we collect from you and how we communicate with you:\n\nCookies.  You have the ability to accept or decline cookies.  Most web browsers automatically accept cookies, but you can usually modify your browser setting to decline cookies if you prefer.  If, however, you choose to decline cookies, you may not be able to fully experience the interactive features of our Site or have some of our services on the Site function properly.\n\nMarketing Emails.  If we have sent you a marketing email, you may choose not to receive additional marketing emails from us by following the unsubscribe instructions contained in each email.\n\nWeb Analytics.  We want to process as little personal information as possible when you use our website. That’s why we’ve chosen Fathom Analytics for our website analytics, which doesn’t use cookies and complies with the GDPR, ePrivacy (including PECR), COPPA and CCPA. Using this privacy-friendly website analytics software, your IP address is only briefly processed, and we (running this website) have no way of identifying you. As per the CCPA, your personal information is de-identified. You can read more about this on Fathom Analytics’ website. The purpose of us using this software is to understand our website traffic in the most privacy-friendly way possible so that we can continually improve our website and business. The lawful basis as per the GDPR is “Article 6(1)(f); where our legitimate interests are to improve our website and business continually.” As per the explanation, no personal data is stored over time.\n\nMODIFYING, CORRECTING, OR DELETING YOUR INFORMATION\n\nYou may update, otherwise modify or delete any personal information you previously provided on the Site by logging onto the Site and accessing either your user profile or an application containing the information you want to change.  Please note that if you delete information, it will no longer be available on the Site.\n\nIf you are unable to change your personal information as provided above, wish to delete or modify personal information provided to Smart Data by third parties, or wish to delete your account from the Smart Data system, you may email us at support@classretriever.com.\n\nCHILDREN UNDER THE AGE OF 13\n\nThe Site is not directed to children under the age of 13 and does not permit registration by, and will not knowingly collect or use personal information from, anyone under 13 years of age.  We require users to be at least 13 years of age to use the Site.  If we learn we have collected or received personal information from a child under the age of 13, we will delete that information.  If you believe we might have any information from or about a child under the age of 13, please contact us at support@classretriever.com.\n\nCHANGES TO THE PRIVACY POLICY\n\nWe will occasionally amend this Privacy Policy to reflect company and customer feedback. We reserve the right to change, modify, add, or remove portions of this Privacy Policy at any time.  If Smart Data materially changes its use of your or your children’s personal information, we will announce such a change on our Site and will also note it in this Privacy Policy, and we will provide you with an opportunity to opt out of such new or different use.  The effective date of this Privacy Policy is documented at the beginning of the Privacy Policy.  You are responsible for periodically reviewing the Site and this Privacy Policy to check for any updates or changes.\n\nENFORCEMENT\n\nSmart Data is committed to ensuring the integrity and security of user information. Smart Data reserves the right to pursue all legal remedies available to it in the event that its security measures and/or this Privacy Policy is breached, including but not limited to pursuit of all criminal and civil law enforcement proceedings available as of the occurrence of any breach.  Should you believe that your data has been released or used in a way that is contrary to your rights or this Privacy Policy, please contact us at support@classretriever.com.\n\nCONTACT US\n\nIf you have any questions about Smart Data’s Privacy Policy, please contact us in writing at support@classretriever.com or at:\n\nClass Retriever\n2726 Bancroft Street\nMissoula, MT  59801',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 25.0)),
                                                ),
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
