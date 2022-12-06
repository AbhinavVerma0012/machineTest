// To parse this JSON data, do
//
//     final asteroidLookUp = asteroidLookUpFromJson(jsonString);

import 'dart:convert';

class AsteroidLookUp {
    AsteroidLookUp({
        this.links,
        this.id,
        this.neoReferenceId,
        this.name,
        this.designation,
        this.nasaJplUrl,
        this.absoluteMagnitudeH,
        this.estimatedDiameter,
        this.isPotentiallyHazardousAsteroid,
        this.closeApproachData,
        this.orbitalData,
        this.isSentryObject,
    });

    Links? links;
    String? id;
    String? neoReferenceId;
    String? name;
    String? designation;
    String? nasaJplUrl;
    double? absoluteMagnitudeH;
    EstimatedDiameter? estimatedDiameter;
    bool? isPotentiallyHazardousAsteroid;
    List<CloseApproachDatum>? closeApproachData;
    OrbitalData? orbitalData;
    bool? isSentryObject;

    factory AsteroidLookUp.fromRawJson(String str) => AsteroidLookUp.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AsteroidLookUp.fromJson(Map<String, dynamic> json) => AsteroidLookUp(
        links: json["links"] == null ? null : Links.fromJson(json["links"]),
        id: json["id"] == null ? null : json["id"],
        neoReferenceId: json["neo_reference_id"] == null ? null : json["neo_reference_id"],
        name: json["name"] == null ? null : json["name"],
        designation: json["designation"] == null ? null : json["designation"],
        nasaJplUrl: json["nasa_jpl_url"] == null ? null : json["nasa_jpl_url"],
        absoluteMagnitudeH: json["absolute_magnitude_h"] == null ? null : json["absolute_magnitude_h"].toDouble(),
        estimatedDiameter: json["estimated_diameter"] == null ? null : EstimatedDiameter.fromJson(json["estimated_diameter"]),
        isPotentiallyHazardousAsteroid: json["is_potentially_hazardous_asteroid"] == null ? null : json["is_potentially_hazardous_asteroid"],
        closeApproachData: json["close_approach_data"] == null ? null : List<CloseApproachDatum>.from(json["close_approach_data"].map((x) => CloseApproachDatum.fromJson(x))),
        orbitalData: json["orbital_data"] == null ? null : OrbitalData.fromJson(json["orbital_data"]),
        isSentryObject: json["is_sentry_object"] == null ? null : json["is_sentry_object"],
    );

    Map<String, dynamic> toJson() => {
        "links": links == null ? null : links!.toJson(),
        "id": id == null ? null : id,
        "neo_reference_id": neoReferenceId == null ? null : neoReferenceId,
        "name": name == null ? null : name,
        "designation": designation == null ? null : designation,
        "nasa_jpl_url": nasaJplUrl == null ? null : nasaJplUrl,
        "absolute_magnitude_h": absoluteMagnitudeH == null ? null : absoluteMagnitudeH,
        "estimated_diameter": estimatedDiameter == null ? null : estimatedDiameter!.toJson(),
        "is_potentially_hazardous_asteroid": isPotentiallyHazardousAsteroid == null ? null : isPotentiallyHazardousAsteroid,
        "close_approach_data": closeApproachData == null ? null : List<dynamic>.from(closeApproachData!.map((x) => x.toJson())),
        "orbital_data": orbitalData == null ? null : orbitalData!.toJson(),
        "is_sentry_object": isSentryObject == null ? null : isSentryObject,
    };
}

class CloseApproachDatum {
    CloseApproachDatum({
        this.closeApproachDate,
        this.closeApproachDateFull,
        this.epochDateCloseApproach,
        this.relativeVelocity,
        this.missDistance,
        this.orbitingBody,
    });

    DateTime? closeApproachDate;
    String? closeApproachDateFull;
    int? epochDateCloseApproach;
    RelativeVelocity? relativeVelocity;
    MissDistance? missDistance;
    OrbitingBody? orbitingBody;

