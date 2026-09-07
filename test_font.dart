import 'package:google_fonts/google_fonts.dart';
void main() {
  try {
    var font = GoogleFonts.googleSans();
    print("Found Google Sans");
  } catch (e) {
    print("Error: $e");
  }
}
