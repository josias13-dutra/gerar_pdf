import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class GeneratePrinting {
  Future<void> generatePrinting(String nome, String cpf, String email) async {
    final pdf = pw.Document();
    final netImage = await networkImage('https://www.nfet.net/nfet.jpg');
    pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Center(
          child: pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              pw.Text('O nome completo é: $nome'),
              pw.Text('O CPF é: $cpf'),
              pw.Text('O Email é: $email'),
              pw.Image(netImage),
            ],
          ),
        );
      },
    ));

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }
}
