import 'package:flutter/material.dart';
import 'package:github_repo_tracker/presenter/pages/display_git_list_page.dart';

void main() {
  runApp(const GitRepoTrackerApp());
}

class GitRepoTrackerApp extends StatelessWidget {
  const GitRepoTrackerApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Github Tracker App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => const DisplayGitListScreen(),
      },
    );
  }
}
