// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart';
import '../model/emailModel.dart';

class EmailService {
  final String apiUrl =
      "https://62c30d98876c4700f5357dad.mockapi.io/api/v1/email";

  Future<List<Email>> getEmail() async {
    Response response = await get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Email> emails =
          body.map((dynamic item) => Email.fromJson(item)).toList();

      return emails;
    } else {
      throw "Gagal mengambil data email!";
    }
  }

  Future<Email> getEmailById(String id) async {
    final response = await get(Uri.parse(apiUrl + "/$id"));

    if (response.statusCode == 200) {
      return Email.fromJson(json.decode(response.body));
    } else {
      throw Exception("Gagal mengambil data email!");
    }
  }

  Future<Email> sendEmail(Email email) async {
    Map data = {
      "kepada": email.kepada,
      "subjek": email.subjek,
      "isi": email.isi,
    };

    final Response response = await post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 201) {
      return Email.fromJson(json.decode(response.body));
    } else {
      throw Exception("Gagal mengirim email!");
    }
  }

  Future<Email> updateEmail(String id, Email email) async {
    Map data = {
      "kepada": email.kepada,
      "subjek": email.subjek,
      "isi": email.isi,
    };

    final Response response = await put(
      Uri.parse(apiUrl + "/$id"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      return Email.fromJson(json.decode(response.body));
    } else {
      throw Exception("Gagal mengupdate email!");
    }
  }

  Future<void> deleteEmail(String id) async {
    Response res = await delete(Uri.parse(apiUrl + "/$id"));

    if (res.statusCode == 200) {
      print("Email deleted");
    } else {
      throw "Gagal menghapus email.";
    }
  }
}
