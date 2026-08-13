abstract final class AppRoutes {
  static const settings = '/settings';
  static const repairs = '/repairs';
  static const addService = '/repairs/add';
  static const papers = '/papers';
  static const addDocument = '/papers/add';
  static const reminders = '/reminders';
  static const reports = '/reports';
  static const garage = '/garage';
  static const addVehicle = '/garage/add';
  static const carDetail = '/cars/:id';

  static String carDetailPath(String id) => '/cars/$id';

  static String addServicePath(String category) =>
      '$addService?category=$category';

  static String editServicePath(String id) => '$addService?id=$id';

  static String addDocumentPath(String category) =>
      '$addDocument?category=$category';

  static String editDocumentPath(String id) => '$addDocument?id=$id';
}
