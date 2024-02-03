import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:renti_user/core/helper/shared_preference_helper.dart';
import 'package:renti_user/core/route/app_route.dart';
import 'package:renti_user/service/socket_service.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/device_utils.dart';
import 'package:renti_user/view/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:renti_user/view/widgets/appbar/custom_app_bar.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  SocketService socketService = SocketService();
  String userUid = "";

  List<Chat> allChatList = [];
  List<Participant> participants = [];

  getAllChats() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userUid = prefs.getString(SharedPreferenceHelper.userIdKey).toString();
    socketService.connectToSocket();
    socketService.joinRoom(userUid);
    socketService.fetchAllChats(
        userUid: userUid,
        didFetchChats: (list) {
          participants.clear();
          if (kDebugMode) {
            print("List =======> ${list.length}");
          }

          list.forEach((element) {
            participants.addAll(element.participants);
            if (kDebugMode) {
              print("Participant =======> ${element.participants.length}");
            }
          });

          setState(() {
            allChatList = list;
          });
        });
  }

  @override
  void initState() {
    DeviceUtils.screenUtils();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getAllChats();
    });
    super.initState();
  }

  @override
  void dispose() {
    //socketService.socketDispose("all-chats");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("this is ${allChatList.length}");
    }
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: AppColors.whiteLight,
        appBar: CustomAppBar(
            appBarContent: CustomText(
                text: "Messages".tr,
                fontSize: 18,
                fontWeight: FontWeight.w600)),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            children: List.generate(
              participants.length,
              (index) {
                return participants.isEmpty
                    ? const CircularProgressIndicator()
                    : Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: GestureDetector(
                          onTap: () {
                            var host = participants[index];

                            Get.toNamed(AppRoute.inboxScreen, arguments: [
                              userUid,
                              host.fullName,
                              host.image,
                              host.id,
                            ]);
                          },
                          child: Slidable(
                            endActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                    onPressed: (v) {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return const AlertDialog(
                                            title: Text("Delete message"),
                                          );
                                          // return CommonPopUp(
                                          //     title: "Delete Message",
                                          //     onTapYes: () {
                                          //
                                          //     },
                                          //     onTapNo: () {}
                                          // );
                                        },
                                      );
                                    },
                                    backgroundColor: AppColors.redNormal,
                                    icon: Icons.delete),
                              ],
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.all(16),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                shadows: const [
                                  BoxShadow(
                                    color: AppColors.shadowColor,
                                    blurRadius: 10,
                                    offset: Offset(0, 1),
                                    spreadRadius: 0,
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 52,
                                    width: 52,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: CachedNetworkImageProvider(
                                                participants[index]
                                                    .image
                                                    .toString()))),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            //chat.participants[index].role == "user"?
                                            CustomText(
                                                text: participants[index]
                                                    .fullName
                                                    .toString(),
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
              },
            ),
          ),
        ),
        bottomNavigationBar: const CustomBottomNavBar(currentIndex: 2),
      ),
    );
  }
}
