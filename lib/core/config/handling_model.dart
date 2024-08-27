class ResultModel {
  get resutlAsList => null;
}

class ErrorModel extends ResultModel {
  String message;
  ErrorModel({
    required this.message,
  });
}

class ExceptionModel extends ResultModel {
  String message;
  ExceptionModel({
    required this.message,
  });
}

class DataSuccess extends ResultModel {}

class ListOf<T> extends ResultModel {
  List<T> resutlAsList;
  ListOf({
    required this.resutlAsList,
  });
  // List<T> listOfData;
  // ListOf({
  //   required this.listOfData, required List<dynamic> resutlAsList,
  // });
}
