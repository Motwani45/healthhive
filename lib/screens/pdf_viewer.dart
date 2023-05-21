import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewer extends StatefulWidget {
  static const routeName="/pdf_viewer";
  final String resumeUrl;
  @override
  State<PdfViewer> createState() => _PdfViewerState();

  const PdfViewer({
    required this.resumeUrl,
  });
}

class _PdfViewerState extends State<PdfViewer> {
  late PdfViewerController _pdfViewerController;
@override
  void initState() {
    super.initState();
    _pdfViewerController=PdfViewerController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resume'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.keyboard_arrow_up,
              color: Colors.white,
            ),
            onPressed: () {
              _pdfViewerController.previousPage();
            },
          ),
          IconButton(
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: Colors.white,
            ),
            onPressed: () {
              _pdfViewerController.nextPage();
            },
          )
        ],
      ),
      body: SfPdfViewer.network(
        widget.resumeUrl,
        controller: _pdfViewerController,
      ),
    );
  }
}