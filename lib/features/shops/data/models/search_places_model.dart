class PredictionModel {
  final String description;
  final String placeId;
  final String reference;
  final List<MatchedSubstring> matchedSubstrings;
  final StructuredFormatting structuredFormatting;
  final List<Term> terms;
  final List<String> types;

  PredictionModel({
    required this.description,
    required this.placeId,
    required this.reference,
    required this.matchedSubstrings,
    required this.structuredFormatting,
    required this.terms,
    required this.types,
  });

  factory PredictionModel.fromJson(Map<String, dynamic> json) {
    return PredictionModel(
      description: json['description'],
      placeId: json['place_id'],
      reference: json['reference'],
      matchedSubstrings: (json['matched_substrings'] as List)
          .map((e) => MatchedSubstring.fromJson(e))
          .toList(),
      structuredFormatting:
          StructuredFormatting.fromJson(json['structured_formatting']),
      terms:
          (json['terms'] as List).map((e) => Term.fromJson(e)).toList(),
      types: List<String>.from(json['types']),
    );
  }
}

class MatchedSubstring {
  final int length;
  final int offset;

  MatchedSubstring({
    required this.length,
    required this.offset,
  });

  factory MatchedSubstring.fromJson(Map<String, dynamic> json) {
    return MatchedSubstring(
      length: json['length'],
      offset: json['offset'],
    );
  }
}

class StructuredFormatting {
  final String mainText;
  final List<MatchedSubstring> mainTextMatchedSubstrings;
  final String secondaryText;

  StructuredFormatting({
    required this.mainText,
    required this.mainTextMatchedSubstrings,
    required this.secondaryText,
  });

  factory StructuredFormatting.fromJson(Map<String, dynamic> json) {
    return StructuredFormatting(
      mainText: json['main_text'],
      mainTextMatchedSubstrings:
          (json['main_text_matched_substrings'] as List)
              .map((e) => MatchedSubstring.fromJson(e))
              .toList(),
      secondaryText: json['secondary_text'],
    );
  }
}

class Term {
  final int offset;
  final String value;

  Term({
    required this.offset,
    required this.value,
  });

  factory Term.fromJson(Map<String, dynamic> json) {
    return Term(
      offset: json['offset'],
      value: json['value'],
    );
  }
}
