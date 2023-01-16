import 'package:bloc/bloc.dart';
import 'package:ecclesia_ui/data/models/voter_model.dart';

part 'logged_user_event.dart';
part 'logged_user_state.dart';

class LoggedUserBloc extends Bloc<LoggedUserEvent, LoggedUserState> {
  LoggedUserBloc() : super(LoggedUserInitial()) {
    on<LoginLoggedUserEvent>((event, emit) {
      final Voter user = Voter.voters[int.parse(event.userId)]; // User can be changed here
      emit(LoggedUserLoaded(user: user));
    });
  }
}
