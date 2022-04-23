enum TextSource { userInput, docx, pdf }

abstract class ResultInfo {
  final String text;

  final TextSource source;

  ResultInfo(this.text, this.source);
}
