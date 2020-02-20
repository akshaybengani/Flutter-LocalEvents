import 'package:flutter/material.dart';
import 'package:local_events/app_state.dart';
import 'package:local_events/model/category.dart';
import 'package:local_events/model/event.dart';
import 'package:local_events/styleguide.dart';
import 'package:local_events/ui/homepage/category_widget.dart';
import 'package:provider/provider.dart';

import 'home_page_background.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ChangeNotifierProvider<AppState>(
        create: (_) => AppState(),
        child: Stack(
          // Stack is used to place one widget on another
          children: <Widget>[
            HomePageBackground(
              // This will return the size of the device screen
              screenHeight: MediaQuery.of(context).size.height,
            ),
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Local Events',
                            style: fadedTextStyle,
                          ),
                          Spacer(),
                          Icon(
                            Icons.person_outline,
                            color: Color(0x99FFFFFF),
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Text(
                        "What's Up",
                        style: whiteHeadingTextStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: Consumer<AppState>(
                        builder: (context, appState, _) =>
                            SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: <Widget>[
                              // This will load the CategoryWidget to the number of times with category data
                              for (final category in categories)
                                CategoryWidget(category)
                            ],
                          ),
                        ),
                      ),
                    ),
                    
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
