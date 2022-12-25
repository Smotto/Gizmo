import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlaygroundView extends StatefulWidget {
  const PlaygroundView({super.key});


  @override
  State<PlaygroundView> createState() => _PlaygroundViewState();
}

class _PlaygroundViewState extends State<PlaygroundView> with TickerProviderStateMixin{
  late TabController _tabController;

  // Initial State of the Scan View Starts with a Tab Controller
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        children: [
          Container(
            child: TabBar(
              controller: _tabController,
              tabs:  [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike))
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children:
               [
                SvgPicture.asset('assets/images/github.svg'),
                Icon(Icons.directions_transit),
                Icon(Icons.directions_bike),
              ],
            ),
          ),
        ],
      ),
    );
  }
}