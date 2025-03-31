// import 'dart:async';
// import 'dart:developer';
//
// import 'package:codekameleon/features/auth/auth_helpers/auth_exception.dart';
// import 'package:codekameleon/features/auth/auth_helpers/auth_repo.dart';
// import 'package:codekameleon/features/auth/auth_helpers/auth_state.dart';
// import 'package:codekameleon/features/auth/auth_helpers/auth_status.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class AuthCubit extends Cubit<AuthState> {
//   final AuthRepository _authRepository;
//   late StreamSubscription<User?> _authSubscription;
//
//   AuthCubit(this._authRepository)
//       : super(AuthState(status: AuthStatus.initial)) {
//     _monitorAuthState();
//   }
//
//   void _monitorAuthState() {
//     _authSubscription = _authRepository.authState.listen((user) {
//       if (user != null) {
//         emit(AuthState(status: AuthStatus.authenticated, user: user));
//       } else {
//         emit(AuthState(status: AuthStatus.unauthenticated));
//       }
//     });
//   }
//
//   Future<void> signInWithEmailAndPassword(String email, String password) async {
//     emit(AuthState(status: AuthStatus.loading));
//     try {
//       bool isLoginSuccessful =
//           await _authRepository.signInWithEmailAndPassword(email, password);
//       if (isLoginSuccessful) {
//         emit((AuthState(status: AuthStatus.authenticated)));
//       } else {
//         emit(AuthState(status: AuthStatus.unauthenticated));
//       }
//     } on AuthException catch (e) {
//       emit(AuthState(status: AuthStatus.error, errorMessage: e.message));
//     }
//   }
//
//   Future<void> registerWithEmailAndPassword(
//       String email, String password) async {
//     emit(AuthState(status: AuthStatus.loading));
//     try {
//       await _authRepository.registerWithEmailAndPassword(email, password);
//     } on AuthException catch (e) {
//       emit(AuthState(status: AuthStatus.error, errorMessage: e.message));
//     }
//   }
//
//   Future<void> signOut() async {
//     emit(AuthState(status: AuthStatus.loading));
//     try {
//       bool isLoggedOut = await _authRepository.signOut();
//       log("the logged out is $isLoggedOut");
//       if (isLoggedOut) {
//         emit(AuthState(status: AuthStatus.signout));
//       }
//     } on AuthException catch (e) {
//       emit(AuthState(status: AuthStatus.error, errorMessage: e.message));
//     }
//   }
//
//   @override
//   Future<void> close() {
//     _authSubscription.cancel();
//     return super.close();
//   }
// }
