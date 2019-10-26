import 'package:flutter/material.dart';
import 'package:appetite/constants.dart';
import 'package:appetite/types/account.dart';

class Account extends StatelessWidget {
  final List<SettingItem> settingItems = SettingItem.mock;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account settings'),
        backgroundColor: Color(Constants.kotszakske),
      ),
      body: Column(
        children: [
          Column(
            children: settingItems.map((settingItem) => SettingItemWidget(settingItem)).fold(
                [],
                (acc, item) => acc.length == 0 ? [item] : acc + [Divider(), item]
              ),
              crossAxisAlignment: CrossAxisAlignment.start
          ),
          Padding(padding: EdgeInsets.all(26)),
          ResetPasswordButton(),
          DeleteAccountButton()
        ]
      )
    );
  }
}

class ResetPasswordButton extends StatelessWidget {
  Widget build(BuildContext context) {
    return ButtonTheme(
      child: RaisedButton(
        child: Text('Reset password', style: TextStyle(color: Colors.white)),
        onPressed: () {
          showDialog(
            context: context,
            child: AlertDialog(
              title: Text('Alert'),
              content: Text('Password reset'),
            ),
          );
        },
        color: Color(Constants.kotszakske),
      ),
      minWidth: 270,
    );
  }
}

class DeleteAccountButton extends StatelessWidget {
  Widget build(BuildContext context) {
    return ButtonTheme(
      child: RaisedButton(
        child: Text('Delete account', style: TextStyle(color: Colors.white)),
          onPressed: () {
            showDialog(
              context: context,
              child: AlertDialog(
                title: Text('Alert'),
                content: Text('Account deleted'),
              ),
            );
          },
        color: Colors.red
      ),
      minWidth: 270,

    );
  }
}

class SettingItemWidget extends StatelessWidget {
  final SettingItem settingItem;

  SettingItemWidget(this.settingItem);

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(settingItem.settingKey, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
          Text(settingItem.settingValue, style: TextStyle(fontSize: 16)),
        ],
        crossAxisAlignment: CrossAxisAlignment.start
      ),
      margin: EdgeInsets.all(16)
    );
  }
}
