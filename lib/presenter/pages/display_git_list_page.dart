import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repo_tracker/bloc/git_bloc.dart';
import 'package:github_repo_tracker/bloc/git_event.dart';
import 'package:github_repo_tracker/data/repository/git_repository.dart';
import 'package:github_repo_tracker/presenter/widgets/git_repo_tracker_body.dart';

class DisplayGitListScreen extends StatelessWidget {
  const DisplayGitListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GitBloc(
        gitRepository: GitRepository(),
      )..add(const GitFetchEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Repos'),
        ),
        body: const GitRepoTrackerBody(),
      ),
    );
  }
}
