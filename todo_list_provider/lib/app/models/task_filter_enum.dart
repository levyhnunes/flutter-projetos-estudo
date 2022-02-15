enum TaskFilterEnum {
  today,
  tomorrow,
  week,
}

extension TaskFilterDescription on TaskFilterEnum {
  String get descrition {
    switch (this) {
      case TaskFilterEnum.today:
        return 'DE HOJE';
      case TaskFilterEnum.tomorrow:
        return 'DE AMANHÃ';
      case TaskFilterEnum.week:
        return 'DA SEMANA';
    }
  }
}
