import 'package:chilli/ui/constants.dart';
import 'package:chilli/ui/pages/matches.dart';
import 'package:chilli/ui/pages/messages.dart';
import 'package:chilli/ui/pages/search.dart';
import 'package:flutter/material.dart';

class Tabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    List<Widget> pages = [
      Search(),
      Matches(),
      Messages()
    ];

    return Theme(
      data: ThemeData(
        primaryColor: backgroundColor,
        accentColor: Colors.white
      ),
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'ObooNy',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold
              ),
            ),
            actions: [
              IconButton(
                  icon: Icon(
                    Icons.exit_to_app
                  ),
                  onPressed: (){}
              )
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(48.0),
              child: Container(
                height: 48.0,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TabBar(
                      tabs: [
                        Tab(icon: Icon(Icons.search),),
                        Tab(icon: Icon(Icons.people),),
                        Tab(icon: Icon(Icons.message),),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: pages,
          ),
        ),
      ),
    );
  }
}
