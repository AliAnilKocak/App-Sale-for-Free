
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_icons/feather.dart';
import 'package:salesapp/API.dart';
import 'package:salesapp/common/colors.dart';
import 'package:salesapp/models/app.dart';
import 'package:url_launcher/url_launcher.dart';

class NowFree extends StatefulWidget {
  @override
  _NowFreeState createState() => _NowFreeState();
}

class _NowFreeState extends State<NowFree> {
  var apps = new List<AppModel>();
  var appsDisco = new List<AppModel>();


  _getApps() {
    //Bedava olanlar görüntülenecek.
    API.getApps("http://coolflutter.com/appsales/freenow.php").then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        apps = list.map((model) => AppModel.fromJson(model)).toList();
      });
    });
  }

  initState() {
    super.initState();
    _getApps();
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
          itemCount: apps.length,
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
        _launchURL(apps[index].link);
      },
      subtitle: Padding(
        padding: const EdgeInsets.symmetric(vertical:12.0),
        child: Row(
          children: <Widget>[
            Text(apps[index].priceOld,style: TextStyle(decoration: TextDecoration.lineThrough),),
            Text(" "+apps[index].priceNew,style: TextStyle(color: colorAppYellow,fontSize: 15),),
        
          ],
        ),
      ),
      trailing: IconButton(
        onPressed: () async {
          _launchURL(apps[index].link);
        },
        icon: Icon(
          Feather.getIconData("download-cloud"),
          color: colorAppOrange,
        ),
      ),
      leading: CircleAvatar(
        child: Image.network(apps[index].icon),
      ),
      title: Text(apps[index].name),
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
