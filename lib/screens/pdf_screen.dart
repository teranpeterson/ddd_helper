import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class PdfScreen extends StatelessWidget {
  const PdfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pdfPinchController = PdfControllerPinch(
      document: PdfDocument.openAsset('assets/files/instructions.pdf'),
    );
    return Scaffold(
      body: PdfViewPinch(
        controller: pdfPinchController,
      ),
    );
  }
}
