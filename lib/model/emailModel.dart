// ignore_for_file: file_names

import 'dart:convert';

Email emailFromJson(String str) => Email.fromJson(json.decode(str));
String emailToJson(Email data) => json.encode(data.toJson());

class Email {
    final String? kepada;
    final String? subjek;
    final String? isi;
    final String? id;

    Email({
        required this.kepada,
        required this.subjek,
        required this.isi,
        required this.id,
    });

    factory Email.fromJson(Map<String, dynamic> json) => Email(
        kepada: json["kepada"],
        subjek: json["subjek"],
        isi: json["isi"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "kepada": kepada,
        "subjek": subjek,
        "isi": isi,
        "id": id,
    };
}
