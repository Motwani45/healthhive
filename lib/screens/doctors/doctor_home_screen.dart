import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gsapp/models/job_model.dart';
import 'package:gsapp/providers/firebase/auth/auth_provider.dart';
import 'package:gsapp/providers/firebase/job/job_firebase.dart';
import 'package:gsapp/screens/auth/login_screen.dart';
import 'package:gsapp/screens/doctors/create_job_screen.dart';
import 'package:gsapp/screens/job_widget.dart';
import 'package:gsapp/theme/app_decoration.dart';
import 'package:gsapp/theme/app_style.dart';
import 'package:gsapp/utils/color_constants.dart';
import 'package:gsapp/utils/firebase_utils.dart';
import 'package:gsapp/utils/size_utils.dart';
import 'package:gsapp/widgets/app_logo.dart';
import 'package:provider/provider.dart';

class DoctorHomeScreen extends StatelessWidget {
  static const routeName = '/doctor_home_screen';
  final FirebaseAuth auth=FirebaseAuth.instance;
  final JobFirebase jobFirebase=JobFirebase();
  final CommonUtils utils=CommonUtils();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            bottomNavigationBar: ConvexAppBar(
              onTap: (int idx){
                Navigator.pushNamed(context, CreateJobScreen.routeName).then((value) => null);
              },
              backgroundColor: ColorConstant.greenA400,
              height: MediaQuery.of(context).size.height*0.06,
              items: [
                TabItem(
                  icon: Icons.add,
                  title: "Home",
                ),
              ],
            ),
            backgroundColor: ColorConstant.gray900,
            body: Container(
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: AppLogo(),
                    ),
                    GestureDetector(
                      onTap: ()async{
                        await Provider.of<AuthProvider>(context,listen:false).logOut();
                        Navigator.pushNamedAndRemoveUntil(context, LoginScreen.routeName, (route) => false);
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Text("Log Out",style: TextStyle(color: Colors.white),),
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Container(
                    padding: getPadding(
                      left: 16,
                      top: 22,
                      right: 16,
                    ),
                    decoration: AppDecoration.white.copyWith(
                      borderRadius: BorderRadiusStyle.customBorderTL30,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Jobs created",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtManropeBold2125Black900,
                        ),
                        SizedBox(height: 10,),
                        Expanded(
                          child: StreamBuilder<List<JobModel>>(
                            stream: jobFirebase.getJobs(auth.currentUser!.uid),
                            builder: (buildContext,snapshot) {
                              if(snapshot.connectionState==ConnectionState.waiting){
                                // utils.showLoaderDialog(context, "Fetching Your Jobs Details");
                                return const Center(child: CircularProgressIndicator(),);
                              }
                              // utils.dismissDialog(context);
                              List<JobModel>? jobs=snapshot.data;
                              if(jobs==null||jobs.length==0){
                                return const Center(child: Text("No Job Posted Till Now!"),);
                              }
                              return ListView.separated(
                                shrinkWrap: true,
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    height: getVerticalSize(
                                      30,
                                    ),
                                  );
                                },
                                itemCount: jobs.length,
                                itemBuilder: (context, index) {
                                  return JobWidget(jobs[index],1);
                                },
                              );
                            }
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            )));
  }
}
