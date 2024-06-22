import 'package:EcomStack/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:EcomStack/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:EcomStack/ui/views/home/Mainhome/Mainhome_view.dart';
import 'package:EcomStack/ui/views/home/home_view.dart';
import 'package:EcomStack/ui/views/intro/intro_view.dart';
import 'package:EcomStack/ui/views/logsign/login/login_view.dart';
import 'package:EcomStack/ui/views/logsign/signup/signup_view.dart';
import 'package:EcomStack/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: LoginView),
    MaterialRoute(page: MainHome),
    MaterialRoute(page: SignupView),
    MaterialRoute(page: IntroView),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    // @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
