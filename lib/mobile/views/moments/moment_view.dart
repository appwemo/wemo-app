import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;

import '../../../repository/moment_servics.dart';
import '../../model/moment_model/fetch_user_model.dart';
import '../../model/moment_model/like_moment_model.dart';
import '../../model/moment_model/moment_model.dart';
import '../../model/moment_model/profilepicture_model.dart';

class MomentResponse11 extends StatefulWidget {
  const MomentResponse11({super.key});

  @override
  State<MomentResponse11> createState() => _MomentResponseState();
}

class _MomentResponseState extends State<MomentResponse11> {
  var _img64;
  late final int id;
  late String hello = '';
  late String ya = '';
  String h = '';
  late String ok = h.toString();
  bool isLiked = false;
  bool isLoaded = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // _fetchUser();
    setState(() {
      // print('try');
      // print(ok.toString());
      // ye hello;
    });
  }

  @override
  Widget build(BuildContext context) {
    final iid;
    late String? ye = '';
    var ol;
    // ol = '42';
    h = '44';
    // Future<List<Images>> _futr = MomentServices().fetchTransport();
    Future<Moment1> _futr = MomentServices1().fetchMoment();
    // Future<FetchUser> _fetchUser = MomentServices1().fetchUsers(id: ol);

    // Future<AutoGenerate> _futureID = withoutList().fetchUser();

    return Scaffold(
        /* appBar: AppBar(
          backgroundColor: Colors.lime[800],
          centerTitle: true,
          title: Text("Moment"),
        ), */
        body: SafeArea(
            child: FutureBuilder<Moment1>(
                future: _futr,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('some eror ${snapshot.error}'),
                    );
                  }
                  if (snapshot.hasData) {
                    // ok = '3';
                    // FutureBuilder<FetchUser>(
                    //   builder: (context, snapshot) {
                    //     if (snapshot.hasData) {}

                    //     return Center(
                    //       child: CircularProgressIndicator(),
                    //     );
                    //   },
                    // );
                    return ListView.builder(
                        // scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        // physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.moments.length,
                        itemBuilder: (context, index) {
                          // snapshot.data!.moments.firstWhere((map) => {
                          //   var userName = snapshot1.data!.user.
                          // })
                          // var ok = snapshot1.data!.user.f
                          // hello =
                          //     ('${snapshot.data!.moments.firstWhere((element) => element.userId == snapshot1.data!.user.id)}');
                          // hello =
                          //     ('${snapshot.data!.moments.firstWhere((element) => element.userId == snapshot1.data!.user.id)}');
                          // print(hello.toString());

                          // var ii = snapshot

                          // snapshot.data!.moments.map((e) => {
                          //   var userNam = snapshot1.data.

                          // });
                          // print(snapshot);
                          // print(snapshot1);
                          var he;
                          // print('test hereeee');
                          // print(snapshot1.data!.user.id);

                          if (snapshot.hasData) {
                            // if ('${  Your Smile is killing me   T.T  }' = ) {

                            // }

                            // print(ol);

                            var yy = snapshot.data!.moments.firstWhere(
                                (element) => element.eventId != null);
                            if (yy != null) {
                              // setState(() {});
                              var y = yy.userId.toString();
                              ol = y;

                              // print(ya);
                              var mome = snapshot.data!.moments[index];
                              // var profileID = '3';
                              // var data1 = await
                              // profileID =
                              //     '${snapshot.data!.moments.firstWhere((element) => element.eventId)}';
                              // profileID = AsyncSnapshot.waiting();
                              MomentServices1().fetchMoment();

                              // Future<DeleteMoment> _delMoment =
                              //     MomentServices1()
                              //         .deketNoement(delMoment: mome.filename.toString());
                              // var deletingMoment = mome.filename;

                              Future<FetchUser> _fetchUser = MomentServices1()
                                  .fetchUsers(id: mome.userId.toString());
                              Future<ProfileUser> _fetchProgfilePicture =
                                  MomentServices1().fetchUserProfile(
                                      userProfile: mome.userId.toString());

                              Future<LikeMoment1> _LikeMoment =
                                  MomentServices1().LikeMoment(
                                      LikeMoment: mome.id.toString());

                              // var userNmae = snapshot1.data!.user.
                              // setState(() {});
                              hello = mome.userId.toString();
                              var imgg = "${mome.image}";
                              var useriddd;

                              Uint8List imgDisplay =
                                  base64.decode('$imgg'.split(' ').last);

                              bool isLinked = false;
                              //Delete Moment by user
                              bool isDeletMoment = false;
                              //REMAINING LIKE AND VIEW
                              bool isLiked = false;
                              //weather the link is available or not
                              bool IsFacebok = false;
                              bool isInstagram = false;
                              bool isTelegram = false;
                              bool isTwitter = false;
                              String facebook = 'facebook is not available';
                              String instagram = 'instagram is not available';
                              String telegram = 'telegram is not available';
                              String twitter = 'twitter is not available';
                              String Linked = 'Linked is not available';
                              if (mome.links.linkFacebook == 'null') {
                                print('printed first');
                              } else {
                                print('printed second');
                                // setState(() {});
                                facebook = mome.links.linkFacebook.toString();
                                instagram = mome.links.linkInstagram.toString();
                                telegram = mome.links.linkTelegram.toString();
                                twitter = mome.links.linkTwitter.toString();
                              }
                              print(facebook.toString());
                              if (facebook != 'null') {
                                IsFacebok = true;
                              }
                              if (instagram != 'null') {
                                isInstagram = true;
                              }
                              if (telegram != 'null') {
                                isTelegram = true;
                              }

                              if (twitter != 'null') {
                                isTwitter = true;
                              }

                              bool isUserAccount = false;
                              if (mome.user.firstName == 'Dawit' &&
                                  mome.user.lastName == 'Aseged') {
                                // mome.filename.toString();
                                print('name here');
                                print(mome.filename.toString());
                              }

                              if (mome.userId == 3) {
                                print(mome.id.toString());
                                isDeletMoment = true;
                              }
                              /* Future<Map<String, String>> fetchdataa() async {
                                // List<Albfuum> myalbum = [];
                                var data22 =
                                    await MomentServices1().fetchMoment();
                                var data33 = await MomentServices1()
                                    .fetchUserProfile(userProfile: profileID);
                                    var day = {
                                      data22 = 
                                    }
                                return day;
                              } */
                              // print(IsF.toString());

                              bool isLikedMoment = false;

                              // print(imgDisplay);
                              return SingleChildScrollView(
                                child: Container(
                                  // color: Colors.amber,
                                  height: 530,
                                  // width: 800,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              children: [
                                                // Text("Name Name"),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    width: 380,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        FutureBuilder<
                                                                ProfileUser>(
                                                            future:
                                                                _fetchProgfilePicture,
                                                            builder: (context,
                                                                photoID) {
                                                              // on one  page profile user show list
                                                              //
                                                              // if (condition) {fredfkil jefukse filelpo

                                                              // }
                                                              if (photoID
                                                                  .hasData) {
                                                                var profileImage =
                                                                    "${photoID.data!.profilePicture.image}";
                                                                Uint8List
                                                                    ProfilePicDisplay =
                                                                    base64.decode('$profileImage'
                                                                        .split(
                                                                            ' ')
                                                                        .last);
                                                                return Container(
                                                                  // color: Colors.amber,
                                                                  height: 40,
                                                                  width: 40,
                                                                  decoration: BoxDecoration(
                                                                      image: DecorationImage(
                                                                          image: MemoryImage(
                                                                              ProfilePicDisplay),
                                                                          fit: BoxFit
                                                                              .cover)),

                                                                  // child: ,
                                                                );
                                                              }
                                                              if (photoID
                                                                  .hasError) {
                                                                return Container(
                                                                  color: Colors
                                                                          .green[
                                                                      100],
                                                                  // color: Colors.amber,
                                                                  height: 40,
                                                                  width: 40,

                                                                  child: Icon(Icons
                                                                      .person_2),

                                                                  // child: ,
                                                                );
                                                              }
                                                              return Center(
                                                                child:
                                                                    CircularProgressIndicator(),
                                                              );
                                                            }),
                                                        // Text(useriddd
                                                        //     .toString()),
                                                        /*  Container(
                                                          // color: Colors.amber,
                                                          height: 40,
                                                          width: 40,
                                                          decoration: BoxDecoration(
                                                              image: DecorationImage(
                                                                  image: MemoryImage(
                                                                      imgDisplay),
                                                                  fit: BoxFit
                                                                      .cover)),

                                                          // child: ,
                                                        ), */
                                                        /* CircleAvatar(
                                                          radius: 20,
                                                          child: Image.memory(
                                                            imgDisplay,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ), */
                                                        SizedBox(width: 10),
                                                        Text(
                                                          '${mome.user.firstName} ${mome.user.lastName}',
                                                          style: TextStyle(
                                                              fontSize: 20),
                                                        ),
                                                        /* FutureBuilder<
                                                                FetchUser>(
                                                            future: _fetchUser,
                                                            builder:
                                                                (context, d) {
                                                              // var cc = snapshot
                                                              //     .data!.moments
                                                              //     .firstWhere((element) =>
                                                              //         element
                                                              //             .eventId ==
                                                              //         d.data!.user
                                                              //             .firstName);
                                                              // print(cc);

                                                              if (snapshot
                                                                      .data!
                                                                      .moments
                                                                      .length !=
                                                                  null) {
                                                                if (d
                                                                    .hasError) {
                                                                  return Text(
                                                                      "please ${d.error}");
                                                                }
                                                                if (d.hasData) {
                                                                  // if (d.hasData) {
                                                                  //   isLoaded =
                                                                  //       true;
                                                                  // }
                                                                  return Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        "${d.data!.user.firstName} ${d.data!.user.lastName}",
                                                                        style: TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontSize: 20),
                                                                      ),
                                                                    ],
                                                                  );
                                                                  // return Text(isLoaded
                                                                  //     ? "${d.data!.user.firstName ?? "String is null"}"
                                                                  //     : "null");
                                                                }
                                                              }

                                                              return Center(
                                                                child:
                                                                    CircularProgressIndicator(),
                                                              );
                                                            }), */
                                                        Spacer(),
                                                        // SizedBox(
                                                        //   width: 220,
                                                        // ),
                                                        GestureDetector(
                                                            onTap: () {
                                                              showModalBottomSheet(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (BuildContext
                                                                          context) {
                                                                    return Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              8.0),
                                                                      child:
                                                                          SizedBox(
                                                                        height:
                                                                            200,
                                                                        child:
                                                                            Column(
                                                                          children: [
                                                                            Container(
                                                                              alignment: Alignment.center,
                                                                              width: double.infinity,
                                                                              height: 40,
                                                                              decoration: BoxDecoration(color: Colors.teal[100], borderRadius: BorderRadius.circular(20)),
                                                                              child: Text("Favoarite"),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Container(
                                                                              alignment: Alignment.center,
                                                                              width: double.infinity,
                                                                              height: 40,
                                                                              decoration: BoxDecoration(color: Colors.teal[100], borderRadius: BorderRadius.circular(20)),
                                                                              child: Text("Download Imagee"),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            // Text("Download Imagee"),
                                                                            isDeletMoment
                                                                                ? GestureDetector(
                                                                                    onTap: () {
                                                                                      _deleteMoment(mome.filename);
                                                                                      setState(() {});
                                                                                    },
                                                                                    child: Container(
                                                                                      alignment: Alignment.center,
                                                                                      width: double.infinity,
                                                                                      height: 40,
                                                                                      decoration: BoxDecoration(color: Colors.red[100], borderRadius: BorderRadius.circular(20)),
                                                                                      child: Text("Delete"),
                                                                                    ),
                                                                                  )
                                                                                : Container(),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    );
                                                                  });
                                                            },
                                                            child: Icon(
                                                                Icons.settings))
                                                      ],
                                                    ),
                                                  ),
                                                )
                                                // Text(
                                                //     "${userna.userId}"),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        color: Colors.amber,
                                        height: 420,
                                        width: 500,
                                        // decoration: BoxDecoration(
                                        //   image: DecorationImage(image: NetworkImage(imgDisplay))
                                        // ),
                                        child: Image.memory(
                                          imgDisplay,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 320,
                                            child: SingleChildScrollView(
                                              child: Row(
                                                children: [
                                                  FutureBuilder<LikeMoment1>(
                                                      future: _LikeMoment,
                                                      builder:
                                                          (context, snapp) {
                                                        if (snapp.hasError) {
                                                          return Text(
                                                              'isnooot Liked');
                                                        }
                                                        if (snapp.hasData) {
                                                          isLikedMoment = true;
                                                          // print(isLikedMoment);
                                                          return isLikedMoment
                                                              ? Text('is Liked')
                                                              : Text(
                                                                  'isnooot Liked');
                                                        }
                                                        return CircularProgressIndicator();
                                                      }),
                                                  GestureDetector(
                                                    onTap: () {},
                                                    child: Icon(
                                                      Icons
                                                          .health_and_safety_rounded,
                                                      color: isLikedMoment
                                                          ? Colors.red
                                                          : Colors.amber,
                                                      size: 30,
                                                    ),
                                                  ),
                                                  Text(
                                                    "30",
                                                    style:
                                                        TextStyle(fontSize: 18),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          // Row(
                                          //   children: [
                                          //     Icon(Icons.remove_red_eye),
                                          //     Text("120"),
                                          //   ],
                                          // ),
                                          ElevatedButton(
                                            onPressed: () {
                                              showModalBottomSheet(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return SizedBox(
                                                      height: 200,
                                                      child: Column(
                                                        children: [
                                                          /* Text(mome.links
                                                              .linkFacebook
                                                              .toString()),
                                                          Text(mome.links
                                                              .linkInstagram
                                                              .toString()),
                                                          Text(mome.links
                                                              .linkTelegram
                                                              .toString()), */
                                                          socialLink(
                                                            IsFacebook:
                                                                IsFacebok,
                                                            social: facebook,
                                                            icon: Icons.face,
                                                            title: 'facebook',
                                                          ),
                                                          socialLink(
                                                            IsFacebook:
                                                                isTelegram,
                                                            social: telegram,
                                                            icon: Icons.send,
                                                            title: 'telegram',
                                                          ),
                                                          /* socialLink(
                                                            IsFacebok:
                                                                isTwitter,
                                                            social: twitter,
                                                            icon: Icons
                                                                .biotech_rounded,
                                                          ),
                                                          socialLink(
                                                            IsFacebok:
                                                                isInstagram,
                                                            social: instagram,
                                                            icon: Icons.camera,
                                                          ), */
                                                        ],
                                                      ),
                                                    );
                                                  });
                                            },
                                            child: Icon(
                                              Icons.share,
                                              color: Colors.lime[800],
                                              size: 30,
                                            ),
                                          ),
                                        ],
                                      )
                                      // Container(
                                      //   width: 400,
                                      //   height: 90,
                                      //   child: ListView(
                                      //     shrinkWrap: true,
                                      //     scrollDirection: Axis.horizontal,
                                      //     children: [
                                      //       Container(
                                      //         height: 70,
                                      //         width: 250,
                                      //         child: Column(
                                      //           children: [
                                      //             Row(
                                      //               mainAxisAlignment:
                                      //                   MainAxisAlignment.start,
                                      //               children: [
                                      //                 Icon(
                                      //                   Icons.circle,
                                      //                   size: 70,
                                      //                 ),
                                      //                 SizedBox(
                                      //                   width: 10,
                                      //                 ),
                                      //                 Text("Example name here"),
                                      //                 Spacer(),
                                      //               ],
                                      //             ),
                                      //             Text("${mome.filename}"),
                                      //           ],
                                      //         ),
                                      //       ),
                                      //     ],
                                      //   ),
                                      // ),

                                      // [ snapshot.data!.images?.map((e) {})
                                      // Container(
                                      //   height: 400,
                                      //   width: 500,
                                      //   decoration: BoxDecoration(
                                      //       image: DecorationImage(
                                      //           image: MemoryImage(yessss),
                                      //          fit: BoxFit.contain)),
                                      //   / child: Text(
                                      //   /     "${snapshot.data!.images[index].filename}"),
                                      // ),
                                      // Image.memory(yessss),
                                    ],
                                  ),
                                ),
                              );
                            }
                            if (snapshot.hasError) {
                              return Center(
                                child: Text("${snapshot.error}"),
                              );
                            }

                            return Center(
                                child: Column(
                              children: [
                                /* SizedBox(
                                height: 20,
                                child: Shimmer.fromColors(
                                    child: Text("Loadingg"),
                                    baseColor: Colors.orange,
                                    highlightColor: Colors.blue),
                              ) */
                              ],
                            ));
                          }
                          ;
                        });

                    // FutureBuilder<FetchUser>(
                    //   future: _fetchUser,
                    //   builder: (context, snapshot1) {
                    //     if (snapshot1.hasError) {
                    //       return Center(
                    //         child: Text("${snapshot.error}"),
                    //       );
                    //     }
                    //     return
                    //   },
                    //   // child:
                    // );
                  }
                  return Center(child: CircularProgressIndicator()
                      /*  Column(
                    children: [
                      SizedBox(
                          height: 100,
                          child: Shimmer.fromColors(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  color: Colors.amber,
                                  height: 10,
                                  width: 200,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  color: Colors.amber,
                                  height: 10,
                                  width: 300,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  color: Colors.amber,
                                  height: 10,
                                  width: 300,
                                ),
                              ],
                            ),
                            baseColor: Colors.grey,
                            highlightColor: Colors.grey.shade800,
                          ))
                    ],
                  ) */
                      );
                })));
  }
}

