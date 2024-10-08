import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class _CupertinoLocalizationsdelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const _CupertinoLocalizationsdelegate();

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      RuCupertimoLocalization.load(locale);

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'ru';

  @override
  bool shouldReload(
          covariant LocalizationsDelegate<CupertinoLocalizations> old) =>
      false;
}

class RuCupertimoLocalization implements CupertinoLocalizations {
  const RuCupertimoLocalization();

  static const LocalizationsDelegate<CupertinoLocalizations> delegate =
      _CupertinoLocalizationsdelegate();

  static const List<String> shortWeekdays = <String>[
    'Пн',
    'Вт',
    'Ср',
    'Чт',
    'Пт',
    'Сб',
    'Вс',
  ];

  static const List<String> _shortMonths = <String>[
    'Янв',
    'Фев',
    'Мар',
    'Апр',
    'Май',
    'Июн',
    'Июл',
    'Авн',
    'Сен',
    'Окт',
    'Ноя',
    'Дек',
  ];

  static const List<String> _months = [
    'Январь',
    'Февраль',
    'Март',
    'Апрель',
    'Май',
    'Июнь',
    'Июль',
    'Август',
    'Сентябрь',
    'Октябрь',
    'Ноябрь',
    'Декабрь',
  ];

  @override
  String get alertDialogLabel => 'Оповещение';

  @override
  String get anteMeridiemAbbreviation => 'ДП';

  @override
  String get copyButtonLabel => 'Копировать';

  @override
  String get cutButtonLabel => 'Вырезать';

  @override
  DatePickerDateOrder get datePickerDateOrder => DatePickerDateOrder.mdy;

  @override
  DatePickerDateTimeOrder get datePickerDateTimeOrder =>
      DatePickerDateTimeOrder.date_time_dayPeriod;

  @override
  String datePickerDayOfMonth(int dayIndex, [int? weekDay]) {
    if (weekDay != null) {
      return ' ${shortWeekdays[weekDay - DateTime.monday]} $dayIndex ';
    }

    return dayIndex.toString();
  }

  @override
  String datePickerHour(int hour) => hour.toString();

  @override
  String? datePickerHourSemanticsLabel(int hour) => 'Семантическая метка часа';

  @override
  String datePickerMediumDate(DateTime date) {
    return '${shortWeekdays[date.weekday - DateTime.monday]} '
        '${_shortMonths[date.month - DateTime.january]} '
        '${date.day.toString().padRight(2)}';
  }

  @override
  String datePickerMinute(int minute) => minute.toString();

  @override
  String? datePickerMinuteSemanticsLabel(int minute) =>
      'Семантическая метка минуты';

  @override
  String datePickerMonth(int monthIndex) => _months[monthIndex - 1];

  @override
  String datePickerYear(int yearIndex) => yearIndex.toString();

  @override
  String get modalBarrierDismissLabel => 'Закрыть';

  @override
  String get noSpellCheckReplacementsLabel => 'Нет вариантов замены';

  @override
  String get pasteButtonLabel => 'Вставить';

  @override
  String get postMeridiemAbbreviation => 'ПП';

  @override
  String get searchTextFieldPlaceholderLabel => 'Поиск';

  @override
  String get selectAllButtonLabel => 'Выбрать все';

  @override
  String tabSemanticsLabel({required int tabIndex, required int tabCount}) =>
      'Метка вкладки $tabIndex из $tabCount';

  @override
  String? timerPickerHourLabel(int hour) => 'Часы';

  @override
  String? timerPickerMinuteLabel(int minute) => 'Минуты';

  @override
  String timerPickerHour(int hour) => hour.toString();

  @override
  String timerPickerMinute(int minute) => minute.toString();

  @override
  String timerPickerSecond(int second) => second.toString();

  @override
  String? timerPickerSecondLabel(int second) => 'Секунды';

  @override
  List<String> get timerPickerHourLabels => ['Часы'];

  @override
  List<String> get timerPickerMinuteLabels => ['Минуты'];

  @override
  List<String> get timerPickerSecondLabels => ['Секунды'];

  @override
  String get todayLabel => 'Сегодня';

  static Future<CupertinoLocalizations> load(Locale locale) {
    return SynchronousFuture<CupertinoLocalizations>(
        const RuCupertimoLocalization());
  }

  @override
  String get clearButtonLabel => 'Очистить';

  @override
  String datePickerStandaloneMonth(int monthIndex) => _months[monthIndex - 1];

  @override
  String get lookUpButtonLabel => 'Найти';

  @override
  String get menuDismissLabel => 'Закрыть';

  @override
  String get searchWebButtonLabel => 'Поиск';

  @override
  String get shareButtonLabel => 'Поделиться';
}
