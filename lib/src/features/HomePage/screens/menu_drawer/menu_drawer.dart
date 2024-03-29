import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mark_it/src/features/HomePage/controllers/branchcontroller.dart';
import 'package:mark_it/src/features/HomePage/screens/admin_console/admin_console.dart';
import 'package:mark_it/src/features/HomePage/screens/announcment_screen/announcement_screen.dart';
import 'package:mark_it/src/features/HomePage/screens/semseter_screen/semester_screen.dart';
import 'package:mark_it/src/features/authentication/controllers/profile_controller.dart';
import 'package:mark_it/src/common_widgets/custom_eleveted_button.dart';
import 'package:mark_it/src/features/utils/theme/theme.dart';
import 'package:mark_it/src/repository/authentication_repository/authenitication_repo.dart';

class MenuDrawer extends StatefulWidget {
  MenuDrawer({super.key, required this.notifyParent, this.counter});

  final Function(int) notifyParent;
  final int? counter;


  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {

  final profilecontroller = Get.put(ProfileController());
  final branchcontroller = Get.put(BranchController());

  final firebaseuser=FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipOval(
                  child: SizedBox.fromSize(
                    size: Size.fromRadius(48), // Image radius
                    child: Image.network(firebaseuser!.photoURL.toString(), fit: BoxFit.cover),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Transform.scale(
                    scale: 0.8,
                    child: CupertinoSwitch(
                      value: branchcontroller.adminon,
                      onChanged: (value) {
                        setState(() {
                          int counterHolder = widget.counter ?? 0;
                          counterHolder=0;
                          widget.notifyParent(counterHolder);
                          branchcontroller.adminon = value;
                        });
                      },
                    ),
                  ),
                ),
                DropdownButton(


                  borderRadius: BorderRadius.circular(10),
                  value: branchcontroller.branch,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: branchcontroller.items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      int counterHolder = widget.counter ?? 0;
                      counterHolder=0;
                      widget.notifyParent(counterHolder);
                      branchcontroller.branch = newValue!;
                    });
                  },
                ),
                SizedBox(width: 10,),
              ],
            ),
            Text(firebaseuser!.displayName.toString(),
              style: TextStyle(fontSize: 35),
            ),
            Text(firebaseuser!.email.toString(),
              style: TextStyle(
                  fontSize: 15,
                  color: AppTheme.colors.lightgray
              ),
            ),
            Divider(color: AppTheme.colors.lightgray,),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          SemesterScreen(),
                    ));
              },
            ),
            ListTile(
              title: const Text('Announcements'),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          AnnouncementScreen(),
                    ));
              },
            ),
            ListTile(
              title: const Text('Admin console'),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                    builder: (BuildContext context) =>
                    AdminConsole(),
                    ));
              },
            ),
            Spacer(),
            CustomElevetedButtonDark(
                press: () {
                  AuthenticationRepository.instance.logout();
                },
                name: "Logout"),

          ],
        ),
      ),
    );
  }
}
