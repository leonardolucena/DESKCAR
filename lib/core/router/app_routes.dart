abstract final class AppRoutes {
  static const repairs = '/repairs';
  static const papers = '/papers';
  static const reminders = '/reminders';
  static const reports = '/reports';
  static const garage = '/garage';
  static const carDetail = '/cars/:id';

  static String carDetailPath(String id) => '/cars/$id';
}
