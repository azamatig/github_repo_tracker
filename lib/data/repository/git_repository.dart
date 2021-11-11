import 'package:http/http.dart' as http;

class GitRepository {
  static final GitRepository _gitRepository = GitRepository._();
  static const int _perPage = 15;
  GitRepository._();

  factory GitRepository() {
    return _gitRepository;
  }

  Future<dynamic> getGitRepos({
    required int page,
  }) async {
    try {
      return await http.get(
        Uri.parse(
          'https://api.github.com/search/repositories?q=created:>2021-10-14&sort=stars&order=desc&per_page=$_perPage&page=$page',
        ),
      );
    } catch (e) {
      return e.toString();
    }
  }
}
