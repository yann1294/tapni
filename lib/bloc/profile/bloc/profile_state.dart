part of 'profile_bloc.dart';

@immutable
class ProfileState {
  final bool isPhotoEmpty;
  final bool isNameEmpty;
  final bool isAgeEmpty;
  final bool isGenderEmpty;
  final bool isInterestedInEmpty;
  final bool isSocialLinkEmpty;
  final bool isLocationEmpty;
  final bool isFailure;
  final bool isSubmitting;
  final bool isSuccess;

  bool get isFormValid =>
      isPhotoEmpty &&
      isNameEmpty &&
      isAgeEmpty &&
      isGenderEmpty &&
      isInterestedInEmpty &&
      isSocialLinkEmpty;

  ProfileState({
    @required this.isPhotoEmpty,
    @required this.isNameEmpty,
    @required this.isAgeEmpty,
    @required this.isGenderEmpty,
    @required this.isInterestedInEmpty,
    @required this.isSocialLinkEmpty,
    @required this.isLocationEmpty,
    @required this.isFailure,
    @required this.isSubmitting,
    @required this.isSuccess,
  });

  factory ProfileState.empty() {
    return ProfileState(
      isPhotoEmpty: false,
      isFailure: false,
      isSuccess: false,
      isSubmitting: false,
      isNameEmpty: false,
      isAgeEmpty: false,
      isGenderEmpty: false,
      isInterestedInEmpty: false,
      isLocationEmpty: false, 
      isSocialLinkEmpty: null,
    );
  }

  factory ProfileState.loading() {
    return ProfileState(
      isPhotoEmpty: false,
      isFailure: false,
      isSuccess: false,
      isSubmitting: true,
      isNameEmpty: false,
      isAgeEmpty: false,
      isGenderEmpty: false,
      isInterestedInEmpty: false,
      isLocationEmpty: false, 
      isSocialLinkEmpty: null,
    );
  }

  factory ProfileState.failure() {
    return ProfileState(
      isPhotoEmpty: false,
      isFailure: true,
      isSuccess: false,
      isSubmitting: false,
      isNameEmpty: false,
      isAgeEmpty: false,
      isGenderEmpty: false,
      isInterestedInEmpty: false,
      isLocationEmpty: false, 
      isSocialLinkEmpty: null,
    );
  }

  factory ProfileState.success() {
    return ProfileState(
      isPhotoEmpty: false,
      isFailure: false,
      isSuccess: true,
      isSubmitting: false,
      isNameEmpty: false,
      isAgeEmpty: false,
      isGenderEmpty: false,
      isInterestedInEmpty: false,
      isLocationEmpty: false, 
      isSocialLinkEmpty: null,
    );
  }

  ProfileState update({
    bool isPhotoEmpty,
    bool isNameEmpty,
    bool isAgeEmpty,
    bool isGenderEmpty,
    bool isInterestedInEmpty,
    bool isSocialLink,
    bool isLocationEmpty,
  }) {
    return copyWith(
      isFailure: false,
      isSuccess: false,
      isSubmitting: false,
      isPhotoEmpty: isPhotoEmpty,
      isNameEmpty: isNameEmpty,
      isAgeEmpty: isAgeEmpty,
      isGenderEmpty: isGenderEmpty,
      isInterestedInEmpty: isInterestedInEmpty,
      isSocialLinkEmpty: isSocialLinkEmpty,
      isLocationEmpty: isLocationEmpty,
    );
  }
  ProfileState copyWith({
    bool isPhotoEmpty,
    bool isNameEmpty,
    bool isAgeEmpty,
    bool isGenderEmpty,
    bool isInterestedInEmpty,
    bool isSocialLinkEmpty,
    bool isLocationEmpty,
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
  }) {
    return ProfileState(
      isPhotoEmpty: isPhotoEmpty ?? this.isPhotoEmpty,
      isNameEmpty: isNameEmpty ?? this.isNameEmpty,
      isLocationEmpty: isLocationEmpty ?? this.isLocationEmpty,
      isInterestedInEmpty: isInterestedInEmpty ?? this.isInterestedInEmpty,
      isSocialLinkEmpty: isSocialLinkEmpty ?? this.isSocialLinkEmpty,
      isGenderEmpty: isGenderEmpty ?? this.isGenderEmpty,
      isAgeEmpty: isAgeEmpty ?? this.isAgeEmpty,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure, 
    );
  }
}
}