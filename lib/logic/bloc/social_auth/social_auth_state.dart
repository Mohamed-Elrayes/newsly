part of'./social_auth_bloc.dart';

enum LogInSocialStatus { success, logout, loading, fail }

class SocialAuthState extends Equatable {
  const SocialAuthState(
      {this.status = LogInSocialStatus.loading, this.errorMessage});

  final LogInSocialStatus status;
  final String? errorMessage;

  @override
  List<Object> get props => [
        status,
      ];

  SocialAuthState copyWith({
    LogInSocialStatus? status,
    String? errorMessage,
  }) {
    return SocialAuthState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
