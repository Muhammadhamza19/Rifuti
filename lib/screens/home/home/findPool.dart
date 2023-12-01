import 'dart:async';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pool/OrderMapBloc/order_map_bloc.dart';
import 'package:go_pool/OrderMapBloc/order_map_state.dart';
import 'package:go_pool/components/widgets/colorButton.dart';
import 'package:go_pool/components/widgets/entry_field.dart';
import 'package:go_pool/language/locale.dart';
import 'package:go_pool/map_utils.dart';
import 'package:go_pool/screens/home/riderProviders.dart';
import 'package:go_pool/theme/colors.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FindPool extends StatelessWidget {
  bool isFindPool;

  FindPool(this.isFindPool);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrderMapBloc>(
      create: (context) => OrderMapBloc()..loadMap(),
      child: FindPoolBody(isFindPool),
    );
  }
}

class FindPoolBody extends StatefulWidget {
  bool isFindPool;

  FindPoolBody(this.isFindPool);

  @override
  _FindPoolBodyState createState() => _FindPoolBodyState();
}

class _FindPoolBodyState extends State<FindPoolBody> {
  List days = ['MO', 'TU', 'WE', 'TH', 'FR', 'SA', 'SU'];
  List<String> seats = [
    "1 Seat",
    "2 Seat",
    "3 Seat",
    "4 Seat",
  ];
  List<String> cars = [
    "Hatchback",
    "Sedan",
    "SUV",
    "4x4",
  ];
  int dayIndex = 0;
  String? seat = '1 Seat';
  String? car = 'Hatchback';
  Completer<GoogleMapController> _mapController = Completer();
  GoogleMapController? mapStyleController;
  Set<Marker> _markers = {};

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: BlocBuilder<OrderMapBloc, OrderMapState>(
                builder: (context, state) {
              print('polyyyy' + state.polylines.toString());
              return GoogleMap(
                polylines: state.polylines,
                mapType: MapType.normal,
                initialCameraPosition: kGooglePlex,
                markers: _markers,
                onMapCreated: (GoogleMapController controller) async {
                  _mapController.complete(controller);
                  mapStyleController = controller;
                  mapStyleController!.setMapStyle(mapStyle);
                  setState(() {
                    _markers.add(
                      Marker(
                        markerId: MarkerId('mark1'),
                        position: LatLng(37.42796133580664, -122.085749655962),
                        icon: markerss.first,
                      ),
                    );
                    _markers.add(
                      Marker(
                        markerId: MarkerId('mark2'),
                        position: LatLng(37.42496133180663, -122.081743655960),
                        icon: markerss[0],
                      ),
                    );
                  });
                },
              );
            }),
          ),
          FadedSlideAnimation(
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 50),
                  width: MediaQuery.of(context).size.width,
                  height: 342,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 50,
                        width: 304,
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            color: primaryColor.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(50)),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  widget.isFindPool = true;
                                });
                              },
                              child: Container(
                                height: 50,
                                width: 150,
                                decoration: BoxDecoration(
                                    color: widget.isFindPool
                                        ? Colors.white
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Center(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.drive_eta,
                                        color: !widget.isFindPool
                                            ? Color(0xff80ffffff)
                                            : primaryColor,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        locale.findPool!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 13,
                                                color: widget.isFindPool
                                                    ? Color(0xff4d4d4d)
                                                    : Color(0xff80ffffff)),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  widget.isFindPool = false;
                                });
                              },
                              child: Container(
                                height: 50,
                                width: 150,
                                decoration: BoxDecoration(
                                    color: widget.isFindPool
                                        ? Colors.transparent
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Center(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.escalator_warning_outlined,
                                        color: widget.isFindPool
                                            ? Color(0xff80ffffff)
                                            : primaryColor,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        locale.offerPool!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                                color: !widget.isFindPool
                                                    ? Color(0xff4d4d4d)
                                                    : Color(0xff80ffffff)),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            beginOffset: Offset(0, 0.4),
            endOffset: Offset(0, 0),
            slideCurve: Curves.linearToEaseOut,
          ),
          FadedSlideAnimation(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 312,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    TextEntryField(
                      prefixIcon: Icon(
                        Icons.circle,
                        color: primaryColor,
                        size: 17,
                      ),
                      initialValue: "1024, Central Park, Hemilton, New York",
                    ),
                    TextEntryField(
                      prefixIcon: Icon(
                        Icons.location_on,
                        color: Colors.red,
                        size: 17,
                      ),
                      initialValue: "M141, Food Center, Hemilton, Illinois",
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextEntryField(
                            prefixIcon: Icon(
                              Icons.calendar_today,
                              color: Colors.grey,
                              size: 17,
                            ),
                            initialValue: "25 Jun, 10:30 am",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(end: 10),
                          child: Icon(
                            Icons.drive_eta,
                            color: Colors.grey,
                            size: 17,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: DropdownButton<String>(
                            iconSize: 25,
                            itemHeight: 57,
                            // isDense: true,
                            value: widget.isFindPool ? seat : car,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontSize: 13.5),
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: Colors.grey,
                            ),
                            items: widget.isFindPool
                                ? seats.map<DropdownMenuItem<String>>(
                                    (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList()
                                : cars.map<DropdownMenuItem<String>>(
                                    (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                            onChanged: (String? value) {
                              setState(() {
                                if (widget.isFindPool)
                                  seat = value;
                                else
                                  car = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 10),
                          child: Row(
                            children: [
                              Icon(
                                Icons.repeat,
                                color: Colors.grey,
                                size: 17,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Container(
                                  height: 20,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 7,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            dayIndex = index;
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Text(
                                            days[index],
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .copyWith(
                                                    fontSize: 13.5,
                                                    color: index == dayIndex
                                                        ? primaryColor
                                                        : Colors.grey[500]),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.grey[400],
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RideProviders(
                                      widget.isFindPool ? true : false)));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: FadedScaleAnimation(
                            child: ColorButton(widget.isFindPool
                                ? locale.findPool
                                : locale.offerPool),
                            scaleDuration: const Duration(milliseconds: 600),
                          ),
                        )),
                    SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
            ),
            beginOffset: Offset(0, 0.4),
            endOffset: Offset(0, 0),
            slideCurve: Curves.linearToEaseOut,
          ),
        ],
      ),
    );
  }
}
