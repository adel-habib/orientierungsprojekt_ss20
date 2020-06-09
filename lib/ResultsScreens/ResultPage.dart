import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orientierungsprojektss20/gWidgets/myAppBar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart' as print;
import 'dart:io';
import 'ResultsPreview.dart';
import 'dart:async';
import 'resultsContent.dart' as content;
//todo: design the pdf here that displays the results here

class ResultsPage extends StatefulWidget {
  // an Example you can emulate
  static String id = 'ResultsPage';

  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {

  //Our pdf Document
  final pdf = pw.Document();
  //Call to print the document
  void _printDocument()  {
     print.Printing.layoutPdf(
      onLayout: (pageFormat) {
        final doc = pw.Document();

        doc.addPage(
          pw.MultiPage(
            pageFormat: PdfPageFormat.a4,
            margin: pw.EdgeInsets.all(32),
            build: (pw.Context context) => content.pdfContent
          ),
        );

        return doc.save();
      },
    );
  }
  //Call to preview the Document
  writePdf() {
    pdf.addPage(pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.all(32),
        build: (pw.Context context) {
          return content.pdfContent;
        }));
  }

  Future savePdf() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String documentPath = documentDirectory.path;
    File file = File("$documentPath/results.pdf");
    file.writeAsBytesSync(pdf.save());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'The Solution for the following set of given parameters is ready!',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      child: Text(
                        'Preview',
                        style: TextStyle(fontSize: 16),
                      ),
                      onPressed: () async {
                        writePdf();
                        await savePdf();
                        Directory documentDirectory =
                            await getApplicationDocumentsDirectory();
                        String documentPath = documentDirectory.path;
                        String fullPath = "$documentPath/results.pdf";
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PdfPreview(
                                      path: fullPath,
                                    )));
                      },
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    RaisedButton(
                      child: Icon(Icons.print),
                      onPressed: _printDocument,
                    )
                  ],
                ),
                DataTable(
                  columns: [
                    DataColumn(
                      label: Text(
                        'Parameter',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Value',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                  rows: content.table,
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
