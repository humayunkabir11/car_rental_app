
import 'package:get/get.dart';
import 'package:renti_user/view/screens/settings/change_language/language_name/english.dart';

import 'package:renti_user/view/screens/settings/change_language/language_name/spanish.dart';


class Language extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    "en_US" : english,
    "es_MX" : spanish
  };
}