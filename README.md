This packages add flutter support to youtube_explode_dart signature dechipering.


```dart
import 'package:webview_ejssolver/webview_ejssolver.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

void main() async {
  final solver = await WebviewEJSSolver.init();
  final yt = YoutubeExplode(jsSolver: solver);
  // use yt instance.
}
```