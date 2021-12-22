import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodpad/api/api_service.dart';
import 'package:foodpad/models/report_model.dart';

enum ResultStateReport { loading, noData, hasData, error }

class ReportProvider extends ChangeNotifier {
  final ApiService apiService;
  final String idRecipe;

  ReportProvider({required this.apiService, required this.idRecipe}) {
    _reportCheck();
  }

  late CheckReport _reportResult;
  late ResultStateReport _state;
  String _message = '';

  CheckReport get reviewResult => _reportResult;
  ResultStateReport get state => _state;
  String get message => _message;

  void addreport(report) {
    apiService.addReport(idRecipe, report.toString());
    _reportCheck();
    notifyListeners();
  }

  Future<dynamic> _reportCheck() async {
    try {
      _state = ResultStateReport.loading;
      notifyListeners();

      final report = await apiService.reviewReport(idRecipe);
      if (report.report.isEmpty) {
        _state = ResultStateReport.noData;
        notifyListeners();
        return _message = 'No Data';
      } else {
        _state = ResultStateReport.hasData;
        notifyListeners();
        return _reportResult = report;
      }
    } catch (e) {
      _state = ResultStateReport.error;
      notifyListeners();
      return _message = 'Periksa koneksi internetmu.';
    }
  }
}
