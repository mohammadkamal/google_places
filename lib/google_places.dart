library google_places;

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

// Models
part 'src/models/autocomplete_prediction.dart';
part 'src/models/lat_lng_bounds.dart';
part 'src/models/lat_lng_coords.dart';
part 'src/models/local_time.dart';
part 'src/models/opening_hours.dart';
part 'src/models/period.dart';
part 'src/models/photo_metadata.dart';
part 'src/models/place_details.dart';
part 'src/models/plus_code.dart';
part 'src/models/time_of_week.dart';

// Enums
part 'src/enums/business_status.dart';
part 'src/enums/day_of_week.dart';
part 'src/enums/place_fields.dart';
part 'src/enums/place_type.dart';
part 'src/enums/price_level.dart';

// Plugin
part 'src/google_places.dart';
part 'src/google_places_method_channel.dart';
part 'src/google_places_platform_interface.dart';