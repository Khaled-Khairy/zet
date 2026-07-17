class FailureMessages {
  // ───────────── Network Errors ─────────────
  static String connectionTimeout = 'انتهت مهلة الاتصال بالخادم، يرجى المحاولة مرة أخرى';

  static String sendTimeout = 'استغرق إرسال الطلب وقتًا طويلًا، يرجى التحقق من اتصالك والمحاولة مرة أخرى';

  static String receiveTimeout = 'استغرق استلام البيانات وقتًا طويلًا، يرجى المحاولة مرة أخرى';

  static String transformTimeout = 'استغرق معالجة البيانات وقتًا طويلًا، يرجى المحاولة مرة أخرى';

  static String noInternet = 'لا يوجد اتصال بالإنترنت، يرجى التحقق من الشبكة والمحاولة مرة أخرى';

  static String connectionError = 'حدث خطأ أثناء الاتصال، يرجى التحقق من الإنترنت والمحاولة لاحقًا';

  static String badCertificate = 'تعذر التحقق من أمان الاتصال، يرجى المحاولة لاحقًا';

  // ───────────── Auth & Permission Errors ─────────────
  static String unauthorized = 'يرجى تسجيل الدخول مرة أخرى للمتابعة';

  static String forbidden = 'ليس لديك صلاحية لتنفيذ هذا الإجراء';

  // ───────────── Request & Validation Errors ─────────────
  static String badRequest = 'الطلب غير صحيح، يرجى مراجعة البيانات والمحاولة مرة أخرى';

  static String invalidDataProvided = 'البيانات المدخلة غير صحيحة، يرجى التحقق منها';

  static String notFound = 'لم يتم العثور على البيانات المطلوبة';

  static String requestTimeout = 'انتهت مهلة الطلب، يرجى المحاولة مرة أخرى';

  static String conflict = 'يوجد تعارض في البيانات، يرجى التحقق والمحاولة مرة أخرى';

  // ───────────── Server Errors ─────────────
  static String internalServerError = 'حدث خطأ في الخادم، يرجى المحاولة لاحقًا';

  static String serviceUnavailable = 'الخدمة غير متاحة حاليًا، يرجى المحاولة لاحقًا';

  // ───────────── General Errors ─────────────
  static String cancelled = 'تم إلغاء العملية';

  static String unknown = 'حدث خطأ غير متوقع، يرجى المحاولة مرة أخرى';
}
