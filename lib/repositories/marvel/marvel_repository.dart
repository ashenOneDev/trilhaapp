import 'dart:convert';

import 'package:crypto/crypto.dart' as crypto;
import 'package:convert/convert.dart';

import '../../model/characters_model.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:dio/dio.dart';

class MarvelRepository {
  Future<CharactersModel> getCharacters(int offset) async {
    Dio dio = Dio();
    var ts = DateTime.now().microsecondsSinceEpoch.toString();
    var publickey = dotenv.get("MARVELPUBLICKEY");
    var privatekey = dotenv.get("MARVELAPIKEY");
    var hash = generateMd5(ts + privatekey + publickey);
    var query = "offset=$offset&ts=$ts&apikey=$publickey&hash=$hash";
    var response =
        await dio.get("http://gateway.marvel.com/v1/public/characters?$query");
    if (response.statusCode == 200) {
      return CharactersModel.fromJson(response.data);
    } else {
      return CharactersModel();
    }
  }

  generateMd5(String data) {
    var content = const Utf8Encoder().convert(data);
    var md5 = crypto.md5;
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }
}
