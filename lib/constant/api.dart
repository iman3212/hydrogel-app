class AppApi {
  static const String baseUrl = "http://ai-server.hitechprojects.ir:8000/";

   static const login = "${baseUrl}Login/index.php";

  static const FOLDERS = "${baseUrl}customer/folder/index.php";
  static const FOLDER = "${baseUrl}customer/folder/?f_id=";
  static const FOLDER_ADD = "${baseUrl}customer/folder/add/index.php";

  static const TREATMENTS = "${baseUrl}customer/treatment/index.php?f_id=";
  static const TREATMENTS_ADD = "${baseUrl}customer/treatment/add/index.php";
  static const TREATMENTS_FINISHED = "${baseUrl}customer/treatment/finish/index.php?t_id=";
  static const START_FINISHED = "${baseUrl}customer/treatment/start/index.php?t_id=";
  static const SET_DOSAGE = "${baseUrl}customer/treatment/set-dosage/index.php";

  static const DOCTORS = "${baseUrl}customer/doctor/index.php";

  static const String configCameraFrame = "http://192.168.4.1/control?var=framesize&val=6";
  static const String capture = "http://192.168.4.1/capture";
  static const String ONLINE_AI = 'http://148.251.224.230:8686/crack/ai';
  static const String record = "$baseUrl/record/add/index.php";
}
