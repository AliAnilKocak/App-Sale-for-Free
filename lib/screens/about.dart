import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UserSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: UserSettingsState());
  }
}

class UserSettingsState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double verticalMargin = 30;
    return SingleChildScrollView(
      child: Division(
        style: StyleClass()
          ..margin(vertical: verticalMargin, horizontal: 20)
          ..minHeight(
              MediaQuery.of(context).size.height - (2 * verticalMargin)),
        child: Column(
          children: <Widget>[
            Settings(),
          ],
        ),
      ),
    );
  }
}

class ActionsRow extends StatelessWidget {
  Widget _buildActionsItem(String title, IconData icon) {
    return Division(
      style: actionsItemStyle,
      child: Column(
        children: <Widget>[
          Division(
            style: actionsItemIconStyle,
            child: Icon(
              icon,
              size: 20,
              color: Color(0xFF42526F),
            ),
          ),
          Text(
            title,
            style: actionsItemTextStyle,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        _buildActionsItem('Wallet', Icons.attach_money),
        _buildActionsItem('Delivery', Icons.card_giftcard),
        _buildActionsItem('Message', Icons.message),
        _buildActionsItem('Service', Icons.room_service),
      ],
    );
  }

  final StyleClass actionsItemIconStyle = StyleClass()
    ..alignChild('center')
    ..width(50)
    ..height(50)
    ..margin(bottom: 5)
    ..borderRadius(all: 30)
    ..backgroundColor('#F6F5F8');

  final StyleClass actionsItemStyle = StyleClass()..margin(vertical: 20.0);

  final TextStyle actionsItemTextStyle =
      TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 12);
}

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Division(
      style: settingsStyle,
      child: Column(
        children: <Widget>[
          SettingsItem(Icons.apps, '#8D7AEE', 'App Sales & Free App',
              '© 2018-2019 CaleSoftware'),
          SettingsItem(Icons.verified_user, '#F468B7', 'Version', '1.0.0'),
          GestureDetector(
            onTap: () async {
              print("tıklandı");
              // launch(
              //     "mailto:salesapp@coolflutter.com?subject=App Sales & Free App Feedback&body=");
            },
            child: SettingsItem(
                Icons.feedback, '#FEC85C', 'Feedback', 'Give us your feedback'),
          ),
          SettingsItem(Icons.rate_review, '#5FD0D3', 'Rate Our App',
              'Rate us at the Play Store'),
        ],
      ),
    );
  }

  final StyleClass settingsStyle = StyleClass();
}

class SettingsItem extends StatefulWidget {
  final IconData icon;
  final String iconBgColor;
  final String title;
  final String description;

  SettingsItem(this.icon, this.iconBgColor, this.title, this.description);

  @override
  _SettingsItemState createState() => _SettingsItemState();
}

class _SettingsItemState extends State<SettingsItem> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return Division(
        style: settingsItemStyle
          ..elevation(pressed ? 0 : 50, color: Colors.grey)
          ..scale(pressed ? 0.95 : 1.0),
        gesture: GestureClass()
          ..onTapDown((details) {
            launch(
                "https://play.google.com/store/apps/details?id=com.cale.appsales");
          })
          ..onTapUp((details) => print("asdasd"))
          ..onTapCancel(() => print("asdasd")),
        child: Row(
          children: <Widget>[
            Division(
              style: StyleClass()
                ..backgroundColor(widget.iconBgColor)
                ..add(settingsItemIconStyle),
              child: Icon(
                widget.icon,
                color: Colors.white,
                size: 20,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.title,
                  style: itemTitleTextStyle,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  widget.description,
                  style: itemDescriptionTextStyle,
                ),
              ],
            )
          ],
        ));
  }

  final StyleClass settingsItemStyle = StyleClass()
    ..alignChild('center')
    ..height(70)
    ..margin(vertical: 10)
    ..borderRadius(all: 15)
    ..backgroundColor('#ffffff')
    ..ripple(true)
    ..animate(300, Curves.easeOut);

  final StyleClass settingsItemIconStyle = StyleClass()
    ..margin(left: 15)
    ..padding(all: 12)
    ..borderRadius(all: 30);

  final TextStyle itemTitleTextStyle =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 16);

  final TextStyle itemDescriptionTextStyle = TextStyle(
      color: Colors.black26, fontWeight: FontWeight.bold, fontSize: 12);
}
