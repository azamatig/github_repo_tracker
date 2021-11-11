import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repo_tracker/bloc/git_bloc.dart';
import 'package:github_repo_tracker/bloc/git_event.dart';
import 'package:github_repo_tracker/bloc/git_state.dart';
import 'package:github_repo_tracker/data/models/git_repo_model.dart';
import 'package:github_repo_tracker/presenter/widgets/git_repo_tracker_list_item.dart';

class GitRepoTrackerBody extends StatefulWidget {
  const GitRepoTrackerBody({Key? key}) : super(key: key);

  @override
  _GitRepoTrackerBodyState createState() => _GitRepoTrackerBodyState();
}

class _GitRepoTrackerBodyState extends State<GitRepoTrackerBody> {
  final List<GitRepoModel> _repos = [];
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer<GitBloc, GitState>(
        listener: (context, gitState) {
          if (gitState is GitLoadingState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(gitState.message)));
          } else if (gitState is GitSuccessState &&
              gitState.repos.items.isEmpty) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('No more repos')));
          } else if (gitState is GitErrorState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(gitState.error)));
            BlocProvider.of<GitBloc>(context).isFetching = false;
          }
          return;
        },
        builder: (context, gitState) {
          if (gitState is GitInitialState ||
              gitState is GitLoadingState && _repos.isEmpty) {
            return const CircularProgressIndicator();
          } else if (gitState is GitSuccessState) {
            _repos.addAll(gitState.repos.items);
            BlocProvider.of<GitBloc>(context).isFetching = false;
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          } else if (gitState is GitErrorState && _repos.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    BlocProvider.of<GitBloc>(context)
                      ..isFetching = true
                      ..add(const GitFetchEvent());
                  },
                  icon: const Icon(Icons.refresh),
                ),
                const SizedBox(height: 15),
                Text(gitState.error, textAlign: TextAlign.center),
              ],
            );
          }
          return ListView.separated(
            controller: _scrollController
              ..addListener(() {
                if (_scrollController.offset ==
                        _scrollController.position.maxScrollExtent &&
                    !BlocProvider.of<GitBloc>(context).isFetching) {
                  BlocProvider.of<GitBloc>(context)
                    ..isFetching = true
                    ..add(const GitFetchEvent());
                }
              }),
            itemBuilder: (context, index) => GitRepoListItem(_repos[index]),
            separatorBuilder: (context, index) => const SizedBox(height: 5),
            itemCount: _repos.length,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