    factory CloseApproachDatum.fromRawJson(String str) => CloseApproachDatum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CloseApproachDatum.fromJson(Map<String, dynamic> json) => CloseApproachDatum(
        closeApproachDate: json["close_approach_date"] == null ? null : DateTime.parse(json["close_approach_date"]),
        closeApproachDateFull: json["close_approach_date_full"] == null ? null : json["close_approach_date_full"],
        epochDateCloseApproach: json["epoch_date_close_approach"] == null ? null : json["epoch_date_close_approach"],
        relativeVelocity: json["relative_velocity"] == null ? null : RelativeVelocity.fromJson(json["relative_velocity"]),
        missDistance: json["miss_distance"] == null ? null : MissDistance.fromJson(json["miss_distance"]),
        orbitingBody: json["orbiting_body"] == null ? null : orbitingBodyValues.map[json["orbiting_body"]],
    );

    Map<String, dynamic> toJson() => {
        "close_approach_date": closeApproachDate == null ? null : "${closeApproachDate!.year.toString().padLeft(4, '0')}-${closeApproachDate!.month.toString().padLeft(2, '0')}-${closeApproachDate!.day.toString().padLeft(2, '0')}",
        "close_approach_date_full": closeApproachDateFull == null ? null : closeApproachDateFull,
        "epoch_date_close_approach": epochDateCloseApproach == null ? null : epochDateCloseApproach,
        "relative_velocity": relativeVelocity == null ? null : relativeVelocity!.toJson(),
        "miss_distance": missDistance == null ? null : missDistance!.toJson(),
        "orbiting_body": orbitingBody == null ? null : orbitingBodyValues.reverse[orbitingBody],
    };
}

class MissDistance {
    MissDistance({
        this.astronomical,
        this.lunar,
        this.kilometers,
        this.miles,
    });

    String? astronomical;
    String? lunar;
    String? kilometers;
    String? miles;

    factory MissDistance.fromRawJson(String str) => MissDistance.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory MissDistance.fromJson(Map<String, dynamic> json) => MissDistance(
        astronomical: json["astronomical"] == null ? null : json["astronomical"],
        lunar: json["lunar"] == null ? null : json["lunar"],
        kilometers: json["kilometers"] == null ? null : json["kilometers"],
        miles: json["miles"] == null ? null : json["miles"],
    );

    Map<String, dynamic> toJson() => {
        "astronomical": astronomical == null ? null : astronomical,
        "lunar": lunar == null ? null : lunar,
        "kilometers": kilometers == null ? null : kilometers,
        "miles": miles == null ? null : miles,
    };
}

enum OrbitingBody { MERC, VENUS, EARTH }

final orbitingBodyValues = EnumValues({
    "Earth": OrbitingBody.EARTH,
    "Merc": OrbitingBody.MERC,
    "Venus": OrbitingBody.VENUS
});

class RelativeVelocity {
    RelativeVelocity({
        this.kilometersPerSecond,
        this.kilometersPerHour,
        this.milesPerHour,
    });

    String? kilometersPerSecond;
    String? kilometersPerHour;
    String? milesPerHour;

    factory RelativeVelocity.fromRawJson(String str) => RelativeVelocity.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RelativeVelocity.fromJson(Map<String, dynamic> json) => RelativeVelocity(
        kilometersPerSecond: json["kilometers_per_second"] == null ? null : json["kilometers_per_second"],
        kilometersPerHour: json["kilometers_per_hour"] == null ? null : json["kilometers_per_hour"],
        milesPerHour: json["miles_per_hour"] == null ? null : json["miles_per_hour"],
    );

    Map<String, dynamic> toJson() => {
        "kilometers_per_second": kilometersPerSecond == null ? null : kilometersPerSecond,
        "kilometers_per_hour": kilometersPerHour == null ? null : kilometersPerHour,
        "miles_per_hour": milesPerHour == null ? null : milesPerHour,
    };
}

class EstimatedDiameter {
    EstimatedDiameter({
        this.kilometers,
        this.meters,
        this.miles,
        this.feet,
    });

    Feet? kilometers;
    Feet? meters;
    Feet? miles;
    Feet? feet;

    factory EstimatedDiameter.fromRawJson(String str) => EstimatedDiameter.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory EstimatedDiameter.fromJson(Map<String, dynamic> json) => EstimatedDiameter(
        kilometers: json["kilometers"] == null ? null : Feet.fromJson(json["kilometers"]),
        meters: json["meters"] == null ? null : Feet.fromJson(json["meters"]),
        miles: json["miles"] == null ? null : Feet.fromJson(json["miles"]),
        feet: json["feet"] == null ? null : Feet.fromJson(json["feet"]),
    );

