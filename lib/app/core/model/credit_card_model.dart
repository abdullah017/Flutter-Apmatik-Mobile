class CreditCard {
  int? id;
  String? cardHolder;
  String? cardNumber;
  String? cardExpriyDate;
  String? cardCvv;

  CreditCard({
    this.cardHolder,
    this.cardNumber,
    this.cardExpriyDate,
    this.cardCvv,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["cardHolder"] = cardHolder;
    map["cardNumber"] = cardNumber;
    map["cardExpriyDate"] = cardExpriyDate;
    map["cardCvv"] = cardCvv;
    return map;
  }

  CreditCard.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    cardHolder = map["cardHolder"];
    cardNumber = map["cardNumber"];
    cardExpriyDate = map["cardExpriyDate"];
  }
}
