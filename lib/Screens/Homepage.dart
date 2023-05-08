
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../Service/dealerList.dart';
import '../Utils/app_baar.dart';
import 'DealerList Details.dart';


class DealerList extends StatefulWidget {
  const DealerList({Key? key}) : super(key: key);

  @override
  State<DealerList> createState() => _DealerListState();
}

class _DealerListState extends State<DealerList> {
  final TextEditingController searchdealer = TextEditingController();
  GlobalService globalService = GlobalService();
  // var currentIndex = 0;
  // List<Widget> pages = [   const DealerList() ,    const DealerList(),    const DealerList() ];

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;

    return Scaffold(
      // bottomNavigationBar: Container(
      //   margin: EdgeInsets.all(20),
      //   height: size.width * .155,
      //   decoration: BoxDecoration(
      //     color: Colors.white,
      //     boxShadow: [
      //       BoxShadow(
      //         color: Colors.black.withOpacity(.15),
      //         blurRadius: 30,
      //         offset: Offset(0, 10),
      //       ),
      //     ],
      //     borderRadius: BorderRadius.circular(50),
      //   ),
      //   child: ListView.builder(
      //     itemCount: 3, // change to 3
      //     scrollDirection: Axis.horizontal,
      //     padding: EdgeInsets.symmetric(horizontal: size.width * .024),
      //     itemBuilder: (context, index) => InkWell(
      //       onTap: () {
      //         setState(() {
      //           currentIndex = index;
      //         });
      //       },
      //       splashColor: Colors.transparent,
      //       highlightColor: Colors.transparent,
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           AnimatedContainer(
      //             duration: const Duration(milliseconds: 1500),
      //             curve: Curves.fastLinearToSlowEaseIn,
      //             margin: EdgeInsets.only(
      //               bottom: index == currentIndex ? 0 : size.width * .029,
      //               right: index == 1 ? 0 : size.width * .0422, // adjust margin for 2 icons
      //               left: index == 1 ? 0 : size.width * .0422,
      //             ),
      //             width: size.width * .235,
      //             height: index == currentIndex ? size.width * .014 : 0,
      //             decoration: const BoxDecoration(
      //               color: Colors.blueAccent,
      //               borderRadius: BorderRadius.vertical(
      //                 bottom: Radius.circular(10),
      //               ),
      //             ),
      //           ),
      //           Icon(
      //             listOfIcons[index],
      //             size: size.width * .076,
      //             color: index == currentIndex
      //                 ? Colors.blueAccent
      //                 : Colors.black38,
      //           ),
      //           SizedBox(height: size.width * .03),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),

      // bottomNavigationBar: Row(
      //     children: [
      //       InkWell(
      //           onTap: () {
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(builder: (context) => const DealerList()),
      //             );
      //           },
      //           child: Container(
      //             padding: EdgeInsets.all(15),
      //             width: 33.w,
      //             height: 6.8.h,
      //             color: ColorConstants.deppp,
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: [
      //                 // Text("Continue "),
      //                 Icon(
      //                   Icons.people,
      //                   color: Colors.white,
      //                   size: 40,
      //                 ),
      //               ],
      //             ),
      //           )),
      //
      //       InkWell(
      //           onTap: () {
      //
      //           },
      //           child: Container(
      //             padding: EdgeInsets.all(15),
      //             width: 33.w,
      //             height: 6.8.h,
      //             color: ColorConstants.primaryColor,
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: [
      //                 // Text("Continue "),
      //                 Icon(
      //                   Icons.list_rounded,
      //                   color: Colors.white,
      //                   size: 40,
      //                 ),
      //               ],
      //             ),
      //           )),
      //
      //       InkWell(
      //           onTap: () {
      //
      //           },
      //           child: Container(
      //             padding: EdgeInsets.all(15),
      //             width: 34.w,
      //             height: 6.8.h,
      //             color: ColorConstants.deppp,
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: [
      //                 // Text("Continue "),
      //                 Icon(
      //                   Icons.add_circle_outline,
      //                   color: Colors.white,
      //                   size: 40,
      //                 ),
      //               ],
      //             ),
      //           ))
      //
      //
      //     ]),

      appBar: AppBar(
        title: Text('Dealer List'),
        actions: [

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
          ),
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            onPressed: () {

            },
          )
        ],
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 213, 85, 40),


      ),
      drawer: show(),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 50,left: 10,right: 10),
          child: Column(
            children: [
              TextFormField(
                controller: searchdealer,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: const Icon(Icons.search),
                    hintText: 'Search',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
              Expanded(
                  child: FutureBuilder(
                    future: globalService.DealerListapi(),
                    builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                      if (!snapshot.hasData) {
                        return ListView.builder(
                            itemCount: 4,
                            itemBuilder: (context,index){
                              return Shimmer.fromColors(
                                  baseColor:Colors.grey.shade700 ,
                                  highlightColor: Colors.grey.shade100,
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Container(height: 10, width: 89, color: Colors.white,),
                                      )
                                    ],
                                  ));

                            });
                      }
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            String dealer = snapshot.data![index]['name'];
                            String dealerid = snapshot.data![index]['dealerid'];

                            if (searchdealer.text.isEmpty) {
                              return Column(
                                children: [
                                  Card(
                                    child: ListTile(
                                      title: Text(snapshot.data![index]['name'],style: const TextStyle(fontWeight: FontWeight.bold),),
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => DealerDetails(dealerid :dealerid)));
                                      },
                                    ),
                                  )
                                ],
                              );
                            } else if (dealer.toLowerCase().contains(searchdealer.text.toLowerCase())) {
                              return Column(
                                children: [
                                  Card(
                                    child: ListTile(
                                      title: Text(snapshot.data![index]['name'],style: const TextStyle(fontWeight: FontWeight.bold),),
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => DealerDetails(dealerid :dealerid )));

                                      },
                                    ),
                                  )
                                ],
                              );
                            } else {
                              return Container();
                            }
                          });
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
  // List<IconData> listOfIcons = [
  //   Icons.home_rounded,
  //   Icons.list,
  //   Icons.add_circle,
  // ];
}
