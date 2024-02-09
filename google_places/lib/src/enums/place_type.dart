part of '../../google_places_sdk.dart';

enum PlaceType {
  other("other"),
  accounting("accounting"),
  administrativeAreaLevel1("administrative_area_level_1"),
  administrativeAreaLevel2("administrative_area_level_2"),
  administrativeAreaLevel3("administrative_area_level_3"),
  administrativeAreaLevel4("administrative_area_level_4"),
  administrativeAreaLevel5("administrative_area_level_5"),
  airport("airport"),
  amusementPark("amusement_park"),
  aquarium("aquarium"),
  archipelago("archipelago"),
  artGallery("art_gallery"),
  atm("atm"),
  bakery("bakery"),
  bank("bank"),
  bar("bar"),
  beautySalon("beauty_salon"),
  bicycleStore("beauty_salon"),
  bookStore("book_store"),
  bowlingAlley("bowling_alley"),
  busStation("bus_station"),
  cafe("cafe"),
  campground("campground"),
  carDealer("car_dealer"),
  carRental("car_rental"),
  carRepair("car_rental"),
  carWash("car_wash"),
  casino("casino"),
  cemetery("cemetery"),
  church("church"),
  cityHall("city_hall"),
  clothingStore("clothing_store"),
  colloquialArea("colloquial_area"),
  continent("continent"),
  convenienceStore("convenience_store"),
  country("country"),
  courthouse("courthouse"),
  dentist("dentist"),
  departmentStore("department_store"),
  doctor("doctor"),
  drugstore("drugstore"),
  electrician("electrician"),
  electronicsStore("electronics_store"),
  embassy("embassy"),
  establishment("establishment"),
  finance("finance"),
  fireStation("fire_station"),
  floor("floor"),
  florist("florist"),
  food("food"),
  funeralHome("funeral_home"),
  furnitureStore("furniture_store"),
  gasStation("gas_station"),
  generalContractor("general_contractor"),
  geocode("geocode"),
  groceryOrSupermarket("grocery_or_supermarket"),
  gym("gym"),
  hairCare("hair_care"),
  hardwareStore("hardware_store"),
  health("health"),
  hinduTemple("hindu_temple"),
  homeGoodsStore("home_goods_store"),
  hospital("hospital"),
  insuranceAgency("insurance_agency"),
  intersection("intersection"),
  jewelryStore("jewelry_store"),
  laundry("laundry"),
  lawyer("lawyer"),
  library("library"),
  lightRailStation("light_rail_station"),
  liquorStore("liquor_store"),
  localGovernmentOffice("local_government_office"),
  locality("locality"),
  locksmith("locksmith"),
  lodging("lodging"),
  mealDelivery("meal_delivery"),
  mealTakeaway("meal_takeaway"),
  mosque("mosque"),
  movieRental("movie_rental"),
  movieTheater("movie_theater"),
  movingCompany("moving_company"),
  museum("museum"),
  naturalFeature("natural_feature"),
  neighborhood("neighborhood"),
  nightClub("night_club"),
  painter("painter"),
  park("park"),
  parking("parking"),
  petStore("pet_store"),
  pharmacy("pharmacy"),
  physiotherapist("physiotherapist"),
  placeOfWorship("place_of_worship"),
  plumber("plumber"),
  plusCode("plus_code"),
  pointOfInterest("point_of_interest"),
  police("police"),
  political("political"),
  postBox("post_box"),
  postOffice("post_office"),
  postalCodePrefix("postal_code_prefix"),
  postalCodeSuffix("postal_code_suffix"),
  postalCode("postal_code"),
  postalTown("postal_town"),
  premise("premise"),
  primarySchool("primary_school"),
  realEstateAgency("real_estate_agency"),
  restaurant("restaurant"),
  roofingContractor("roofing_contractor"),
  room("room"),
  route("route"),
  rvPark("rv_park"),
  school("school"),
  secondarySchool("secondary_school"),
  shoeStore("shoe_store"),
  shoppingMall("shopping_mall"),
  spa("spa"),
  stadium("stadium"),
  storage("storage"),
  store("store"),
  streetAddress("street_address"),
  streetNumber("street_number"),
  sublocalityLevel1("sublocality_level_1"),
  sublocalityLevel2("sublocality_level_2"),
  sublocalityLevel3("sublocality_level_3"),
  sublocalityLevel4("sublocality_level_4"),
  sublocalityLevel5("sublocality_level_5"),
  sublocality("sublocality"),
  subpremise("subpremise"),
  subwayStation("subway_station"),
  supermarket("supermarket"),
  synagogue("synagogue"),
  taxiStand("taxi_stand"),
  touristAttraction("tourist_attraction"),
  townSquare("town_square"),
  trainStation("train_station"),
  transitStation("transit_station"),
  travelAgency("travel_agency"),
  university("university"),
  veterinaryCare("veterinary_care"),
  zoo("zoo");

  final String value;

  const PlaceType(this.value);
}

class _PlaceTypeConverter {
  PlaceType fromJson(String json) =>
      PlaceType.values.firstWhere((t) => json.toLowerCase() == t.value,
          orElse: () => PlaceType.other);

  String toJson(PlaceType object) => object.value;
}
