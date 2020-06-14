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
      warehousename: 'Arghakhanchi-ColdHouse',
      address: 'Sandhikharka, Arghakhanchi',
      description:
      'Warehouse located in Arghakhanchi for managing food supply chain',
      locationCoords:  LatLng(27.9650, 83.1435),
      thumbNail: 'https://venturebeat.com/wp-content/uploads/2019/11/groceries-1.jpg?fit=400%2C267&strip=all'
  ),
  WareHouseModel(
      warehousename: 'Gulmi-ColdHouse',
      address: 'Resunga, Gulmi',
      description:
      'Warehouse located in Gulmi for managing food supply chain within and outside district',
      locationCoords: LatLng(28.0889, 83.2934),
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