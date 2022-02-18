
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/constants/strings.dart';
   

class AppBlocObserver extends BlocObserver {
  
// @override
//   void onChange(BlocBase bloc, Change change) {
//      logger.w("========= Change ========= \n$change");
//     super.onChange(bloc, change);
//   }

@override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
     logger.v("========= Event ========= \n$event");
  }
 @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
     logger.w("============= transition ==============\n$transition");
  }
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
     logger.e('========== error ============\n$error');
    super.onError(bloc, error, stackTrace);

  }
}
