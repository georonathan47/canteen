import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'likes_event.dart';
part 'likes_state.dart';

class LikesBloc extends Bloc<LikesEvent, LikesState> {
  LikesBloc() : super(LikesInitial()) {
    on<LikesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
