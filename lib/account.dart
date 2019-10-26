import 'package:flutter/material.dart';
import 'constants.dart';

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
            children: settingItems.fold(
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
        child: Text('Reset password'),
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
      minWidth: 240,
    );
  }
}

class DeleteAccountButton extends StatelessWidget {
  Widget build(BuildContext context) {
    return ButtonTheme(
      child: RaisedButton(
        child: Text('Delete account'),
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
      minWidth: 240,

    );
  }
}

class SettingItem extends StatelessWidget {
  final String settingKey;
  final String settingValue;

  SettingItem(this.settingKey, this.settingValue);

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(settingKey, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
          Text(settingValue, style: TextStyle(fontSize: 16)),
        ],
        crossAxisAlignment: CrossAxisAlignment.start
      ),
      margin: EdgeInsets.all(16)
    );
  }

  static List<SettingItem> get mock {
    return [
      SettingItem('First name', 'Brecht'),
      SettingItem('Last name', 'Horsten'),
      SettingItem('Email address', 'brecht.horsten@quivr.be'),
      SettingItem('Language', 'English'),
    ];
  }
}