    Map<String, dynamic> toJson() => {
        "kilometers": kilometers == null ? null : kilometers!.toJson(),
        "meters": meters == null ? null : meters!.toJson(),
        "miles": miles == null ? null : miles!.toJson(),
        "feet": feet == null ? null : feet!.toJson(),
    };
}

class Feet {
    Feet({
        this.estimatedDiameterMin,
        this.estimatedDiameterMax,
    });

    double? estimatedDiameterMin;
    double? estimatedDiameterMax;

    factory Feet.fromRawJson(String str) => Feet.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Feet.fromJson(Map<String, dynamic> json) => Feet(
        estimatedDiameterMin: json["estimated_diameter_min"] == null ? null : json["estimated_diameter_min"].toDouble(),
        estimatedDiameterMax: json["estimated_diameter_max"] == null ? null : json["estimated_diameter_max"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "estimated_diameter_min": estimatedDiameterMin == null ? null : estimatedDiameterMin,
        "estimated_diameter_max": estimatedDiameterMax == null ? null : estimatedDiameterMax,
    };
}

class Links {
    Links({
        this.self,
    });

    String? self;

    factory Links.fromRawJson(String str) => Links.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: json["self"] == null ? null : json["self"],
    );

    Map<String, dynamic> toJson() => {
        "self": self == null ? null : self,
    };
}

class OrbitalData {
    OrbitalData({
        this.orbitId,
        this.orbitDeterminationDate,
        this.firstObservationDate,
        this.lastObservationDate,
        this.dataArcInDays,
        this.observationsUsed,
        this.orbitUncertainty,
        this.minimumOrbitIntersection,
        this.jupiterTisserandInvariant,
        this.epochOsculation,
        this.eccentricity,
        this.semiMajorAxis,
        this.inclination,
        this.ascendingNodeLongitude,
        this.orbitalPeriod,
        this.perihelionDistance,
        this.perihelionArgument,
        this.aphelionDistance,
        this.perihelionTime,
        this.meanAnomaly,
        this.meanMotion,
        this.equinox,
        this.orbitClass,
    });

    String? orbitId;
    DateTime? orbitDeterminationDate;
    DateTime? firstObservationDate;
    DateTime? lastObservationDate;
    int? dataArcInDays;
    int? observationsUsed;
    String? orbitUncertainty;
    String? minimumOrbitIntersection;
    String? jupiterTisserandInvariant;
    String? epochOsculation;
    String? eccentricity;
    String? semiMajorAxis;
    String? inclination;
    String? ascendingNodeLongitude;
    String? orbitalPeriod;
    String? perihelionDistance;
    String? perihelionArgument;
    String? aphelionDistance;
    String? perihelionTime;
    String? meanAnomaly;
    String? meanMotion;
    String? equinox;
    OrbitClass? orbitClass;

    factory OrbitalData.fromRawJson(String str) => OrbitalData.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OrbitalData.fromJson(Map<String, dynamic> json) => OrbitalData(
        orbitId: json["orbit_id"] == null ? null : json["orbit_id"],
        orbitDeterminationDate: json["orbit_determination_date"] == null ? null : DateTime.parse(json["orbit_determination_date"]),
        firstObservationDate: json["first_observation_date"] == null ? null : DateTime.parse(json["first_observation_date"]),
        lastObservationDate: json["last_observation_date"] == null ? null : DateTime.parse(json["last_observation_date"]),
        dataArcInDays: json["data_arc_in_days"] == null ? null : json["data_arc_in_days"],
        observationsUsed: json["observations_used"] == null ? null : json["observations_used"],
        orbitUncertainty: json["orbit_uncertainty"] == null ? null : json["orbit_uncertainty"],
        minimumOrbitIntersection: json["minimum_orbit_intersection"] == null ? null : json["minimum_orbit_intersection"],
        jupiterTisserandInvariant: json["jupiter_tisserand_invariant"] == null ? null : json["jupiter_tisserand_invariant"],
        epochOsculation: json["epoch_osculation"] == null ? null : json["epoch_osculation"],
        eccentricity: json["eccentricity"] == null ? null : json["eccentricity"],
        semiMajorAxis: json["semi_major_axis"] == null ? null : json["semi_major_axis"],
        inclination: json["inclination"] == null ? null : json["inclination"],
        ascendingNodeLongitude: json["ascending_node_longitude"] == null ? null : json["ascending_node_longitude"],
        orbitalPeriod: json["orbital_period"] == null ? null : json["orbital_period"],
        perihelionDistance: json["perihelion_distance"] == null ? null : json["perihelion_distance"],
        perihelionArgument: json["perihelion_argument"] == null ? null : json["perihelion_argument"],
        aphelionDistance: json["aphelion_distance"] == null ? null : json["aphelion_distance"],
        perihelionTime: json["perihelion_time"] == null ? null : json["perihelion_time"],
        meanAnomaly: json["mean_anomaly"] == null ? null : json["mean_anomaly"],
        meanMotion: json["mean_motion"] == null ? null : json["mean_motion"],
        equinox: json["equinox"] == null ? null : json["equinox"],
        orbitClass: json["orbit_class"] == null ? null : OrbitClass.fromJson(json["orbit_class"]),
    );

