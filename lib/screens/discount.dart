import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_icons/feather.dart';
import 'package:salesapp/API.dart';
import 'package:salesapp/common/colors.dart';
import 'package:salesapp/models/app.dart';
import 'package:url_launcher/url_launcher.dart';

class Discount extends StatefulWidget {
  @override
  _DiscountState createState() => _DiscountState();
}

class _DiscountState extends State<Discount> {
  var appsDisco = new List<AppModel>();

  _getAppsDisco() {
    //henüz aktif değil. İndirimli olanlar görüntülenecek.
    API.getApps("http://coolflutter.com/appsales/discount.php").then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        appsDisco = list.map((model) => AppModel.fromJson(model)).toList();
      });
    });
  }

  initState() {
    super.initState();

    _getAppsDisco();
  }

  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(top:8.0),
        child: ListView.builder(
          itemCount: appsDisco.length,
          itemBuilder: (context, index) {
            return itemBuild(context, index);
          },
        ),
      ),
    );
  }

  Widget itemBuild(context, index) {
    return ListTile(
      onTap: () async {
        _launchURL(appsDisco[index].link);
      },
      subtitle: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: <Widget>[
            Text(
              appsDisco[index].priceOld,
              style: TextStyle(decoration: TextDecoration.lineThrough),
            ),
            Text(
              " " + appsDisco[index].priceNew,
              style: TextStyle(color: colorAppYellow, fontSize: 15),
            ),
          ],
        ),
      ),
      trailing: IconButton(
        onPressed: () async {
          _launchURL(appsDisco[index].link);
        },
        icon: Icon(
          Feather.getIconData("download-cloud"),
          color: colorAppOrange,
        ),
      ),
      leading: CircleAvatar(
        child: Image.network(appsDisco[index].icon),
      ),
      title: Text(appsDisco[index].name),
    );
  }
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
