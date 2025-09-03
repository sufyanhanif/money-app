class History {
    String? idHistory;
    String? idUser;
    String? type;
    String? data;
    String? total;
    String? details;
    String? createdAt;
    String? updateAt;

    History({
        this.idHistory,
        this.idUser,
        this.type,
        this.data,
        this.total,
        this.details,
        this.createdAt,
        this.updateAt,
    });

    factory History.fromJson(Map<String, dynamic> json) => History(
        idHistory: json["id_history"],
        idUser: json["id_user"],
        type: json["type"],
        data: json["data"],
        total: json["total"],
        details: json["details"],
        createdAt: json["created_at"],
        updateAt: json["update_at"],
    );

    Map<String, dynamic> toJson() => {
        "id_history": idHistory,
        "id_user": idUser,
        "type": type,
        "data": data,
        "total": total,
        "details": details,
        "created_at": createdAt,
        "update_at": updateAt,
    };
}