    Map<String, dynamic> toJson() => {
        "orbit_id": orbitId == null ? null : orbitId,
        "orbit_determination_date": orbitDeterminationDate == null ? null : orbitDeterminationDate!.toIso8601String(),
        "first_observation_date": firstObservationDate == null ? null : "${firstObservationDate!.year.toString().padLeft(4, '0')}-${firstObservationDate!.month.toString().padLeft(2, '0')}-${firstObservationDate!.day.toString().padLeft(2, '0')}",
        "last_observation_date": lastObservationDate == null ? null : "${lastObservationDate!.year.toString().padLeft(4, '0')}-${lastObservationDate!.month.toString().padLeft(2, '0')}-${lastObservationDate!.day.toString().padLeft(2, '0')}",
        "data_arc_in_days": dataArcInDays == null ? null : dataArcInDays,
        "observations_used": observationsUsed == null ? null : observationsUsed,
        "orbit_uncertainty": orbitUncertainty == null ? null : orbitUncertainty,
        "minimum_orbit_intersection": minimumOrbitIntersection == null ? null : minimumOrbitIntersection,
        "jupiter_tisserand_invariant": jupiterTisserandInvariant == null ? null : jupiterTisserandInvariant,
        "epoch_osculation": epochOsculation == null ? null : epochOsculation,
        "eccentricity": eccentricity == null ? null : eccentricity,
        "semi_major_axis": semiMajorAxis == null ? null : semiMajorAxis,
        "inclination": inclination == null ? null : inclination,
        "ascending_node_longitude": ascendingNodeLongitude == null ? null : ascendingNodeLongitude,
        "orbital_period": orbitalPeriod == null ? null : orbitalPeriod,
        "perihelion_distance": perihelionDistance == null ? null : perihelionDistance,
        "perihelion_argument": perihelionArgument == null ? null : perihelionArgument,
        "aphelion_distance": aphelionDistance == null ? null : aphelionDistance,
        "perihelion_time": perihelionTime == null ? null : perihelionTime,
        "mean_anomaly": meanAnomaly == null ? null : meanAnomaly,
        "mean_motion": meanMotion == null ? null : meanMotion,
        "equinox": equinox == null ? null : equinox,
        "orbit_class": orbitClass == null ? null : orbitClass!.toJson(),
    };
}

class OrbitClass {
    OrbitClass({
        this.orbitClassType,
        this.orbitClassDescription,
        this.orbitClassRange,
    });

    String? orbitClassType;
    String? orbitClassDescription;
    String? orbitClassRange;

    factory OrbitClass.fromRawJson(String str) => OrbitClass.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OrbitClass.fromJson(Map<String, dynamic> json) => OrbitClass(
        orbitClassType: json["orbit_class_type"] == null ? null : json["orbit_class_type"],
        orbitClassDescription: json["orbit_class_description"] == null ? null : json["orbit_class_description"],
        orbitClassRange: json["orbit_class_range"] == null ? null : json["orbit_class_range"],
    );

    Map<String, dynamic> toJson() => {
        "orbit_class_type": orbitClassType == null ? null : orbitClassType,
        "orbit_class_description": orbitClassDescription == null ? null : orbitClassDescription,
        "orbit_class_range": orbitClassRange == null ? null : orbitClassRange,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
