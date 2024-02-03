import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:renti_user/service/socket_service.dart';
import 'package:renti_user/utils/app_colors.dart';
import 'package:renti_user/utils/device_utils.dart';
import 'package:renti_user/view/widgets/appbar/custom_app_bar.dart';
import 'package:renti_user/view/widgets/container/custom_container.dart';
import 'package:renti_user/view/widgets/text/custom_text.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  int index = 0;
  String hostUid = "";
  String userUid = "";
  String name = "";
  String image = "";

  @override
  void initState() {
    userUid = Get.arguments[0];
    name = Get.arguments[1];
    image = Get.arguments[2];
    hostUid = Get.arguments[3];

    final socketService = Get.find<SocketService>();
    socketService.joinRoom(userUid);
    socketService.addNewChat({
      "participants": [userUid, hostUid],
    }, userUid );
    // DeviceUtils.screenUtils();

    super.initState();
  }

  @override
  void dispose() {
    DeviceUtils.screenUtils();
    super.dispose();
  }

  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    debugPrint("=======> user Uid $userUid");
    debugPrint("=======> user Name $name");
    debugPrint("=======> user Image $image");
    debugPrint("=======> user Host Id $hostUid");
    return SafeArea(
      top: true,
      child: Scaffold(
        extendBody: true,
        backgroundColor: AppColors.whiteLight1,
        appBar: CustomAppBar(
          appBarBgColor: AppColors.primaryColor,
           bottom: 10,
          top: 10,
          appBarHeight: 100,
          appBarContent: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(onPressed: (){Get.back();}, icon: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 18,
                    color: AppColors.whiteLight,
                  ),),
                  const SizedBox(width: 10,),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: CachedNetworkImageProvider(image))),
                  ),
                  const SizedBox(width: 12,),
                  CustomText(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      text: name,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColors.whiteLight)
                ],
              ),
            ],
          ),

        ),
        body: GetBuilder<SocketService>(
          builder: (socketService) {
            return socketService.messageList.isEmpty
                ? Center(
                    child: Text("No Data Found".tr,
                        style: GoogleFonts.raleway(fontSize: 20)))
                : SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.only(top: 24, bottom: 100,left: 20,right: 20),
                    child: CustomContainer(
                      child: Column(
                        children: List.generate(
                          socketService.messageList.length,
                          (index) => Align(
                            alignment: socketService.messageList[index]["sender"]["role"] != "user"
                                ? Alignment.topLeft
                                : Alignment.topRight,
                            child: Container(
                              margin:
                                  const EdgeInsetsDirectional.only(bottom: 12),
                              padding: const EdgeInsetsDirectional.symmetric(
                                  vertical: 16, horizontal: 12),
                              decoration: BoxDecoration(
                                borderRadius: socketService.messageList[index]
                                            ["sender"]["role"] !=
                                        "user"
                                    ? const BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        topRight: Radius.circular(12),
                                        bottomRight: Radius.circular(12))
                                    : const BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        topRight: Radius.circular(12),
                                        bottomLeft: Radius.circular(12)),
                                color: socketService.messageList[index]
                                            ["sender"]["role"] !=
                                        "user"
                                    ? AppColors.primaryColor
                                    : const Color(0xffE2E2E2),
                              ),
                              child: Text(
                                socketService.messageList[index]["message"],
                                textAlign: TextAlign.start,
                                style: GoogleFonts.raleway(
                                    color: socketService.messageList[index]
                                                ["sender"]["role"] !=
                                            "user"
                                        ? AppColors.whiteNormalActive
                                        : AppColors.primaryColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
          },
        ),
        bottomNavigationBar: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: AnimatedPadding(
            padding: MediaQuery.of(context).viewInsets,
            duration: const Duration(milliseconds: 100),
            curve: Curves.decelerate,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 24),
              decoration: BoxDecoration(
                  color: AppColors.whiteLight,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.blackNormal.withOpacity(0.1),
                      offset: const Offset(2, 2),
                      blurRadius: 10,
                    )
                  ]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: TextFormField(
                        cursorColor: AppColors.blackNormal,
                        keyboardType: TextInputType.multiline,
                        textAlign: TextAlign.left,
                        textInputAction: TextInputAction.done,
                        controller: messageController,
                        style: GoogleFonts.raleway(
                            color: AppColors.blackNormal,
                            fontSize: 14,
                            fontWeight: FontWeight.w500
                        ),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsetsDirectional.only(start: 12, end: 12, top: 12, bottom: 12),
                          fillColor: Colors.transparent,
                          filled: true,
                          hintText: "Type message",
                          hintStyle: GoogleFonts.raleway(
                              color: AppColors.blackNormal,
                              fontWeight: FontWeight.w500,
                              fontSize: 14
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: AppColors.darkBlueColor.withOpacity(0.5))
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: AppColors.darkBlueColor.withOpacity(0.5))
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: AppColors.darkBlueColor.withOpacity(0.5))
                          ),
                        ),
                      )
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      if(messageController.text != "" && messageController.text.isNotEmpty){
                        Get.find<SocketService>().addNewMessage(messageController.text, userUid, Get.find<SocketService>().chatId);
                      }
                      messageController.text = "";
                    },
                    child: const Icon(Icons.send,
                        color: AppColors.darkBlueColor, size: 20),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
