import 'dart:convert';

import 'package:mpesa_sdk_dart/src/rsa_key_helper.dart';

class MpesaConfig {

  static String getBearerToken(String apiKey, String publicKey) {
    try {
      var rsaKeyHelper = RsaKeyHelper();

      var pk = rsaKeyHelper.parsePublicKeyFromPem(publicKey);

      var token = rsaKeyHelper.encrypt(apiKey, pk);

      return 'Bearer ${base64.encode(token)}';
    } catch (e) {
      print(e.toString());
    }
  }

}