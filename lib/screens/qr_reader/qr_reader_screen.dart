import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:tooolbox/screens/components/empty_widget.dart';

class QrReaderScreen extends StatefulWidget {
  const QrReaderScreen({Key? key}) : super(key: key);

  static const String routeName = "/qrReader";

  @override
  State<QrReaderScreen> createState() => _QrReaderScreenState();
}

class _QrReaderScreenState extends State<QrReaderScreen> {
  Set<String> values = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Hero(
          tag: "QR Reader",
          child: Text("QR Reader"),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                values = {};
              });
            },
            icon: const FaIcon(FontAwesomeIcons.broom, size: 18),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: MobileScanner(
                onDetect: (capture) {
                  for (final Barcode barcode in capture.barcodes) {
                    if (barcode.rawValue == null) continue;
                    setState(() {
                      values.add(barcode.rawValue!);
                    });
                  }
                },
              ),
            ),
          ),
          if (values.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: values.length,
                itemBuilder: (context, index) {
                  String value = values.elementAt(index);
                  return ListTile(
                    dense: true,
                    leading: const Icon(Icons.qr_code),
                    title: Text(value),
                    trailing: IconButton(
                      onPressed: () =>
                          Clipboard.setData(ClipboardData(text: value)),
                      icon: const Icon(Icons.copy, size: 16),
                    ),
                  ).animate().slideX().fadeIn();
                },
              ),
            ),
          if (values.isEmpty) ...[
            const Spacer(),
            const EmptyWidget(),
            const Spacer(),
          ]
        ],
      ),
    );
  }
}
