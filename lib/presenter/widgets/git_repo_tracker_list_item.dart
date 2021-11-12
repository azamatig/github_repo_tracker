import 'package:flutter/material.dart';
import 'package:github_repo_tracker/data/models/git_repo_model.dart';
import 'package:github_repo_tracker/presenter/utilities/constants.dart';

class GitRepoListItem extends StatelessWidget {
  final GitRepoModel repo;

  const GitRepoListItem(this.repo, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                repo.owner.avatarUrl.isEmpty
                    ? Container()
                    : Image.network(
                        repo.owner.avatarUrl,
                        loadingBuilder: (context, widget, imageChunkEvent) {
                          return imageChunkEvent == null
                              ? widget
                              : const CircularProgressIndicator();
                        },
                        height: 125,
                      ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: SizedBox(
                            height: 25,
                            width: 240,
                            child: nameStyle(repo.fullName)),
                      ),
                      SizedBox(
                        width: 240,
                        height: 65,
                        child: Text(
                          repo.description,
                          textAlign: TextAlign.start,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          roundContainer('Stars', repo.stargazersCount),
                          const SizedBox(
                            width: 5,
                          ),
                          roundContainer('Issues', repo.openIssues),
                          const SizedBox(
                            width: 5,
                          ),
                          timeIntervalText(repo.pushedAt),
                          Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: timeIntervalOwnerName(repo.owner.login),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
