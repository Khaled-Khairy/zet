abstract class ApiEndpoints {
  ApiEndpoints._();

  static const String baseUrl = 'https://timely-meds.onrender.com';
  static const String signUp = '/api/auth/signup';
  static const String login = '/api/auth/login';
  static const String me = '/api/auth/me';
  static const String forgetPassword = '/api/auth/forget-password';
  static const String verifyCode = '/api/auth/verify-code';
  static const String resetPassword = '/api/auth/reset-password';
  static const String changePassword = '/api/auth/change-password';
  static const String getAlarms = '/api/alarms';
  static const String searchMedicine = '/api/medicines';
  static const String categories = '/api/categories';
  static const String addAlarms = '/api/alarms';
  static const String getRelatives = '/api/relatives';
  static const String getAppSettings = '/api/settings';

  static String deleteAlarm(String id) => '/api/alarms/$id';

  static String editAlarm(String id) => '/api/alarms/$id';

  static String deleteContact(String id) => '/api/relatives/$id';

  static String markDoseAsTaken(String doseId) => '/api/doses/$doseId/taken';

  static String alarm(String alarmId) => '/api/alarms/$alarmId/doses';
}
