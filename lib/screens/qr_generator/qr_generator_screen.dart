import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tooolbox/screens/components/buttons/default_button.dart';
import 'package:tooolbox/screens/components/empty_widget.dart';

class QrGeneratorScreen extends StatefulWidget {
  const QrGeneratorScreen({Key? key}) : super(key: key);

  static const String routeName = "/qrGenerator";

  @override
  State<QrGeneratorScreen> createState() => _QrGeneratorScreenState();
}

class _QrGeneratorScreenState extends State<QrGeneratorScreen> {
  late TextEditingController _controller;
  String text = '';
  final GlobalKey _globalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Hero(
          tag: "QR Generator",
          child: Text("QR Generator"),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                text = '';
              });
              _controller.clear();
            },
            icon: const FaIcon(FontAwesomeIcons.broom, size: 22),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: TextField(
                controller: _controller,
                maxLines: 3,
                minLines: 1,
                decoration: const InputDecoration(
                  hintText: "Enter value...",
                ),
              ),
            ),
          ),
          const Spacer(),
          text.isEmpty
              ? const EmptyWidget()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    RepaintBoundary(
                      key: _globalKey,
                      child: QrImage(
                        data: text,
                        backgroundColor: Colors.white,
                        size: 200,
                      ).animate().fadeIn().scale(),
                    ),
                    IconButton(
                      onPressed: shareQR,
                      icon: const Icon(Icons.share),
                    ),
                  ],
                ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: DefaultButton(
              label: 'Generate QR',
              onTap: () {
                setState(() {
                  text = _controller.text;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<Uint8List?> _captureImage() async {
    try {
      RenderRepaintBoundary boundary = _globalKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List? pngBytes = byteData?.buffer.asUint8List();
      return pngBytes;
    } catch (e) {
      return null;
    }
  }

  Future<void> shareQR() async {
    Uint8List? pngBytes = await _captureImage();

    if (pngBytes == null) return;

    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    String fileName = 'qr_code.png';
    String filePath = '$appDocPath/$fileName';

    File qrFile = File(filePath);
    await qrFile.writeAsBytes(pngBytes);

    Share.shareXFiles([XFile(qrFile.path)], text: 'Share QR code');
  }

  Future<void> downloadQR() async {}

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
