import 'package:DevJobs/models/job.dart';

class JsonConverter {
  void jsonConverter(dynamic data, List<Job> list) {
    list.add(
      Job(
        id: data['id'],
        type: data['type'],
        url: data['url'],
        createdAt: data['created_at'],
        company: data['company'],
        companyUrl: data['company_url'],
        location: data['location'],
        title: data['title'],
        description: data['description'],
        howToApply: data['how_to_apply'],
        companyLogo: data['company_logo'],
      ),
    );
  }
}
