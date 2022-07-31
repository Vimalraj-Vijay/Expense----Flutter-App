import 'package:flutter_test/flutter_test.dart';
import 'package:my_expenses/home/model/transcation_model.dart';

void main() async {
  TranscationModel transcationModel;

  group("trans", ()  {
    transcationModel = TranscationModel(
        id: "id", title: "title", amount: 33.0, dateTime: DateTime.now());
    test('Test all model Values', () async {
      expect(transcationModel.id.isNotEmpty, true);
    });
  });
}
