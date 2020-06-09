import 'networking.dart';
class DataModel {
  String date;
  DataModel({this.date});
  Future <dynamic> getDataContent() async {
    NetworkingData networkingData = NetworkingData(
        url: "https://fsocietyspaceapp.herokuapp.com/api/?username=nirjalpaudel&password=n1_rjal9841&name=Nirjal+Paudel&date-to-predict=${date!=null?date:'2020-07-12'}&place=Kathmandu");
    var ApiDATA = await networkingData.getdata();
    return ApiDATA;
  }
}