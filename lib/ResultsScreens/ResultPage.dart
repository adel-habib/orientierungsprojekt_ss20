import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orientierungsprojektss20/gWidgets/myAppBar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:io';
import 'ResultsPreview.dart';
import 'dart:math';
import 'package:orientierungsprojektss20/utilities/parameters.dart' as globals;
import 'package:orientierungsprojektss20/utilities/CustomDrawer.dart';

//todo: design the pdf here that displays the results here

class ResultsPage extends StatelessWidget {
  // an Example
  final pdf = pw.Document();
  final String svgPicAdd='assets/bildung.svg';
  writePdf(){
    pdf.addPage(pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      margin: pw.EdgeInsets.all(32),
      build: (pw.Context context){
        return <pw.Widget>[
          pw.Header(
          level: 0,
          child: pw.Text('HTW DRESDEN', textScaleFactor: 3, style: pw.TextStyle(color: PdfColors.yellow900))
          ),
          pw.Paragraph(
            style: pw.TextStyle(fontSize: 20),
            text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. '
                'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
          ),
          pw.Header(
            level: 1,
            child: pw.Text('Complete Solution', textScaleFactor: 2, style: pw.TextStyle(color: PdfColors.blue)),
          ),
          pw.SizedBox(height: 10),
          pw.Bullet(
              text:
              'Area= ${globals.height.toString()} x ${globals.width.toString()}=${globals.height * globals.width}'
          ,style: pw.TextStyle(fontSize: 30)),
          pw.Bullet(
              text:
              'Sking factor = (f\/50) * Area^5 = '
                  '${((globals.frequency.round()/50)*pow((globals.height * globals.width),5)).toStringAsFixed(4)}',
              style: pw.TextStyle(fontSize: 30)),
          pw.Bullet( text: 'Temperature = Current x Ambient Temperature = ' '${globals.current} x ${globals.ambientTemp} '
              '=${globals.current*globals.ambientTemp.round()} ', style: pw.TextStyle(fontSize: 30)),

        ];
      }
    ));
  }

  Future savePdf() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String documentPath = documentDirectory.path;
    File file = File("$documentPath/results.pdf");
    file.writeAsBytesSync(pdf.save());
  }


  static String id = 'ResultsPage';
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
                  child: Text('The Solution for the following set of given parameters is ready!', style: TextStyle(
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,),
                ),
                SizedBox(height: 10,),
                Center(
                  child: RaisedButton(
                    child: Text('Generate PDF', style: TextStyle(fontSize: 20),),
                    color: Color(0xff1A237E),
                    onPressed: () async{
                      writePdf();
                      await savePdf();
                      Directory documentDirectory = await getApplicationDocumentsDirectory();
                      String documentPath = documentDirectory.path;
                      String fullPath="$documentPath/results.pdf";
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>PdfPreview(path: fullPath,)));
                    },
                  ),
                ),

                DataTable(
                  columns: [

                    DataColumn(label: Text('Parameter',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),),
                    DataColumn(label: Text('Value', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),),

                  ],
                  rows: [
                    DataRow(
                      cells: [
                        DataCell(Text('Number of Busbars'),),
                        DataCell(Text('${globals.numberOfBars.toString()}'),)
                      ]
                    ),
                    DataRow(
                        cells: [
                          DataCell(Text('Phase System'),),
                          DataCell(Text('${globals.phase.toString()}'),)
                        ]
                    ),
                    DataRow(
                        cells: [
                          DataCell(Text('Material'),),
                          DataCell(Text(globals.selectedMaterial==MaterialCA.copper?'Copper':'Aluminum'),)

                        ]
                    ),
                    DataRow(
                        cells: [
                          DataCell(Text('Surface of the Busbar'),),
                          DataCell(Text(globals.barOverlay==true?'Painted':'Blank')),
                        ]
                    ),
                    DataRow(
                        cells: [
                          DataCell(Text('Height'),),
                          DataCell(Text('${globals.height.toString()} mm'),)
                        ]
                    ),
                    DataRow(
                        cells: [
                          DataCell(Text('Width'),),
                          DataCell(Text('${globals.width.toString()} mm'),)
                        ]
                    ),
                    DataRow(
                        cells: [
                          DataCell(Text('Frequency'),),
                          DataCell(Text('${globals.frequency.toStringAsFixed(2)} Hz'),)
                        ]
                    ),
                    DataRow(
                        cells: [
                          DataCell(Text('Ambient Temperature'),),
                          DataCell(Text('${globals.ambientTemp.toStringAsFixed(1)} °C'),)
                        ]
                    ),
                    DataRow(
                        cells: [
                          DataCell(Text('Current'),),
                          DataCell(Text('${globals.current.toString()} A'),)
                        ]
                    ),
                    DataRow(
                        cells: [
                          DataCell(Text('Enclosure'),),
                          DataCell(Text(globals.enclosure?'Yes':'No'),)
                        ]
                    ),
                    globals.enclosure?DataRow(
                        cells: [
                          DataCell(Text('Inside Surface of Enclosure'),),
                          DataCell(Text(globals.insideOverlay==true?'Painted':'Blank'),)
                        ]
                    ):DataRow(
                        cells: [DataCell(Text('')),DataCell(Text(''))]
                    ),
                    globals.enclosure?DataRow(
                        cells: [
                          DataCell(Text('Outside Surface of Enclosure'),),
                          DataCell(Text(globals.outsideOverlay==true?'Painted':'Blank'),)
                        ]
                    ):DataRow(
                      cells: [DataCell(Text('')),DataCell(Text(''))]
                    ),


                  ],
                ),
                SizedBox(height: 10,),

              ],
            ),
          ),
        ),
      ),

    );
  }
}