class socialLink extends StatelessWidget {
  const socialLink({
    super.key,
    required this.IsFacebook,
    required this.social,
    required this.icon,
    required this.title,
  });

  final bool IsFacebook;
  final String social;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          // Icons.account_balance_rounded,
          color: IsFacebook ? Colors.blue[900] : Colors.blue[100],
        ),
        SizedBox(
          width: 20,
        ),
        IsFacebook ? Text(title) : Text('Not Available'),
        SizedBox(
          width: 10,
        ),
        Text(social)
      ],
    );
  }
}

void _deleteMoment(String delMoment) async {
  String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwczovL2hhc3VyYS5pby9qd3QvY2xhaW1zIjp7IngtaGFzdXJhLWFsbG93ZWQtcm9sZXMiOlsidXNlciJdLCJ4LWhhc3VyYS1kZWZhdWx0LXJvbGUiOiJ1c2VyIiwieC1oYXN1cmEtcm9sZSI6InVzZXIiLCJ4LWhhc3VyYS11c2VyLWlkIjoiNDEiLCJ4LWhhc3VyYS11c2VyLWVtYWlsIjoidGVzdDRAdGVzc3QuY29tIn0sImlhdCI6MTY4NzUxNzQ3NX0.zlt1qmO6kdLkWunR23Khl7c305NHx5MwAR31Jg6hpZE";
  final Uri url = Uri.parse("http://167.71.12.36:5000/removeMoment");
  final response = await http.delete(url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({"filename": delMoment}));
  print(response.statusCode);
  if (response.statusCode == 200) {
    // return response.body;
  } else {
    throw Exception("Fetch User profile picture Didnt Respond");
  }
}

void _iked(String delMoment) async {
  String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwczovL2hhc3VyYS5pby9qd3QvY2xhaW1zIjp7IngtaGFzdXJhLWFsbG93ZWQtcm9sZXMiOlsidXNlciJdLCJ4LWhhc3VyYS1kZWZhdWx0LXJvbGUiOiJ1c2VyIiwieC1oYXN1cmEtcm9sZSI6InVzZXIiLCJ4LWhhc3VyYS11c2VyLWlkIjoiMyIsIngtaGFzdXJhLXVzZXItZW1haWwiOiJkYXdpdC5hc2VnZWRAZ21haWwuY29tIn0sImlhdCI6MTY1ODMzNjgyMH0.hx-dEkiCwsct3CRxT5o1ijVsK6K7OV6Y4t4KVy9BdW0";
  final Uri url = Uri.parse("http://167.71.12.36:5000/likeMoment");
  final response = await http.delete(url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({"filename": delMoment}));
  print(response.statusCode);
  if (response.body == "Liked") {
    // return response.body;
  } else {
    throw Exception("Fetch User profile picture Didnt Respond");
  }
}
