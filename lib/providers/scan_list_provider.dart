import 'package:flutter/material.dart';
import 'package:qa_reader/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier{
  
  List<ScanModel> scans = [];

  String selectedType= 'http';

  Future<ScanModel> newScan(String value) async {
    final newScan = ScanModel(value: value);
    final id = await DBProvider.db.newScan(newScan);
    //Assign the id from de DB to the Model
    newScan.id = id;
    if (newScan.type==selectedType) {
      scans.add(newScan);
      notifyListeners();
    }

    return newScan;
  }

  getScans() async{
    final scans  = await DBProvider.db.getScans();
    this.scans = [...scans!];
    notifyListeners();
  }

  getScansByType(String type) async{
    final scans  = await DBProvider.db.getScanByType(type);
    this.scans = [...scans!];
    selectedType = type;
    notifyListeners();

  }

  deleteAll() async{
      await DBProvider.db.deleteAllScan();
      scans = [];
      notifyListeners();

  }

  deleteScanById(int id) async{
      await DBProvider.db.deleteScan(id);
      scans = [];
      getScansByType(selectedType);
      notifyListeners();
      

  }

}