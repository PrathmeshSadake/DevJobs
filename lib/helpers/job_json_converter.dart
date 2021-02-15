import './date_formatter.dart';
import '../models/job.dart';

class JsonConverter {
  void jsonConverter(dynamic data, List<Job> list) {
    if (data['company_logo'] != null &&
        data['company_url'] != null &&
        data['url'] != null)
      list.add(
        Job(
          id: data['id'],
          type: data['type'],
          url: data['url'],
          createdAt: DateFormatter().formatter(
            data['created_at'],
          ),
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
