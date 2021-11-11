import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repo_tracker/bloc/git_event.dart';
import 'package:github_repo_tracker/bloc/git_state.dart';
import 'package:github_repo_tracker/data/models/git_items_model.dart';
import 'package:github_repo_tracker/data/repository/git_repository.dart';
import 'package:http/http.dart' as http;

class GitBloc extends Bloc<GitEvent, GitState> {
  final GitRepository gitRepository;
  int page = 1;
  bool isFetching = false;

  GitBloc({
    required this.gitRepository,
  }) : super(const GitInitialState());

  @override
  Stream<GitState> mapEventToState(GitEvent event) async* {
    if (event is GitFetchEvent) {
      yield const GitLoadingState(message: 'Loading Repos');
      final response = await gitRepository.getGitRepos(page: page);
      if (response is http.Response) {
        if (response.statusCode == 200) {
          final body = jsonDecode(response.body);
          GitItemsModel repos = GitItemsModel.fromJson(body);
          yield GitSuccessState(
            repos: repos,
          );
          page++;
        } else {
          yield GitErrorState(error: response.body);
        }
      } else if (response is String) {
        yield GitErrorState(error: response);
      }
    }
  }
}
