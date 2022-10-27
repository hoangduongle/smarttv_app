import 'package:smarttv_app/app/core/base/base_controller.dart';
import 'package:smarttv_app/app/modules/feedback/models/radioButton.dart';

class FeedbackController extends BaseController {
  FeedbackState state = FeedbackState.normal;

  List<FeedbackState> list = [FeedbackState.normal];

  @override
  void onInit() {
    for (int i = 0; i < 9; i++) {
      list.add(state);
    }
    super.onInit();
  }
}
