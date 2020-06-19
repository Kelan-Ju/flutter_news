class LabsModel {
  Meta meta;
  ResponseModel response;

  LabsModel({this.meta, this.response});

  LabsModel.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    response = json['response'] != null
        ? new ResponseModel.fromJson(json['response'])
        : null;
  }
}

class Meta {
  int status;
  String msg;

  Meta({this.status, this.msg});

  Meta.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    return data;
  }
}

class ResponseModel {
  int lastKey;
  bool hasMore;
  List<LabsFeed> feeds;
  List<Null> feedsAd;
  List<PaperTopics> paperTopics;

  ResponseModel(
      {this.lastKey, this.hasMore, this.feeds, this.feedsAd, this.paperTopics});

  ResponseModel.fromJson(Map<String, dynamic> json) {
    lastKey = json['last_key'];
    hasMore = json['has_more'];
    if (json['feeds'] != null) {
      feeds = new List<LabsFeed>();
      json['feeds'].forEach((v) {
        feeds.add(new LabsFeed.fromJson(v));
      });
    }
    if (json['paper_topics'] != null) {
      paperTopics = new List<PaperTopics>();
      json['paper_topics'].forEach((v) {
        paperTopics.add(new PaperTopics.fromJson(v));
      });
    }
  }
}

class LabsFeed {
  String image;
  int type;
  PostModel post;

  LabsFeed({this.image, this.type, this.post});

  LabsFeed.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    type = json['type'];
    post = json['post'] != null ? new PostModel.fromJson(json['post']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['type'] = this.type;
    if (this.post != null) {
      data['post'] = this.post.toJson();
    }
    return data;
  }
}

class PostModel {
  int id;
  int genre;
  String title;
  String description;
  int recordCount;
  int commentCount;
  bool commentStatus;
  int praiseCount;
  int publishTime;
  String image;
  int postId;
  int pageStyle;
  String filmLength;
  String datatype;
  Category category;
  ColumnModel column;

  PostModel(
      {this.id,
      this.genre,
      this.title,
      this.description,
      this.recordCount,
      this.commentCount,
      this.commentStatus,
      this.praiseCount,
      this.publishTime,
      this.image,
      this.postId,
      this.pageStyle,
      this.filmLength,
      this.datatype,
      this.category,
      this.column});

  PostModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    genre = json['genre'];
    title = json['title'];
    description = json['description'];
    recordCount = json['record_count'];
    commentCount = json['comment_count'];
    commentStatus = json['comment_status'];
    praiseCount = json['praise_count'];
    publishTime = json['publish_time'];
    image = json['image'];
    postId = json['post_id'];
    pageStyle = json['page_style'];
    filmLength = json['film_length'];
    datatype = json['datatype'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    column =
        json['column'] != null ? new ColumnModel.fromJson(json['column']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['genre'] = this.genre;
    data['title'] = this.title;
    data['description'] = this.description;
    data['record_count'] = this.recordCount;
    data['comment_count'] = this.commentCount;
    data['comment_status'] = this.commentStatus;
    data['praise_count'] = this.praiseCount;
    data['publish_time'] = this.publishTime;
    data['image'] = this.image;
    data['post_id'] = this.postId;
    data['page_style'] = this.pageStyle;
    data['film_length'] = this.filmLength;
    data['datatype'] = this.datatype;
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    if (this.column != null) {
      data['column'] = this.column.toJson();
    }
    return data;
  }
}

class Category {
  int id;
  String title;
  String normal;
  String normalHl;
  String imageLab;
  String imageExperiment;

  Category(
      {this.id,
      this.title,
      this.normal,
      this.normalHl,
      this.imageLab,
      this.imageExperiment});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    normal = json['normal'];
    normalHl = json['normal_hl'];
    imageLab = json['image_lab'];
    imageExperiment = json['image_experiment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['normal'] = this.normal;
    data['normal_hl'] = this.normalHl;
    data['image_lab'] = this.imageLab;
    data['image_experiment'] = this.imageExperiment;
    return data;
  }
}

class ColumnModel {
  int id;
  String name;
  String description;
  bool subscribeStatus;
  String icon;
  String image;
  String imageLarge;
  String contentProvider;
  int showType;
  int genre;
  int subscriberNum;
  int postCount;
  String sortTime;
  String columnTag;
  Null location;
  Share share;

  ColumnModel(
      {this.id,
      this.name,
      this.description,
      this.subscribeStatus,
      this.icon,
      this.image,
      this.imageLarge,
      this.contentProvider,
      this.showType,
      this.genre,
      this.subscriberNum,
      this.postCount,
      this.sortTime,
      this.columnTag,
      this.location,
      this.share});

  ColumnModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    subscribeStatus = json['subscribe_status'];
    icon = json['icon'];
    image = json['image'];
    imageLarge = json['image_large'];
    contentProvider = json['content_provider'];
    showType = json['show_type'];
    genre = json['genre'];
    subscriberNum = json['subscriber_num'];
    postCount = json['post_count'];
    sortTime = json['sort_time'];
    columnTag = json['column_tag'];
    location = json['location'];
    share = json['share'] != null ? new Share.fromJson(json['share']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['subscribe_status'] = this.subscribeStatus;
    data['icon'] = this.icon;
    data['image'] = this.image;
    data['image_large'] = this.imageLarge;
    data['content_provider'] = this.contentProvider;
    data['show_type'] = this.showType;
    data['genre'] = this.genre;
    data['subscriber_num'] = this.subscriberNum;
    data['post_count'] = this.postCount;
    data['sort_time'] = this.sortTime;
    data['column_tag'] = this.columnTag;
    data['location'] = this.location;
    if (this.share != null) {
      data['share'] = this.share.toJson();
    }
    return data;
  }
}

class Share {
  String url;
  String title;
  String text;
  String image;

  Share({this.url, this.title, this.text, this.image});

  Share.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    title = json['title'];
    text = json['text'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['title'] = this.title;
    data['text'] = this.text;
    data['image'] = this.image;
    return data;
  }
}

class PaperTopics {
  int id;
  int insertLocation;
  List<InsertContent> insertContent;

  PaperTopics({this.id, this.insertLocation, this.insertContent});

  PaperTopics.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    insertLocation = json['insert_location'];
    if (json['insert_content'] != null) {
      insertContent = new List<InsertContent>();
      json['insert_content'].forEach((v) {
        insertContent.add(new InsertContent.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['insert_location'] = this.insertLocation;
    if (this.insertContent != null) {
      data['insert_content'] =
          this.insertContent.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class InsertContent {
  int id;
  String icon;
  String title;
  String description;
  String image;

  InsertContent({this.id, this.icon, this.title, this.description, this.image});

  InsertContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    icon = json['icon'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['icon'] = this.icon;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    return data;
  }
}

