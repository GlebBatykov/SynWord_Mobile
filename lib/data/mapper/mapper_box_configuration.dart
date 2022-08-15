import 'package:mapper_box/mapper_box.dart';

import '../../domain/model/contraints_list/contraints_list.dart';
import '../../domain/model/contraints_list/user_contraints.dart';
import '../../domain/model/history/check/check_history.dart';
import '../../domain/model/history/check/check_history_check_result_link.dart';
import '../../domain/model/history/rephrase/rephrase_history.dart';
import '../../domain/model/history/rephrase/rephrase_history_rephrased_word.dart';
import '../../domain/model/result/check/check_result.dart';
import '../../domain/model/result/check/check_result_check_result_link.dart';
import '../../domain/model/history/history.dart';
import '../../domain/model/result/rephrase/enhanced_rephrase_result.dart';
import '../../domain/model/result/rephrase/rephrase_result.dart';
import '../../domain/model/result/rephrase/rephrase_result_rephrased_word.dart';
import '../../domain/model/token.dart';
import '../../domain/model/user/user.dart';
import '../../domain/model/user/user_authorization_data.dart';
import '../../presentation/model/page/history/result/check/check_result_info.dart';
import '../../presentation/model/page/history/result/rephrase/rephrase_result_info.dart';
import '../local/database/objectbox/model/object_box_user.dart';
import '../local/database/objectbox/model/object_box_user_authorization_data.dart';
import '../remote/http/api/model/response/check_text/api_check_result_link.dart';
import '../remote/http/api/model/response/check_text/check_text_response.dart';
import '../remote/http/api/model/response/get_contraints_list/get_contraints_list_response.dart';
import '../remote/http/api/model/response/get_contraints_list/user_contraints_item.dart';
import '../remote/http/api/model/response/get_history/check/api_check_history.dart';
import '../remote/http/api/model/response/get_history/check/api_check_history_result_link.dart';
import '../remote/http/api/model/response/get_history/get_history_response.dart';
import '../remote/http/api/model/response/get_history/rephrase/api_rephrase_history.dart';
import '../remote/http/api/model/response/get_history/rephrase/api_rephrase_history_rephrased_word.dart';
import '../remote/http/api/model/response/rephrase_text/api_rephrased_word.dart';
import '../remote/http/api/model/response/rephrase_text/enhanced_rephrase_text_response.dart';
import '../remote/http/api/model/response/rephrase_text/rephrase_text_response.dart';

class MapperBoxConfiguration {
  void configurate() {
    var mapperBox = MapperBox.instanse;

    mapperBox.register<ObjectBoxUserAuthorizationData, UserAuthorizationData?>(
        (object) => object.accessToken != null || object.refreshToken != null
            ? UserAuthorizationData(
                Token(object.accessToken!), Token(object.refreshToken!))
            : null);
    mapperBox.register<UserAuthorizationData, ObjectBoxUserAuthorizationData>(
        (object) => ObjectBoxUserAuthorizationData(
            accessToken: object.accessToken.token,
            refreshToken: object.refreshToken.token));

    mapperBox.register<ObjectBoxUser, User>((object) {
      var authorizationData = object.authorizationData.target != null
          ? mapperBox.map<ObjectBoxUserAuthorizationData,
              UserAuthorizationData?>(object.authorizationData.target!)
          : null;

      return User(id: object.userId, authorizationData: authorizationData);
    });
    mapperBox.register<User, ObjectBoxUser>((object) {
      var objectBoxUser = ObjectBoxUser(userId: object.id);

      if (object.authorizationData != null) {
        objectBoxUser.authorizationData.target = mapperBox.map<
            UserAuthorizationData,
            ObjectBoxUserAuthorizationData>(object.authorizationData!);
      }

      return objectBoxUser;
    });

    mapperBox.register<UserContraintsItem, UserContraints>((object) =>
        UserContraints(
            object.plagiarismCheckMaxSymbolLimit,
            object.rephraseMaxSymbolLimit,
            object.enhancedRephraseMaxSymbolLimit));

    mapperBox.register<GetContraintsListResponse, ContraintsList>((object) =>
        ContraintsList(
            mapperBox.map<UserContraintsItem, UserContraints>(object.guest),
            mapperBox.map<UserContraintsItem, UserContraints>(object.silver),
            mapperBox.map<UserContraintsItem, UserContraints>(object.gold)));

    mapperBox.register<ApiRephrasedWord, RephraseResultRephrasedWord>(
        (object) => RephraseResultRephrasedWord(
            object.sourceWord,
            object.synonymWordStartIndex,
            object.synonymWordEndIndex,
            object.synonyms.map((e) => e.value).toList()));

    mapperBox.register<RephraseTextResponse, RephraseResult>((object) =>
        RephraseResult(
            object.rephrasedText,
            object.synonyms
                .map((e) => mapperBox
                    .map<ApiRephrasedWord, RephraseResultRephrasedWord>(e))
                .toList()));

    mapperBox.register<EnhancedRephraseTextResponse, EnhancedRephraseResult>(
        (object) => EnhancedRephraseResult(object.rephrasedText));

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
            object.synonyms.map((e) => e.value).toList()));

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
        object.percent.toDouble(),
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

    mapperBox
        .register<RephraseHistoryRephrasedWord, RephraseResultRephrasedWord>(
            (object) => RephraseResultRephrasedWord(
                object.sourceWord,
                object.synonymWordStartIndex,
                object.synonymWordEndIndex,
                object.synonyms));

    mapperBox.register<RephraseHistory, RephraseResultInfo>((object) =>
        RephraseResultInfo(
            object.sourceText,
            object.rephrasedText,
            object.synonyms
                .map((e) => mapperBox.map<RephraseHistoryRephrasedWord,
                    RephraseResultRephrasedWord>(e))
                .toList()));

    mapperBox.register<CheckHistoryCheckResultLink, CheckResultCheckResultLink>(
        (object) => CheckResultCheckResultLink(object.url, object.percent));

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
