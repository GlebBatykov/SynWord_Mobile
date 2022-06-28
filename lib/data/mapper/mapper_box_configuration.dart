import 'package:mapper_box/mapper_box.dart';

import '../../domain/model/history/check/check_history.dart';
import '../../domain/model/history/check/check_history_check_result_link.dart';
import '../../domain/model/history/rephrase/rephrase_history.dart';
import '../../domain/model/history/rephrase/rephrase_history_rephrased_word.dart';
import '../../domain/model/result/check/check_result.dart';
import '../../domain/model/result/check/check_result_check_result_link.dart';
import '../../domain/model/history/history.dart';
import '../../domain/model/price.dart';
import '../../domain/model/result/rephrase/rephrase_result.dart';
import '../../domain/model/result/rephrase/rephrase_result_rephrased_word.dart';
import '../../domain/model/token.dart';
import '../../domain/model/user.dart';
import '../../presentation/model/page/history/result/check/check_result_info.dart';
import '../../presentation/model/page/history/result/rephrase/rephrase_result_info.dart';
import '../local/database/objectbox/model/object_box_token.dart';
import '../local/database/objectbox/model/object_box_user.dart';
import '../remote/http/api/model/response/check_text/api_check_result_link.dart';
import '../remote/http/api/model/response/check_text/check_text_response.dart';
import '../remote/http/api/model/response/get_history/check/api_check_history.dart';
import '../remote/http/api/model/response/get_history/check/api_check_history_result_link.dart';
import '../remote/http/api/model/response/get_history/get_history_response.dart';
import '../remote/http/api/model/response/get_history/rephrase/api_rephrase_history.dart';
import '../remote/http/api/model/response/get_history/rephrase/api_rephrase_history_rephrased_word.dart';
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

    mapperBox.register<ApiRephrasedWord, RephraseResultRephrasedWord>(
        (object) => RephraseResultRephrasedWord(
            object.sourceText,
            object.synonymWordStartIndex,
            object.synonymWordEndIndex,
            object.synonyms));

    mapperBox.register<RephraseTextResponse, RephraseResult>((object) =>
        RephraseResult(
            object.rephrasedText,
            object.synonyms
                .map((e) => mapperBox
                    .map<ApiRephrasedWord, RephraseResultRephrasedWord>(e))
                .toList()));

    mapperBox.register<ApiCheckResultLink, CheckResultCheckResultLink>(
        (object) => CheckResultCheckResultLink(object.url, object.percent));

    mapperBox.register<CheckTextResponse, CheckResult>((object) => CheckResult(
        object.text,
        object.percent,
        object.matches
            .map((e) => mapperBox
                .map<ApiCheckResultLink, CheckResultCheckResultLink>(e))
            .toList()));

    mapperBox.register<ApiRephraseHistoryRephrasedWord,
            RephraseHistoryRephrasedWord>(
        (object) => RephraseHistoryRephrasedWord(
            object.sourceWord,
            object.synonymWordStartIndex,
            object.synonymWordEndIndex,
            object.synonyms));

    mapperBox.register<ApiRephraseHistory, RephraseHistory>((object) =>
        RephraseHistory(
            object.id,
            object.sourceText,
            object.rephrasedText,
            object.synonyms
                .map((e) => mapperBox.map<ApiRephraseHistoryRephrasedWord,
                    RephraseHistoryRephrasedWord>(e))
                .toList()));

    mapperBox.register<ApiCheckHistoryResultLink, CheckHistoryCheckResultLink>(
        (object) => CheckHistoryCheckResultLink(object.url, object.percent));

    mapperBox.register<ApiCheckHistory, CheckHistory>((object) => CheckHistory(
        object.id,
        object.text,
        object.percent,
        object.matches
            .map((e) => mapperBox
                .map<ApiCheckHistoryResultLink, CheckHistoryCheckResultLink>(e))
            .toList()));

    mapperBox.register<GetHistoryResponse, History>((object) => History(
        object.rephraseHistories
            .map((e) => mapperBox.map<ApiRephraseHistory, RephraseHistory>(e))
            .toList(),
        object.plagiarismCheckHistories
            .map((e) => mapperBox.map<ApiCheckHistory, CheckHistory>(e))
            .toList()));

    mapperBox.register<RephraseHistory, RephraseResultInfo>((object) =>
        RephraseResultInfo(
            object.sourceText,
            object.rephrasedText,
            object.synonyms
                .map((e) => mapperBox.map<RephraseHistoryRephrasedWord,
                    RephraseResultRephrasedWord>(e))
                .toList()));

    mapperBox.register<CheckHistory, CheckResultInfo>((object) =>
        CheckResultInfo(
            object.text,
            object.percent,
            object.matches
                .map((e) => mapperBox.map<CheckHistoryCheckResultLink,
                    CheckResultCheckResultLink>(e))
                .toList()));
  }
}
