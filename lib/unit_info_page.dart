import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';

class UnitInfoPageArguments {
  final String title;
  final String pdfAsset;

  UnitInfoPageArguments(this.title, this.pdfAsset);
}

class UnitInfoPage extends StatefulWidget {
  static const routeName = "/unit_info_page";

  final UnitInfoPageArguments arguments;

  const UnitInfoPage({
    Key key,
    @required this.arguments,
  }) : super(key: key);

  @override
  _UnitInfoPageState createState() => _UnitInfoPageState();
}

class _UnitInfoPageState extends State<UnitInfoPage> {
  PDFDocument _document;
  bool _isLoading = true;

  @override
  void initState() {
    loadPDF(widget.arguments.pdfAsset);
    super.initState();
  }

  Future<void> loadPDF(String pdfAsset) async {
    final doc = await PDFDocument.fromAsset("assets/pdf/$pdfAsset.pdf");
    setState(() {
      _document = doc;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.arguments.title,
          style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 18.0),
        ),
      ),
      body: Container(
        child: Center(
          child: _isLoading
              ? Center(child: CircularProgressIndicator())
              : PDFViewer(document: _document),
        ),
      ),
    );
  }
}
