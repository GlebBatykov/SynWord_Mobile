class RephraseHistoryRephrasedWord {
  final String sourceWord;

  final int synonymWordStartIndex;

  final int synonymWordEndIndex;

  final List<String> synonyms;

  RephraseHistoryRephrasedWord(this.sourceWord, this.synonymWordStartIndex,
      this.synonymWordEndIndex, this.synonyms);
}
