import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:flutter/services.dart'; // Clipboard support

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR & Barcode Scanner',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ScannerPage(),
    );
  }
}

class ScannerPage extends StatefulWidget {
  const ScannerPage({super.key});

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  final MobileScannerController _controller = MobileScannerController(
    formats: const [BarcodeFormat.all],
  );
  bool _torchOn = false;

  String? lastScanned;
  bool isProcessingDetection = false;
  bool _isPickingImage = false;

  // Scanner running state
  bool _isScanning = true;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleDetect(BarcodeCapture capture) async {
    if (isProcessingDetection) return;
    final barcodes = capture.barcodes;
    if (barcodes.isEmpty) return;

    isProcessingDetection = true;
    final codeValue = barcodes.first.rawValue ?? "<empty>";

    await _controller.stop();
    _isScanning = false;

    setState(() {
      lastScanned = codeValue;
    });

    if (!mounted) return;
    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Scanned'),
        content: Text(codeValue),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );

    await _controller.start();
    _isScanning = true;

    isProcessingDetection = false;
  }

  Future<void> _pickImageAndAnalyze() async {
    if (_isPickingImage) return; // prevent double open
    _isPickingImage = true;

    final picker = ImagePicker();
    final XFile? file;

    try {
      file = await picker.pickImage(source: ImageSource.gallery);
    } catch (e) {
      _isPickingImage = false;
      return;
    }

    if (file == null) {
      _isPickingImage = false; // user canceled
      return;
    }

    final capture = await _controller.analyzeImage(file.path);

    _isPickingImage = false; // unlock

    if (capture == null || capture.barcodes.isEmpty) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('No barcode found.')));
      return;
    }

    final code = capture.barcodes.first.rawValue ?? '<empty>';

    if (!mounted) return;

    setState(() => lastScanned = code);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Found in image"),
        content: Text(code),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR & Barcode Scanner'),
        actions: [
          IconButton(
            icon: const Icon(Icons.flip_camera_android),
            onPressed: () => _controller.switchCamera(),
          ),
          IconButton(
            icon: Icon(_torchOn ? Icons.flash_on : Icons.flash_off),
            onPressed: () {
              _controller.toggleTorch();
              setState(() {
                _torchOn = !_torchOn; // manually flip icon state
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                MobileScanner(controller: _controller, onDetect: _handleDetect),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: const EdgeInsets.all(12),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'ক্যামেরা ধরলে QR/Barcode auto-সনাক্ত হবে',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            color: Colors.grey.shade200,
            child: Row(
              children: [
                ElevatedButton.icon(
                  onPressed: _pickImageAndAnalyze,
                  icon: const Icon(Icons.photo),
                  label: const Text("Gallery থেকে ছবি"),
                ),
                const SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: () async {
                    if (_isScanning) {
                      await _controller.stop();
                      _isScanning = false;
                    } else {
                      await _controller.start();
                      _isScanning = true;
                    }
                    setState(() {});
                  },
                  icon: Icon(_isScanning ? Icons.pause : Icons.play_arrow),
                  label: Text(_isScanning ? "Pause" : "Resume"),
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'শেষ স্ক্যান:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text(
                          lastScanned ?? '-',
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(width: 5),
                        if (lastScanned != null)
                          IconButton(
                            icon: const Icon(Icons.copy, size: 20),
                            onPressed: () {
                              Clipboard.setData(
                                ClipboardData(text: lastScanned!),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Copied to clipboard!'),
                                ),
                              );
                            },
                          ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
