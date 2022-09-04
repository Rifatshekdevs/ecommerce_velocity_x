import 'package:ecommerce_app_demo/src/config/constants.dart';
import 'package:ecommerce_app_demo/src/config/ktext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: AppColors.bgColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                color: AppColors.bgColor,
                ),
                accountName: KText(text: 'Sheikh Rifat',color: AppColors.scaffoldBackgroundColor,), 
                accountEmail: KText(text: 'sheikhrifat289@gmail.com',color: AppColors.scaffoldBackgroundColor,),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/user/proifile.jpeg'),
                )
                )
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.home,
                  color: AppColors.scaffoldBackgroundColor,
                ),
                title: Text('Home',textScaleFactor: 1.2, style: TextStyle(color: AppColors.scaffoldBackgroundColor,),),
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.profile_circled,
                  color: AppColors.scaffoldBackgroundColor,
                ),
                title: Text('Profile',textScaleFactor: 1.2, style: TextStyle(color: AppColors.scaffoldBackgroundColor,),),
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.mail,
                  color: AppColors.scaffoldBackgroundColor,
                ),
                title: Text('Email me',textScaleFactor: 1.2, style: TextStyle(color: AppColors.scaffoldBackgroundColor,),),
              ),
          ],
        ),
      ),
    );
  }
}