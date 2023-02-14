import 'package:image_picker/image_picker.dart';

class FileUtil {

  void parmissionHandler(){
    
  }
  
  static Future<XFile?> picImage() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    return image;
  }
}
