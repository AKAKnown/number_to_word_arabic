library number_to_word_arabic;




enum Language {
  LYD("دينار", 'درهم'),
  EGP("جنية", 'فلس'),
  SAR("ليرة", 'قرش'),
  IQD("دينار", 'فلس');

  const Language(this.code, this.description);
  final String code;
  final String description;

  @override
  String toString() => 'StatusCode($code, $description)';
}
class NumberToWords {
  static final List _LESS_THAN_20 = [
    "",
    "واحد",
    "اثنان",
    "ثلاته",
    "أربعة",
    "خمسة",
    "ستة",
    "سبعة",
    "ثمانية",
    "تسعة",
    "عشرة",
    "أحد عشر",
    "اثنا عشر",
    "ثلاثة عشر",
    "أربعة عشر",
    "خمسة عشر",
    "ستة عشر",
    "سبعة عشر",
    "ثمانية عشر",
    "تسعة عشر"
  ];
  static final List _TENS = [
    "",
    "عشرة",
    "عشرون",
    "ثلاثون",
    "أربعون",
    "خمسون",
    "ستون",
    "سبعون",
    "ثمانون",
    "تسعون"
  ];
  static final List _HAUNDRES = [
    "",
    "مائة",
    "مئتان",
    "ثلاثمائة",
    "أربعمائة",
    "خمسمائة",
    "ستمائة",
    "سبعمائة",
    "ثمانمئة",
    "تسعومائة"
  ];
  static final List _THOUSANDS = ["", "ألف", "مليون", "مليار"];
  static final List _THOUSANDS_TOW = ["", "ألفان", "مليونان", "ملياران"];
  static final List _THOUSANDS_TEN = ["", "آلاف", "ملايين", "مليارات"];

  static final List _THOUSANDS_SUM = [
    "",
    "ألفاً",
    "مليوناً",
    "ملياراً",
  ];

  static String numberToWords(int num,{Language language=Language.LYD}) {
    if (num == 0) return "صفر";
    int i = 0;
    String words = "";
    String andText;
    while (num > 0) {
      if (num % 1000 != 0) {
        print(num % 1000);
        String resulte = _helper(num % 1000);
        // print(resulte);
        andText = (words.isEmpty) ? "  " : " و";
        int x=num%1000;
        // if(x>2 &&x<11){
        //   words = "${resulte + ' ' + tho[3][i] + andText} $words ";
        // }else{
        //   words = "${resulte + ' ' + tho[x][i] + andText} $words ";
        // }
        // if (resulte == "واحد ") {
        //   words = _THOUSANDS[i] + andText + words;
        // } else if (resulte == "اثنين ") {
        //   words = _THOUSANDS_TOW[i] + andText + words;
        // } else {
        //   words = "${resulte + ' ' + _THOUSANDS_SUM[i] + andText} $words ";
        // }
        if (x==1) {
          words =(i==0)?resulte: _THOUSANDS[i] + andText + words;
        } else if (x==2) {
          words = (i==0)?resulte:_THOUSANDS_TOW[i] + andText + words;
        } else if(x>2 &&x<11){
          words = "${resulte + ' ' +_THOUSANDS_TEN[i]  + andText} $words ";
        }
        else {
          words = "${resulte + ' ' + _THOUSANDS_SUM[i] + andText} $words ";
        }
      }

      num = (num / 1000).floor();
      i++;
    }

    return words.trim()+' '+language.code;
  }
  static String numberToWordsDeimel(String number,{Language language=Language.LYD}) {
    List<String> splitingNumber=number.split('.');

    print(splitingNumber.length);
    int num=int.parse(splitingNumber.first);
    int de=int.parse(splitingNumber.last);
    if (num == 0) return "صفر";

    int i = 0;
    String words = "";
    String andText;
    while (num > 0) {
      if (num % 1000 != 0) {
        print(num % 1000);
        String resulte = _helper(num % 1000);
        // print(resulte);
        andText = (words.isEmpty) ? "  " : " و";
        int x=num%1000;
        // if(x>2 &&x<11){
        //   words = "${resulte + ' ' + tho[3][i] + andText} $words ";
        // }else{
        //   words = "${resulte + ' ' + tho[x][i] + andText} $words ";
        // }
        // if (resulte == "واحد ") {
        //   words = _THOUSANDS[i] + andText + words;
        // } else if (resulte == "اثنين ") {
        //   words = _THOUSANDS_TOW[i] + andText + words;
        // } else {
        //   words = "${resulte + ' ' + _THOUSANDS_SUM[i] + andText} $words ";
        // }
        if (x==1) {
          words =(i==0)?resulte: _THOUSANDS[i] + andText + words;
        } else if (x==2) {
          words = (i==0)?resulte:_THOUSANDS_TOW[i] + andText + words;
        } else if(x>2 &&x<11){
          words = "${resulte + ' ' +_THOUSANDS_TEN[i]  + andText} $words ";
        }
        else {
          words = "${resulte + ' ' + _THOUSANDS_SUM[i] + andText} $words ";
        }
      }

      num = (num / 1000).floor();
      i++;
    }

    return words.trim()+' '+language.code+' ';
  }

  static String _helper(int num) {
    if (num == 0) {
      return "";
    } else if (num < 20) {
      return _LESS_THAN_20[num] + "";
    } else if (num < 100) {
      String andText=(num%10==0)?" ":" و ";
      return _helper(num % 10) + andText + _TENS[(num / 10).floor()];
    } else {
      String andText=(num%100==0)?" ":" و ";
      return _HAUNDRES[(num / 100).floor()] + andText + _helper(num % 100);
    }
  }
}
