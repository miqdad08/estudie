import 'package:equatable/equatable.dart';

class Discussion extends Equatable {
  final String? id;
  final String? uid;
  final String? nameUser;
  final String? photoUser;
  final String title;
  final String description;
  final int time;
  final List<String>? photoAttachments;
  final List<Discussion>? replies;

  const Discussion({
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

  Discussion copyWith({
    String? id,
    String? uid,
    String? nameUser,
    String? photoUser,
    String? title,
    String? description,
    int? time,
    List<String>? photoAttachments,
    List<Discussion>? replies,
  }) {
    return Discussion(
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

  @override
  List<Object?> get props => [
        id,
        uid,
        nameUser,
        photoUser,
        title,
        description,
        time,
        photoAttachments,
        replies,
      ];
}
