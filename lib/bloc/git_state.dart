import 'package:github_repo_tracker/data/models/git_items_model.dart';

abstract class GitState {
  const GitState();
}

class GitInitialState extends GitState {
  const GitInitialState();
}

class GitLoadingState extends GitState {
  final String message;

  const GitLoadingState({
    required this.message,
  });
}

class GitSuccessState extends GitState {
  final GitItemsModel repos;

  const GitSuccessState({
    required this.repos,
  });
}

class GitErrorState extends GitState {
  final String error;

  const GitErrorState({
    required this.error,
  });
}
