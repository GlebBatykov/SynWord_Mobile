import 'package:mapper_box/mapper_box.dart';

import '../../domain/model/check/check_result.dart';
import '../../domain/model/check/check_result_link.dart';
import '../../domain/model/history.dart';
import '../../domain/model/price.dart';
import '../../domain/model/rephrase/rephrase_result.dart';
import '../../domain/model/rephrase/rephrased_word.dart';
import '../../domain/model/token.dart';
import '../../domain/model/user.dart';
import '../local/database/objectbox/model/object_box_token.dart';
import '../local/database/objectbox/model/object_box_user.dart';
import '../remote/http/api/model/response/check_text/api_check_result_link.dart';
import '../remote/http/api/model/response/check_text/check_text_response.dart';
import '../remote/http/api/model/response/get_history_response.dart';
import '../remote/http/api/model/response/get_price_list/price_item.dart';
import '../remote/http/api/model/response/rephrase_text/api_rephrased_word.dart';
import '../remote/http/api/model/response/rephrase_text/rephrase_text_response.dart';

class MapperBoxConfiguration {
  void configurate() {
    var mapperBox = MapperBox.instanse;

    mapperBox.register<ObjectBoxToken, Token?>(
        (object) => object.token != null ? Token(object.token!) : null);
    mapperBox.register<Token, ObjectBoxToken>(
        (object) => ObjectBoxToken(token: object.token));

    mapperBox.register<ObjectBoxUser, User>((object) {
      var token = object.token.target != null
          ? mapperBox.map<ObjectBoxToken, Token?>(object.token.target!)
          : null;

      return User(
          id: object.userId, token: token, accessToken: object.accessToken);
    });
    mapperBox.register<User, ObjectBoxUser>((object) {
      var objectBoxUser =
          ObjectBoxUser(userId: object.id, accessToken: object.accessToken);

      if (object.token != null) {
        objectBoxUser.token.target =
            mapperBox.map<Token, ObjectBoxToken>(object.token!);
      }

      return objectBoxUser;
    });

    mapperBox.register<PriceItem, Price>(
        (object) => Price(object.itemName, object.price));

    mapperBox.register<ApiRephrasedWord, RephrasedWord>((object) =>
        RephrasedWord(object.sourceText, object.synonymWordStartIndex,
            object.synonymWordEndIndex, object.synonyms));

    mapperBox.register<RephraseTextResponse, RephraseResult>((object) =>
        RephraseResult(
            object.rephrasedText,
            object.synonyms
                .map((e) => mapperBox.map<ApiRephrasedWord, RephrasedWord>(e))
                .toList()));

    mapperBox.register<ApiCheckResultLink, CheckResultLink>(
        (object) => CheckResultLink(object.url, object.percent));

    mapperBox.register<CheckTextResponse, CheckResult>((object) => CheckResult(
        object.text,
        object.percent,
        object.matches
            .map((e) => mapperBox.map<ApiCheckResultLink, CheckResultLink>(e))
            .toList()));

    mapperBox.register<GetHistoryResponse, History>((object) => History(
        object.rephraseHistories
            .map((e) => mapperBox.map<RephraseTextResponse, RephraseResult>(e))
            .toList(),
        object.plagiarismCheckHistories
            .map((e) => mapperBox.map<CheckTextResponse, CheckResult>(e))
            .toList()));
  }
}
