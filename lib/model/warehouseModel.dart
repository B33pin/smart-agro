import 'package:google_maps_flutter/google_maps_flutter.dart';

class WareHouseModel {
  String warehousename;
  String address;
  String description;
  String thumbNail;
  LatLng locationCoords;

  WareHouseModel(
      {this.warehousename,
        this.address,
        this.description,
        this.thumbNail,
        this.locationCoords});
}

final List<WareHouseModel> warehouses = [
  WareHouseModel(
      warehousename: 'KATHMANDU-WAREHOUSE',
      address: '34-Kritipur, KTM',
      description:
      'Warehouse located in Kathmandu for managing food supply chain within and outside district',
      locationCoords:  LatLng(27.6630, 85.2774),
      thumbNail: 'https://venturebeat.com/wp-content/uploads/2019/11/groceries-1.jpg?fit=400%2C267&strip=all'
  ),
  WareHouseModel(
      warehousename: 'BHAKTAPUR-WAREHOUSE',
      address: '12-Pepsicola, Bhaktapur',
      description:
      'Warehouse located in Bhaktapur for managing food supply chain within and outside district',
      locationCoords: LatLng(27.6889, 85.3602),
      thumbNail: 'https://www.vanco.be/img/carousel-img/Herve/HERVE-9022.jpg'
  ),
  WareHouseModel(
      warehousename: 'POKHARA-WAREHOUSE',
      address: '13-LakeSide, Pokhara',
      description:
      'Warehouse located in Pokhara for managing food supply chain within and outside district',
      locationCoords: LatLng(28.209499, 	83.959518),
      thumbNail: 'https://thumbs.dreamstime.com/b/vegetables-groceries-big-warehouse-factory-supermarket-food-retail-67347703.jpg'
  ),
];