import 'package:dart_converter/dart_converter.dart';
import 'package:dio/dio.dart';

String url = "https://api.cloudconvert.com/v2/jobs";
String token =
    'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMTAzNzMzN2QyMmY2ZDgwZTIxODAwMzlkZDNlNTM5ZWJkOTExNTk4OWUxMjNlZTIwNmI3Zjg4MzY1YjJlOTk0N2JhMGIzOTE0ZDBmZjE3YTYiLCJpYXQiOjE2NjQ5MTI4NzYuMTE2NzY4LCJuYmYiOjE2NjQ5MTI4NzYuMTE2NzY5LCJleHAiOjQ4MjA1ODY0NzYuMTA5MjY1LCJzdWIiOiI2MDEzODg2MSIsInNjb3BlcyI6WyJ1c2VyLnJlYWQiLCJ1c2VyLndyaXRlIiwidGFzay5yZWFkIiwidGFzay53cml0ZSIsIndlYmhvb2sucmVhZCIsIndlYmhvb2sud3JpdGUiLCJwcmVzZXQucmVhZCIsInByZXNldC53cml0ZSJdfQ.bkqDe6h_f2nQkRrZYhK_0OoyBAIidLgA2W1OKKVO43L35yWazY2zHbINRnozlxwMYMQOiGmJDSoiI_1HwhsxLTooLHKNXB3_r2ugvDNQGiEX7rCGs0ajKFih2UbvaKR3IExnddRf5mxggb0CkF3edohoQlPFnTRkQs9nOjuwxHxOZCMOR_XOQzKimMoUxIGDDSFEmwY-IIv0PtHzE4Yj7T3wTzNfeXI5lqapCe_MnwWKprqHWVm5t6nS3GGbC602yelBlwN4067S-nGpXHH1sxo9WDNbxl4-6NkrZKJk0IJL65cne1ge5WuFwPAnoNm001QxpY9crZhjcOmKNxcjHBriQ8nJQy57n02yhRZfV9xZO91RPMnDwglc1FHw1-GKiCmBSOdVctrmGVPAhAhWJRadMgX-Lsyq8MLlXTw2gn4l3bCeT2PsmRu3_ui8giP8MG0q225230ovQmlq6I0Cw-9FWZVOPXS062dP-38DpNKgyoKPlp5-uk4WZOTclr1jl8E3QYNNdZvjPVyk1w2IvjGGfM2iAOTEMJwbvJH-uZpnvtI8xQF8gwkC7Py5FABzUJ4XdptzkCSFxoKPAqCXnsSf7JpypbKjrTl3gc50PgLqGcRMvHnZynEZy_wC8qJeU-mDVh2z_9anW6Qf5GwsfUK5gd2vSqhsP7qUY1diovg';
Map<String, String> headers = {
  'Authorization': 'Bearer $token',
  'Content-type': 'application/json'
};

var body = '''{
  "tasks": {
    "import-my-file": {
      "operation": "import/url",
      "url": "https://my.url/file.docx"
    },
    "convert-my-file": {
      "operation": "convert",
      "input": "import-my-file",
      "output_format": "pdf"
    },
    "export-my-file": {
      "operation": "export/url",
      "input": "convert-my-file"
    }
  }
}''';

void main() {
  var awesome = Awesome();
  print('awesome: ${awesome.isAwesome}');
  getHttp();
}

void getHttp() async {
  try {
    var response =
        await Dio().post(url, options: Options(headers: headers), data: body);
    print(response);
  } catch (e) {
    print(e);
  }
}
