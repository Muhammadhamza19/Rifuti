import 'dart:async';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_pool/OrderMapBloc/order_map_bloc.dart';
import 'package:go_pool/OrderMapBloc/order_map_state.dart';
import 'package:go_pool/components/widgets/entry_field.dart';
import 'package:go_pool/language/locale.dart';
import 'package:go_pool/map_utils.dart';
import 'package:go_pool/screens/home/home/findPool.dart';
import 'package:go_pool/screens/home/selectLocation.dart';
import 'package:go_pool/theme/colors.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrderMapBloc>(
      create: (context) => OrderMapBloc()..loadMap(),
      child: HomeBody(),
    );
  }
}

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  bool locationSelected = false;
  bool isFindPool = true;
  Completer<GoogleMapController> _mapController = Completer();
  GoogleMapController? mapStyleController;
  Set<Marker> _markers = {};

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: BlocBuilder<OrderMapBloc, OrderMapState>(
              builder: (context, state) {
            print('polyyyy' + state.polylines.toString());
            return GoogleMap(
              markers: _markers,
              mapType: MapType.normal,
              initialCameraPosition: kGooglePlex,
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
                });
              },
            );
          }),
        ),
        FadedSlideAnimation(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 225,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(20)),
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
                          color: primaryColor.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(50)),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isFindPool = true;
                              });
                            },
                            child: Container(
                              height: 50,
                              width: 150,
                              decoration: BoxDecoration(
                                  color: isFindPool
                                      ? Colors.white
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(50)),
                              child: Center(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.drive_eta,
                                        color: !isFindPool
                                            ? Color(0xff80ffffff)
                                            : primaryColor),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      locale.findPool!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                              fontSize: 13.5,
                                              fontWeight: FontWeight.w600,
                                              color: isFindPool
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
                                isFindPool = false;
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FindPool(false)));
                            },
                            child: Container(
                              height: 50,
                              width: 150,
                              decoration: BoxDecoration(
                                  color: isFindPool
                                      ? Colors.transparent
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(50)),
                              child: Center(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.nature_people,
                                      color: isFindPool
                                          ? Color(0xff80ffffff)
                                          : primaryColor,
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
                                              fontWeight: FontWeight.w600,
                                              fontSize: 13.5,
                                              color: !isFindPool
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
              Container(
                width: MediaQuery.of(context).size.width,
                height: 145,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SelectLocation()));
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      TextEntryField(
                        prefixIcon: Icon(
                          Icons.circle,
                          color: primaryColor,
                          size: 15,
                        ),
                        hint: locale.pickupLocation,
                        initialValue: "1024, Central Park, New York",
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          cursorColor: primaryColor,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SelectLocation()));
                          },
                          autofocus: false,
                          readOnly: true,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontSize: 13.5),
                          minLines: 1,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.location_on,
                              color: Colors.red,
                              size: 20,
                            ),
                            hintText: locale.dropLocation,
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.grey, fontSize: 13.5),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[200]!),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[200]!),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[200]!),
                            ),
                            counter: Offstage(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          beginOffset: Offset(0, 0.4),
          endOffset: Offset(0, 0),
          slideCurve: Curves.linearToEaseOut,
        ),
        Positioned(
          right: 20,
          bottom: 245,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(
              Icons.gps_fixed,
              color: Colors.grey[400],
            ),
          ),
        ),
      ],
    );
  }
}
