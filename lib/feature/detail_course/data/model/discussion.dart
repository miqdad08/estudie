import '../../domain/entities/discussion.dart';

class DiscussionModel {
  final String? id;
  final String? uid;
  final String? nameUser;
  final String? photoUser;
  final String title;
  final String description;
  final int time;
  final List<String>? photoAttachments;
  final List<DiscussionModel>? replies;

  const DiscussionModel({
    this.id,
    this.uid,
    this.nameUser,
    this.photoUser,
    required this.title,
    required this.description,
    required this.time,
    this.photoAttachments,
    this.replies,
  });

  DiscussionModel copyWith({
    String? id,
    String? uid,
    String? nameUser,
    String? photoUser,
    String? title,
    String? description,
    int? time,
    List<String>? photoAttachments,
    List<DiscussionModel>? replies,
  }) {
    return DiscussionModel(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      nameUser: nameUser ?? this.nameUser,
      photoUser: photoUser ?? this.photoUser,
      title: title ?? this.title,
      description: description ?? this.description,
      time: time ?? this.time,
      photoAttachments: photoAttachments ?? this.photoAttachments,
      replies: replies ?? this.replies,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uid': uid,
      'nameUser': nameUser,
      'photoUser': photoUser,
      'title': title,
      'description': description,
      'time': time,
      'photoAttachments': photoAttachments,
    };
  }

  Discussion toEntity() {
    return Discussion(
      id: id,
      uid: uid,
      nameUser: nameUser,
      photoUser: photoUser,
      title: title,
      description: description,
      time: time,
      photoAttachments: photoAttachments,
      replies: replies?.map((item) => item.toEntity()).toList(),
    );
  }

  factory DiscussionModel.fromJson(Map<String, dynamic> json) {
    return DiscussionModel(
      id: json['id'],
      uid: json['uid'],
      nameUser: json['nameUser'],
      photoUser: json['photoUser'],
      title: json['title'],
      description: json['description'],
      time: json['time'],
      photoAttachments: json['photoAttachments'] != null
          ? List<String>.from(json['photoAttachments'])
          : null,
      replies: json['replies'] != null
          ? List<DiscussionModel>.from(
              json['replies'].map((item) => DiscussionModel.fromJson(item)),
            )
          : null,
    );
  }

  factory DiscussionModel.fromEntity(Discussion discussion) {
    return DiscussionModel(
      id: discussion.id,
      uid: discussion.uid,
      nameUser: discussion.nameUser,
      photoUser: discussion.photoUser,
      title: discussion.title,
      description: discussion.description,
      time: discussion.time,
      photoAttachments: discussion.photoAttachments,
    );
  }
}
