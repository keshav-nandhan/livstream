
import 'package:flutter/material.dart';
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtm/agora_rtm.dart';

class AgoraUser {
  int uid;
  bool muted;
  bool videoDisabled;
  String? name;
  Color? backgroundColor;

  AgoraUser({
    required this.uid,
    this.muted = false,
    this.videoDisabled = false,
    this.name,
    this.backgroundColor,
  });

  AgoraUser copyWith({
    int? uid,
    bool? muted,
    bool? videoDisabled,
    String? name,
    Color? backgroundColor,
  }) {
    return AgoraUser(
      uid: uid ?? this.uid,
      muted: muted ?? this.muted,
      videoDisabled: videoDisabled ?? this.videoDisabled,
      name: name ?? this.name,
      backgroundColor: backgroundColor ?? this.backgroundColor,
    );
  }
}

enum StreamPlatform { youtube, twitch, other }

class StreamDestination {
  StreamPlatform platform;
  String url;

  StreamDestination({
    required this.platform,
    required this.url,
  });
}



class DirectorModel {
  RtcEngine? engine;
  AgoraRtmClient? client;
  AgoraRtmChannel? channel;
  Set<AgoraUser> activeUsers;
  Set<AgoraUser> lobbyUsers;
  AgoraUser? localUser;
  bool isLive;
  List<StreamDestination> destinations;

  DirectorModel({
    this.engine,
    this.client,
    this.channel,
    this.activeUsers = const {},
    this.lobbyUsers = const {},
    this.localUser,
    this.isLive = false,
    this.destinations = const [],
  });

  DirectorModel copyWith({
    RtcEngine? engine,
    AgoraRtmClient? client,
    AgoraRtmChannel? channel,
    Set<AgoraUser>? activeUsers,
    Set<AgoraUser>? lobbyUsers,
    AgoraUser? localUser,
    bool? isLive,
    List<StreamDestination>? destinations,
  }) {
    return DirectorModel(
      engine: engine ?? this.engine,
      client: client ?? this.client,
      channel: channel ?? this.channel,
      activeUsers: activeUsers ?? this.activeUsers,
      lobbyUsers: lobbyUsers ?? this.lobbyUsers,
      localUser: localUser ?? this.localUser,
      isLive: isLive ?? this.isLive,
      destinations: destinations ?? this.destinations,
    );
  }
}