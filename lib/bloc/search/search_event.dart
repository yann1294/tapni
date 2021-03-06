import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadUserEvent extends SearchEvent {
  final String userId;

  LoadUserEvent({this.userId});

  @override
  List<Object> get props => [userId];
}

class SelectUserEvent extends SearchEvent {
  final String currentUserId, selectedUserId, name, socialLink, photoUrl;

  SelectUserEvent(
      {this.currentUserId,
      this.name,
      this.photoUrl,
      this.socialLink,
      this.selectedUserId});

  @override
  List<Object> get props =>
      [currentUserId, selectedUserId, name, socialLink, photoUrl];
}

class PassUserEvent extends SearchEvent {
  final String currentUserId, selectedUserId;

  PassUserEvent(this.currentUserId, this.selectedUserId);

  @override
  List<Object> get props => [currentUserId, selectedUserId];
}
