class MandiData {
  int? created;
  int? updated;
  String? createdDate;
  String? updatedDate;
  String? active;
  String? indexName;
  List<String>? org;
  String? orgType;
  String? source;
  String? title;
  String? externalWsUrl;
  String? visualizable;
  List<Field>? field;
  int? externalWs;
  String? catalogUuid;
  List<String>? sector;
  TargetBucket? targetBucket;
  String? desc;
  String? message;
  String? version;
  String? status;
  int? total;
  int? count;
  String? limit;
  String? offset;
  List<Records>? records;

  MandiData({
    this.created,
    this.updated,
    this.createdDate,
    this.updatedDate,
    this.active,
    this.indexName,
    this.org,
    this.orgType,
    this.source,
    this.title,
    this.externalWsUrl,
    this.visualizable,
    this.field,
    this.externalWs,
    this.catalogUuid,
    this.sector,
    this.targetBucket,
    this.desc,
    this.message,
    this.version,
    this.status,
    this.total,
    this.count,
    this.limit,
    this.offset,
    this.records,
  });

  MandiData.fromJson(Map<String, dynamic> json) {
    created = json['created'];
    updated = json['updated'];
    createdDate = json['created_date'];
    updatedDate = json['updated_date'];
    active = json['active'];
    indexName = json['index_name'];
    org = json['org'].cast<String>();
    orgType = json['org_type'];
    source = json['source'];
    title = json['title'];
    externalWsUrl = json['external_ws_url'];
    visualizable = json['visualizable'];
    if (json['field'] != null) {
      field = <Field>[];
      json['field'].forEach((v) {
        field!.add(Field.fromJson(v));
      });
    }
    externalWs = json['external_ws'];
    catalogUuid = json['catalog_uuid'];
    sector = json['sector'].cast<String>();
    targetBucket = json['target_bucket'] != null
        ? TargetBucket.fromJson(json['target_bucket'])
        : null;
    desc = json['desc'];
    message = json['message'];
    version = json['version'];
    status = json['status'];
    total = json['total'];
    count = json['count'];
    limit = json['limit'];
    offset = json['offset'];
    if (json['records'] != null) {
      records = <Records>[];
      json['records'].forEach((v) {
        records!.add(Records.fromJson(v));
      });
    }
  }
}

class Field {
  String? name;
  String? id;
  String? type;

  Field({this.name, this.id, this.type});

  Field.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['type'] = type;
    return data;
  }
}

class TargetBucket {
  String? field;
  String? index;
  String? type;

  TargetBucket({this.field, this.index, this.type});

  TargetBucket.fromJson(Map<String, dynamic> json) {
    field = json['field'];
    index = json['index'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['field'] = field;
    data['index'] = index;
    data['type'] = type;
    return data;
  }
}

class Records {
  String? state;
  String? district;
  String? market;
  String? commodity;
  String? variety;
  String? grade;
  String? arrivalDate;
  String? minPrice;
  String? maxPrice;
  String? modalPrice;

  Records(
      {this.state,
      this.district,
      this.market,
      this.commodity,
      this.variety,
      this.grade,
      this.arrivalDate,
      this.minPrice,
      this.maxPrice,
      this.modalPrice});

  Records.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    district = json['district'];
    market = json['market'];
    commodity = json['commodity'];
    variety = json['variety'];
    grade = json['grade'];
    arrivalDate = json['arrival_date'];
    minPrice = json['min_price'];
    maxPrice = json['max_price'];
    modalPrice = json['modal_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['state'] = state;
    data['district'] = district;
    data['market'] = market;
    data['commodity'] = commodity;
    data['variety'] = variety;
    data['grade'] = grade;
    data['arrival_date'] = arrivalDate;
    data['min_price'] = minPrice;
    data['max_price'] = maxPrice;
    data['modal_price'] = modalPrice;
    return data;
  }
}

extension RecordUtils on List<Records>? {
  List<String?> get uniqueStates {
    if (this == null) {
      return [];
    }

    return this!.map((record) => record.state).toSet().toList();
  }
}
