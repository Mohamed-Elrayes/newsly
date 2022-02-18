part of 'social_auth_bloc.dart';

abstract class SocialAuthEvent extends Equatable {
  const SocialAuthEvent();

  @override
  List<Object> get props => [];
}
class GoogleSigning extends SocialAuthEvent {}
