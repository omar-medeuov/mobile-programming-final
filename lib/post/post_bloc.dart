import 'package:flutter_bloc/flutter_bloc.dart';
import 'post_event.dart';
import 'post_state.dart';
import 'post_repository.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository repository;

  PostBloc(this.repository) : super(PostInitial()) {
    on<FetchPostEvent>((event, emit) async {
      emit(PostLoading());
      try {
        final post = await repository.fetchPost();
        emit(PostLoaded(post));
      } catch (e) {
        emit(PostError(e.toString()));
      }
    });
  }
}
