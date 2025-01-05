import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_companion/core/utils/nav_manager.dart';
import 'package:travel_companion/screens/view_handler/views/change_pass_screen.dart';
import 'package:travel_companion/widgets/dialogs/custom_dialog.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
              child: Text("Account",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            CupertinoListSection.insetGrouped(
              margin: const EdgeInsets.all(2),
              backgroundColor: const Color(0xFFF6F8F9),
              
              children: [
                CupertinoListTile(
                  leading: SvgPicture.asset(
                    'assets/icons/pass.svg',
                    height: 20,
                    width: 20,
                  ),
                  title: const Text(
                    'Change password',
                    style: TextStyle(fontFamily: 'Lexend'),
                  ),
                  onTap: () {
                    NavManager.goTo(const ChangePassPage());
                  },
                  trailing: const CupertinoListTileChevron(),
                ),
                CupertinoListTile(
                  leading: const Icon(Icons.power_settings_new_rounded),
                  title: const Text(
                    'Logout',
                    style: TextStyle(fontFamily: 'Lexend'),
                  ),
                  onTap: () {
                    MyDialog.show(
                        context: context,
                        onTap: () {},
                        title: "Logout",
                        message: "Are you sure you want to logout?",
                        buttonTitle: "Logout",
                        isLogin: false);
                  },
                ),
                CupertinoListTile(
                  leading: SvgPicture.asset(
                    'assets/icons/bin.svg',
                  ),
                  title: const Text(
                    'Delete account',
                    style: TextStyle(fontFamily: 'Lexend'),
                  ),
                  onTap: () {
                    MyDialog.show(
                        context: context,
                        onTap: () {},
                        title: "Delete Account",
                        message: "This action is irreversible. Are you sure?",
                        buttonTitle: "Delete",
                        isLogin: false);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
