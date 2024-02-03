import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:renti_user/core/global/api_url_container.dart';
import 'package:renti_user/service/notification.dart';
import 'package:renti_user/view/screens/no_internet/no_internet_screen.dart';

import 'package:socket_io_client/socket_io_client.dart' as io;

import '../main.dart';

class SocketService extends GetxController {
  late io.Socket socket;

  NoInternetScreen notificationClass = const NoInternetScreen();
  // NotificationScreen notificationHelper =  const NotificationScreen();

  List<dynamic> messageList = [];
  List<dynamic> allMessageList = [];
  bool isLoading = false;
  String chatId = "";

  void connectToSocket() {
    socket = io.io(
        ApiUrlContainer.socketGlobal,
        io.OptionBuilder()
            .setTransports(['websocket'])
            .enableAutoConnect()
            .build());

    socket.onConnect((data) => debugPrint("Connection Established"));
    socket.onConnectError((data) => print("Connection Error"));

    socket.connect();

    socket.on('join-check', (data) {
      if (kDebugMode) {
        print("=======> Join check Listen this is: $data");
      }
    });

    socket.on('new-chat', (chat) {
      chatId = chat["_id"];
      joinChat(chatId);
      print("======> New Chat ${chat["_id"]}");
      if (kDebugMode) {
        print("chat id: $chatId");
      }
      if (kDebugMode) {
        print("chat id type: ${chat.runtimeType}");
      }
    });

    socket.on('all-messages', (messages) {
      messageList.clear();
      isLoading = true;
      update();
      debugPrint("========> Check Listen");
      if (messages is List) {
        for (var message in messages) {
          if (message is Map<String, dynamic>) {
            messageList.add(message);
          }
        }
      }
      if (kDebugMode) {
        print(messageList);
      }
      isLoading = false;
      update();
    });

    socket.on('all-chats', (chats) {
      allMessageList.clear();
      isLoading = true;
      update();

      if (chats is List) {
        for (var message in chats) {
          if (message is Map<String, dynamic>) {
            allMessageList.add(message);
          }
        }
      }
      if (kDebugMode) {
        print('All chats: $chats');
      }
      isLoading = false;
      update();
    });

    // socket.on('host-notification', (data) {
    //   if (data == null) {
    //     if (kDebugMode) {
    //       print("No Data: $data");
    //     }
    //   } else {
    //     NotificationHelper.showNotification(body: {}, fln:flutterLocalNotificationsPlugin);
    //     // notificationClass
    //     //     .showNotification(data['allNotification'][0]['message']);
    //     if (kDebugMode) {
    //       print("This is  Data: $data");
    //     }
    //     if (kDebugMode) {
    //       print("This is Data msg : ${data['allNotification'][0]['message']}");
    //     }
    //   }
    // });
  }

  listenNotification() {
    socket.on('user-notification', (data) {
      if (data == null) {
        if (kDebugMode) {
          print("No Data: $data");
        }
      } else {
        NotificationHelper.showNotification(
            body: data, fln: flutterLocalNotificationsPlugin);
        // notificationClass
        //     .showNotification(data['allNotification'][0]['message']);

        debugPrint("============> User Notification  $data");
        if (kDebugMode) {
          print("This is  Data: $data");
        }
        if (kDebugMode) {
          // print("This is Data msg : ${data['allNotification'][0]['message']}");
        }
      }
    });
  }

  socketDispose(String event) {
    socket.off(event);
  }

  List<Chat> convertChatList(List<dynamic> dynamicList) {
    List<Chat> allChatList = [];
    for (var item in dynamicList) {
      allChatList.add(Chat.fromJson(item));
    }
    return allChatList;
  }

  fetchAllChats({
    required String userUid,
    required Function(List<Chat>) didFetchChats,
  }) {
    socket.emit('get-all-chats', {'uid': userUid});

    socket.on('all-chats', (chats) {
      if (kDebugMode) {
        print("TTHi is all the chats.....=======> ${chats} ");
      }
      if (chats != null) {
        List<Chat> data = List<Chat>.from(chats.map((x) => Chat.fromJson(x)));
        if (kDebugMode) {
          print("Data ====> ${data.length}");
        }
        didFetchChats(data);
      }
    });
  }

  void joinRoom(String uid) {
    socket.emit('join-room', {'uid': uid});

    debugPrint("=========> Join Room $uid");
  }

  void addNewChat(Map chatInfo, String uid) {
    socket.emit('add-new-chat', {'chatInfo': chatInfo, "uid": uid});
    debugPrint("=========> Uid $uid");
    debugPrint("=========> Join ChatInfo $chatInfo");
  }

  joinChat(String uid) {
    socket.emit('join-chat', {'uid': uid});
    debugPrint("=========> Join Chat $uid");
  }

  addNewMessage(String message, String sender, String chat) {
    socket.emit('add-new-message',
        {"message": message, "sender": sender, "chat": chat});
  }

  getAllChats(String uid) {
    socket.emit('get-all-chats', {'uid': uid});
  }

  void getNotification(String uid) {
    socket.emit('join-room', {'uid': uid});
  }

  void disconnect() {
    socket.disconnect();
  }
}
/*class Chat {
  String id;
  List<Participant> participants;
  String createdAt;
  String updatedAt;
  int v;

  Chat({
    required this.id,
    required this.participants,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Chat.fromJson(Map<String, dynamic> json) {
    var participantsList = json['participants'] as List;
    List<Participant> participants =
    participantsList.map((participant) => Participant.fromJson(participant)).toList();

    return Chat(
      id: json['_id'],
      participants: participants,
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
    );
  }
}

class Participant {
  String id;
  String fullName;
  String image;
  String role;

  Participant({
    required this.id,
    required this.fullName,
    required this.image,
    required this.role,
  });

  factory Participant.fromJson(Map<String, dynamic> json) {
    return Participant(
      id: json['_id'],
      fullName: json['fullName'],
      image: json['image'],
      role: json['role'],
    );
  }
}*/

class Chat {
  String id;
  List<Participant> participants;
  String createdAt;
  String updatedAt;
  int v;

  Chat({
    required this.id,
    required this.participants,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Chat.fromJson(Map<String, dynamic> json) {
    var participantList = json['participants'] as List;
    List<Participant> participants = participantList
        .map((participant) => Participant.fromJson(participant))
        .toList();

    return Chat(
      id: json['_id'],
      participants: participants,
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
    );
  }
}

class Participant {
  String id;
  String fullName;
  String image;
  String role;

  Participant({
    required this.id,
    required this.fullName,
    required this.image,
    required this.role,
  });

  factory Participant.fromJson(Map<String, dynamic> json) {
    return Participant(
      id: json['_id'],
      fullName: json['fullName'],
      image: json['image'],
      role: json['role'],
    );
  }
}
