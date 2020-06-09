import 'package:pdf/pdf.dart';
import 'package:flutter/material.dart';
import 'package:orientierungsprojektss20/utilities/constants.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:orientierungsprojektss20/utilities/parameters.dart' as tc;
import 'package:orientierungsprojektss20/utilities/CustomDrawer.dart';

List<pw.Widget> pdfContent;
List<DataRow> table;
void tableWithoutEnclosure(){
  table=[
    DataRow(
        cells: [
          DataCell(Text('Number of Busbars'),),
          DataCell(Text('${tc.parameters.getNumberOfBusBars().toString()}'),)
        ]
    ),
    DataRow(
        cells: [
          DataCell(Text('Phase System'),),
          DataCell(Text('${tc.parameters.getPhase().toString()}'),)
        ]
    ),
    DataRow(
        cells: [
          DataCell(Text('Material'),),
          DataCell(Text(tc.parameters.getSelectedMaterial()==MaterialCA.copper?'Copper':'Aluminum'),)

        ]
    ),
    DataRow(
        cells: [
          DataCell(Text('Surface of the Busbar'),),
          DataCell(Text(tc.parameters.getBusBarOverlay()==true?'Painted':'Blank')),
        ]
    ),
    DataRow(
        cells: [
          DataCell(Text('Height'),),
          DataCell(Text('${tc.parameters.getHeight().toString()} mm'),)
        ]
    ),
    DataRow(
        cells: [
          DataCell(Text('Width'),),
          DataCell(Text('${tc.parameters.getWidth().toString()} mm'),)
        ]
    ),
    DataRow(
        cells: [
          DataCell(Text('Frequency'),),
          DataCell(Text('${tc.parameters.getFrequency().toStringAsFixed(2)} Hz'),)
        ]
    ),
    DataRow(
        cells: [
          DataCell(Text('Ambient Temperature'),),
          DataCell(Text('${tc.parameters.getAmbientTemperature().toStringAsFixed(1)} °C'),)
        ]
    ),
    DataRow(
        cells: [
          DataCell(Text('Enclosure'),),
          DataCell(Text(tc.parameters.getEnclosure()?'Yes':'No'),)
        ]
    ),
    DataRow(
        cells: [
          DataCell(Text('Current'),),
          DataCell(Text('${tc.parameters.getCurrent().toString()} A'),)
        ]
    ),
    DataRow(
        cells: [
          DataCell(Text('Busbar Temperature'),),
          DataCell(Text('${tc.parameters.getFinalTemperature().toStringAsFixed(2)}'),)
        ]
    ),


  ];
}
void tableWithEnclosure(){
  table=[
    DataRow(
        cells: [
          DataCell(Text('Number of Busbars'),),
          DataCell(Text('${tc.parameters.getNumberOfBusBars().toString()}'),)
        ]
    ),
    DataRow(
        cells: [
          DataCell(Text('Phase System'),),
          DataCell(Text('${tc.parameters.getPhase().toString()}'),)
        ]
    ),
    DataRow(
        cells: [
          DataCell(Text('Material'),),
          DataCell(Text(tc.parameters.getSelectedMaterial()==MaterialCA.copper?'Copper':'Aluminum'),)

        ]
    ),
    DataRow(
        cells: [
          DataCell(Text('Surface of the Busbar'),),
          DataCell(Text(tc.parameters.getBusBarOverlay()==true?'Painted':'Blank')),
        ]
    ),
    DataRow(
        cells: [
          DataCell(Text('Height'),),
          DataCell(Text('${tc.parameters.getHeight().toString()} mm'),)
        ]
    ),
    DataRow(
        cells: [
          DataCell(Text('Width'),),
          DataCell(Text('${tc.parameters.getWidth().toString()} mm'),)
        ]
    ),
    DataRow(
        cells: [
          DataCell(Text('Frequency'),),
          DataCell(Text('${tc.parameters.getFrequency().toStringAsFixed(2)} Hz'),)
        ]
    ),
    DataRow(
        cells: [
          DataCell(Text('Ambient Temperature'),),
          DataCell(Text('${tc.parameters.getAmbientTemperature().toStringAsFixed(1)} °C'),)
        ]
    ),
    DataRow(
        cells: [
          DataCell(Text('Enclosure'),),
          DataCell(Text(tc.parameters.getEnclosure()?'Yes':'No'),)
        ]
    ),
    DataRow(
        cells: [
          DataCell(Text('Inside Surface of Enclosure'),),
          DataCell(Text(tc.parameters.getInsideOverlay()==true?'Painted':'Blank'),)
        ]
    ),
    DataRow(
        cells: [
          DataCell(Text('Outside Surface of Enclosure'),),
          DataCell(Text(tc.parameters.getOutsideOverlay()==true?'Painted':'Blank'),)
        ]
    ),
    DataRow(
        cells: [
          DataCell(Text('Current'),),
          DataCell(Text('${tc.parameters.getCurrent().toString()} A'),)
        ]
    ),
    DataRow(
        cells: [
          DataCell(Text('Busbar Temperature'),),
          DataCell(Text('${tc.parameters.getFinalTemperature().toStringAsFixed(2)}'),)
        ]
    ),

  ];
}
void pdfWithEnclosure(){
  pdfContent=[ pw.Header(
      level: 0,
      child: pw.Text('HTW DRESDEN', textScaleFactor: 3, style: pw.TextStyle(color: PdfColors.yellow900))
  ),
    pw.Paragraph(
      style: pw.TextStyle(fontSize: 25, ),
      text: kwelcomeText,
    ),

    pw.Header(
      level: 1,
      child: pw.Text('Parameters', textScaleFactor: 2, style: pw.TextStyle(color: PdfColors.blue)),
    ),

    pw.SizedBox(height: 10),
    pw.Bullet(
        text:
        'Number of busbars = ${tc.parameters.getNumberOfBusBars()}'
        ,style: pw.TextStyle(fontSize: 30)),
    pw.Bullet(
        text:
        'phase = ${tc.parameters.getPhase()}'
        ,style: pw.TextStyle(fontSize: 30)),
    pw.Bullet(
        text:
        tc.parameters.getSelectedMaterial()==MaterialCA.copper?'Material = Copper':'Material = Aluminum'
        ,style: pw.TextStyle(fontSize: 30)),
    pw.Bullet(
        text:
        tc.parameters.getBusBarOverlay()==true?'Surface of busbar = Painted': 'Surface of busbar = Blank '
        ,style: pw.TextStyle(fontSize: 30)),
    pw.Bullet(
        text:
        'Height = ${tc.parameters.getHeight().toStringAsFixed(2)}'
        ,style: pw.TextStyle(fontSize: 30)),
    pw.Bullet(
        text:
        'Width = ${tc.parameters.getWidth().toStringAsFixed(2)}'
        ,style: pw.TextStyle(fontSize: 30)),
    pw.Bullet(
        text:
        'Height = ${tc.parameters.getHeight().toStringAsFixed(2)}'
        ,style: pw.TextStyle(fontSize: 30)),
    pw.Bullet(
        text:
        'Frequency = ${tc.parameters.getFrequency().toStringAsFixed(2)}'
        ,style: pw.TextStyle(fontSize: 30)),
    pw.Bullet(
        text:
        'Ambient Temperature = ${tc.parameters.getAmbientTemperature().toStringAsFixed(2)}'
        ,style: pw.TextStyle(fontSize: 30)),
    pw.Bullet(
        text:tc.parameters.getEnclosure()?
        'Enclosure = Yes':'Enclosure = No'
        ,style: pw.TextStyle(fontSize: 30)),
    pw.Bullet(
        text:tc.parameters.getInsideOverlay()?
        'Inside Surface of Enclosure = Painted':'Inside Surface of Enclosure = Blank'
        ,style: pw.TextStyle(fontSize: 30)),

    pw.Bullet(
        text:tc.parameters.getOutsideOverlay()?
        'Outside Surface of Enclosure = Painted':'Outside Surface of Enclosure = Blank'
        ,style: pw.TextStyle(fontSize: 30)),
    pw.Bullet(
        text:
        'Current= ${tc.parameters.getCurrent().toStringAsFixed(2)}'
        ,style: pw.TextStyle(fontSize: 30)),
    pw.Bullet(
        text:
        'Busbar Temperature= ${tc.parameters.getFinalTemperature().toStringAsFixed(2)}'
        ,style: pw.TextStyle(fontSize: 30)),

  ];
}
void pdfWithoutEnclosure(){
  pdfContent=[
    pw.Header(
      level: 0,
      child: pw.Text('HTW DRESDEN', textScaleFactor: 3, style: pw.TextStyle(color: PdfColors.yellow900))
  ),
    pw.Paragraph(
      style: pw.TextStyle(fontSize: 25, ),
      text: kwelcomeText,
    ),

    pw.Header(
      level: 1,
      child: pw.Text('Parameters', textScaleFactor: 2, style: pw.TextStyle(color: PdfColors.blue)),
    ),

    pw.SizedBox(height: 10),
    pw.Bullet(
        text:
        'Number of busbars = ${tc.parameters.getNumberOfBusBars()}'
        ,style: pw.TextStyle(fontSize: 30)),
    pw.Bullet(
        text:
        'phase = ${tc.parameters.getPhase()}'
        ,style: pw.TextStyle(fontSize: 30)),
    pw.Bullet(
        text:
        tc.parameters.getSelectedMaterial()==MaterialCA.copper?'Material = Copper':'Material = Aluminum'
        ,style: pw.TextStyle(fontSize: 30)),
    pw.Bullet(
        text:
        tc.parameters.getBusBarOverlay()==true?'Surface of busbar = Painted': 'Surface of busbar = Blank '
        ,style: pw.TextStyle(fontSize: 30)),
    pw.Bullet(
        text:
        'Height = ${tc.parameters.getHeight().toStringAsFixed(2)}'
        ,style: pw.TextStyle(fontSize: 30)),
    pw.Bullet(
        text:
        'Width = ${tc.parameters.getWidth().toStringAsFixed(2)}'
        ,style: pw.TextStyle(fontSize: 30)),
    pw.Bullet(
        text:
        'Height = ${tc.parameters.getHeight().toStringAsFixed(2)}'
        ,style: pw.TextStyle(fontSize: 30)),
    pw.Bullet(
        text:
        'Frequency = ${tc.parameters.getFrequency().toStringAsFixed(2)}'
        ,style: pw.TextStyle(fontSize: 30)),
    pw.Bullet(
        text:
        'Ambient Temperature = ${tc.parameters.getAmbientTemperature().toStringAsFixed(2)}'
        ,style: pw.TextStyle(fontSize: 30)),
    pw.Bullet(
        text:tc.parameters.getEnclosure()?
        'Enclosure = Yes':'Enclosure = No'
        ,style: pw.TextStyle(fontSize: 30)),
    pw.Bullet(
        text:
        'Current= ${tc.parameters.getCurrent().toStringAsFixed(2)}'
        ,style: pw.TextStyle(fontSize: 30)),
    pw.Bullet(
        text:
        'Busbar Temperature= ${tc.parameters.getFinalTemperature().toStringAsFixed(2)}'
        ,style: pw.TextStyle(fontSize: 30)),

  ];
}
void setPdfContent(){
  if(tc.parameters.getEnclosure()){
    pdfWithEnclosure();
  }
  else {
    pdfWithoutEnclosure();
  }
}
void setTableContent(){
  if(tc.parameters.getEnclosure()){
    tableWithEnclosure();
  }
  else{
    tableWithoutEnclosure();
  }
}
void setResults(){
  setPdfContent();
  setTableContent();
}

