import 'package:share_plus/share_plus.dart';

class ConstFuncRepository {
 static void shareLink(String data) {
    Share.share(data);
  }
}