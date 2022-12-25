import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gizmo/home/saved/saved_scan_results.dart';
import 'package:gizmo/home/scanning/scan_results.dart';
import 'package:table_sticky_headers/table_sticky_headers.dart';

import '/home/blocs/blocs.dart';

class ScanView extends StatefulWidget {
  const ScanView({super.key});

  @override
  State<ScanView> createState() => _ScanViewState();
}

class _ScanViewState extends State<ScanView> with TickerProviderStateMixin {
  late TabController _tabController;
  late AnimationController _animationController;

  // Initial State of the Scan View Starts with a Tab Controller
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _animationController = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScanBloc, ScanState>(
      builder: (context, state) {
        return Expanded(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    TabBar(
                      controller: _tabController,
                      tabs: [
                        Tab(text: "Scan Results"),
                        Tab(text: "Pointer Results"),
                        Tab(icon: Icon(Icons.directions_bike))
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          Container(
                            color: Colors.white,
                            child: ScanResults(),
                          ),
                          Icon(Icons.control_point),
                          SvgPicture.asset('assets/images/hamster.svg'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 16),
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: IconButton(
                                onPressed: () => {},
                                color: Colors.green,
                                icon: const Icon(Icons.play_arrow)),
                            suffixIcon: IconButton(
                              color: Colors.lightBlueAccent,
                              icon: Icon(Icons.cancel),
                              onPressed: () {
                                print("Cancel icon activated.");
                              },
                            ),
                            label: const Text("Manual Scan"),
                            border: const OutlineInputBorder(),
                            hintText: 'Enter value',
                          ),
                          onSubmitted: (String? value) {
                            context.read<ScanBloc>().add(ManualScanEvent(value!));
                          },
                        ),
                      ),
                    ),
                    DropdownButton<String>(
                      value: context.read<ScanBloc>().selectedDataType,
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String? value) {
                        // Called when use selects data type.
                        context
                            .read<ScanBloc>()
                            .add(SelectDataTypeEvent(value!));
                      },
                      items: dataTypes
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 20,),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                        child: SavedScanResults(),
                      ),
                    ),
                    const SizedBox(height: 40,),
                  ],
                ),
              ),
              // TODO: Implement Hex Editor Widget
              // BlocBuilder<HexBloc, HexState>(builder: (context, state) {
              //   return Expanded(
              //     child: Container(
              //       color: Colors.grey,
              //       child: StickyHeadersTable(
              //         initialScrollOffsetX: _scrollOffsetX,
              //         initialScrollOffsetY: _scrollOffsetY,
              //         onEndScrolling: (scrollOffsetX, scrollOffsetY) {
              //           _scrollOffsetX = scrollOffsetX;
              //           _scrollOffsetY = scrollOffsetY;
              //         },
              //         columnsLength: titleColumn.length,
              //         rowsLength: titleRow.length,
              //         columnsTitleBuilder: (i) => Text(titleColumn[i]),
              //         rowsTitleBuilder: (i) => Text(titleRow[i]),
              //         contentCellBuilder: (i, j) => Text(data[i][j]),
              //       ),
              //     ),
              //   );
              // }),
            ],
          ),
        );
      },
    );
  }
}

var dataTypes = ["Integer", "Float", "Double", "String", "Byte", "Short"];

// ** Temporary variables for testing ** //
double _scrollOffsetX = 0.0;
double _scrollOffsetY = 0.0;
var titleColumn = ["col 0", "col 1", "col 2"];
var titleRow = ["row 0"];
var data = [
  ["0"],
  ["1"],
  ["2"],
  ["3"],
  ["4"],
  ["5"],
  ["6"],
  ["7"],
  ["8"],
  ["9"],
  ["1"],
  ["2"],
  ["3"],
  ["1"],
  ["2"],
  ["3"]
];
