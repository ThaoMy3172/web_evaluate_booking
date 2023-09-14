class Index {
  String? index;
  String? branch;
  List<String>? transactions;
  String? type;
  bool? isFinish;

  Index({this.index, this.branch, this.transactions, this.type, this.isFinish});

  Index.fromJson(Map<String, dynamic> json) {
    index = json['index']??'';
    branch = json['branch']??'';
    transactions = json['transactions'].cast<String>() ?? [];
    type = json['type']??'';
    isFinish = json['isFinish']??false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['index'] = index;
    data['branch'] = branch;
    data['transactions'] = transactions;
    data['type'] = type;
    data['isFinish'] = isFinish;
    return data;
  }
}