import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gsapp/models/job_model.dart';
import 'package:gsapp/providers/firebase/auth/auth_provider.dart';
import 'package:gsapp/providers/firebase/job/job_firebase.dart';
import 'package:gsapp/screens/auth/login_screen.dart';
import 'package:gsapp/screens/job_widget.dart';
import 'package:gsapp/theme/app_decoration.dart';
import 'package:gsapp/theme/app_style.dart';
import 'package:gsapp/utils/color_constants.dart';
import 'package:gsapp/utils/firebase_utils.dart';
import 'package:gsapp/utils/size_utils.dart';
import 'package:gsapp/widgets/app_logo.dart';
import 'package:provider/provider.dart';

class InternHomeScreen extends StatefulWidget {
  static const routeName = '/intern_home_screen';

  @override
  State<InternHomeScreen> createState() => _InternHomeScreenState();
}

class _InternHomeScreenState extends State<InternHomeScreen> {
  final FirebaseAuth auth=FirebaseAuth.instance;

  final JobFirebase jobFirebase=JobFirebase();

  final CommonUtils utils=CommonUtils();
  late Widget streamBuilder;
  int selectedIdx=0;

  @override
  void initState() {
    super.initState();
    streamBuilder=getStreamBuilder(0);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            bottomNavigationBar: ConvexAppBar(
              initialActiveIndex: selectedIdx,
              onTap: (int idx){
                if(idx==0) {
                  streamBuilder=getStreamBuilder(0);
                  selectedIdx=0;
                }
                else{
                  streamBuilder=getStreamBuilder(1);
                  selectedIdx=1;
                }
                setState(() {
                });

              },
              backgroundColor: ColorConstant.greenA400,
              height: MediaQuery.of(context).size.height*0.06,
              items: const [
                TabItem(
                  icon: Icons.home,
                  title: "Home",
                ),
                TabItem(
                  icon: Icons.task_alt,
                  title: "Applied",
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
                )
                ,Expanded(
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
                          selectedIdx==0?
                          "Jobs ":"Jobs Applied ",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtManropeBold2125Black900,
                        ),
                        SizedBox(height: 10,),
                        Expanded(
                          child:getStreamBuilder(selectedIdx),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            )));
  }

  Widget getStreamBuilder(int idx){
    return StreamBuilder<List<JobModel>>(
        stream: idx==1?jobFirebase.getAllAppliedJobs(auth.currentUser!.uid):jobFirebase.getAllJobs(auth.currentUser!.uid),
        builder: (buildContext,snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          }
          // utils.dismissDialog(context);
          List<JobModel>? jobs=snapshot.data;
          if(jobs==null||jobs.length==0){
            return Center(child: Text("No Job Posted Till Now!"),);
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
              return JobWidget(jobs[index],0);
            },
          );
        }
    );
  }
}
