import 'package:BrainScopeAI/features/home/domain/entity/result_entity.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:BrainScopeAI/core/theme/app_theme.dart';
import 'package:BrainScopeAI/features/home/presentation/ui/home_screen/home_screen.dart';
import 'package:BrainScopeAI/features/home/presentation/ui/new_scan/new_scan_screen.dart';
import 'package:BrainScopeAI/features/setting/presentation/ui/widgets/setting_screen.dart';
import 'package:BrainScopeAI/features/splash/presentation/UI/splash_screen.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ResultEntityAdapter());
  if (!await Hive.boxExists('main')) {
    await Hive.openBox<ResultEntity>('main');
  }

  runApp(DevicePreview(
    enabled: true,
    builder: (context) => MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      theme: appTheme(),
      initialRoute: '/splash',
      getPages: [
        GetPage(name: '/splash', page: () => const SplashScreen()),
        GetPage(name: '/home', page: () => const HomeScreen()),
        GetPage(name: '/setting', page: () => const SettingScreen()),
        GetPage(name: '/NewScanScreen', page: () => const NewScanScreen()),
      ],
    );
  }
}

// class ImageClassificationPage extends StatefulWidget {
//   const ImageClassificationPage({super.key});

//   @override
//   _ImageClassificationPageState createState() =>
//       _ImageClassificationPageState();
// }

// class _ImageClassificationPageState extends State<ImageClassificationPage> {
//   File? _image;
//   String _result = '';
//   Interpreter? _interpreter;
//   final ImagePicker _picker = ImagePicker();

//   @override
//   void initState() {
//     super.initState();
//     _loadModel();
//   }

//   Future<void> _loadModel() async {
//     try {
//       _interpreter = await Interpreter.fromAsset('assets/model.tflite');
//       setState(() {
//         _result = 'Model loaded successfully';
//       });
//     } catch (e) {
//       setState(() {
//         _result = 'Error loading model: $e';
//       });
//     }
//   }

//   Future<void> _pickImage(ImageSource source) async {
//     final XFile? pickedFile = await _picker.pickImage(source: source);
//     if (pickedFile != null) {
//       setState(() {
//         _image = File(pickedFile.path);
//         _result = 'Image selected, processing...';
//       });
//     }
//   }

//   Future<void> _runInference() async {
//     if (_image == null) {
//       setState(() {
//         _result = 'No image loaded';
//       });
//       return;
//     }
//     if (_interpreter == null) {
//       setState(() {
//         _result = 'No model loaded';
//       });
//       return;
//     }

//     // Load and preprocess image
//     final inputImage = img.decodeImage(await _image!.readAsBytes())!;
//     final resizedImage = img.copyResize(inputImage, width: 244, height: 244);

//     // Prepare input tensor (1, 244, 244, 3)
//     final input = List.generate(
//         1,
//         (_) => List.generate(
//             244, (_) => List.generate(244, (_) => List.filled(3, 0.0))));
//     for (var y = 0; y < 244; y++) {
//       for (var x = 0; x < 244; x++) {
//         final pixel = resizedImage.getPixel(x, y);
//         input[0][y][x][0] =
//             (pixel.r) / 255.0; // Red channel, normalized to [0, 1]
//         input[0][y][x][1] = (pixel.g) / 255.0; // Green channel
//         input[0][y][x][2] = (pixel.b) / 255.0; // Blue channel
//       }
//     }

//     // Prepare output tensor (1, 4) for 4 classes
//     final output = List.filled(1, List.filled(4, 0.0));

//     // Run inference
//     try {
//       _interpreter!.run(input, output);

//       // Find the class with the highest probability
//       final maxScore = output[0].reduce((a, b) => a > b ? a : b);
//       final maxIndex = output[0].indexOf(maxScore);

//       setState(() {
//         // ['Mild Demented', 'Moderate Demented', 'Non Demented', 'Very MildDemented']

//         _result =
//             'Class: $maxIndex, Confidence: ${(maxScore * 100).toStringAsFixed(2)}%';
//       });
//     } catch (e) {
//       setState(() {
//         _result = 'Error running inference: $e';
//       });
//     }
//   }

//   @override
//   void dispose() {
//     _interpreter?.close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Image Classification')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             _image == null
//                 ? const Text('No image selected.')
//                 : Image.file(_image!,
//                     height: 200, width: 200, fit: BoxFit.cover),
//             const SizedBox(height: 20),
//             Text(_result, style: const TextStyle(fontSize: 16)),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () => _pickImage(ImageSource.gallery),
//               child: const Text('Pick Image from Gallery'),
//             ),
//             ElevatedButton(
//               onPressed: () => _pickImage(ImageSource.camera),
//               child: const Text('Take Photo'),
//             ),
//             ElevatedButton(
//               onPressed: () => _runInference(),
//               child: const Text('test model'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
