// To parse this JSON data, do
//
//     final asteroids = asteroidsFromJson(jsonString);

import 'dart:convert';

class Asteroids {
    Asteroids({
        this.links,
        this.elementCount,
        this.nearEarthObjects,
    });

    AsteroidsLinks? links;
    int? elementCount;
    Map<String, List<NearEarthObject>>? nearEarthObjects;

    factory Asteroids.fromRawJson(String str) => Asteroids.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Asteroids.fromJson(Map<String, dynamic> json) => Asteroids(
        links: json["links"] == null ? null : AsteroidsLinks.fromJson(json["links"]),
        elementCount: json["element_count"] == null ? null : json["element_count"],
        nearEarthObjects: json["near_earth_objects"] == null ? null : Map.from(json["near_earth_objects"]).map((k, v) => MapEntry<String, List<NearEarthObject>>(k, List<NearEarthObject>.from(v.map((x) => NearEarthObject.fromJson(x))))),
    );

    Map<String, dynamic> toJson() => {
        "links": links == null ? null : links!.toJson(),
        "element_count": elementCount == null ? null : elementCount,
        "near_earth_objects": nearEarthObjects == null ? null : Map.from(nearEarthObjects!).map((k, v) => MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x.toJson())))),
    };
}

class AsteroidsLinks {
    AsteroidsLinks({
        this.next,
        this.previous,
        this.self,
    });

    String? next;
    String? previous;
    String? self;

    factory AsteroidsLinks.fromRawJson(String str) => AsteroidsLinks.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AsteroidsLinks.fromJson(Map<String, dynamic> json) => AsteroidsLinks(
        next: json["next"] == null ? null : json["next"],
        previous: json["previous"] == null ? null : json["previous"],
        self: json["self"] == null ? null : json["self"],
    );

    Map<String, dynamic> toJson() => {
        "next": next == null ? null : next,
        "previous": previous == null ? null : previous,
        "self": self == null ? null : self,
    };
}

class NearEarthObject {
    NearEarthObject({
        this.links,
        this.id,
        this.neoReferenceId,
        this.name,
        this.nasaJplUrl,
        this.absoluteMagnitudeH,
        this.estimatedDiameter,
        this.isPotentiallyHazardousAsteroid,
        this.closeApproachData,
        this.isSentryObject,
    });

    NearEarthObjectLinks? links;
    String? id;
    String? neoReferenceId;
    String? name;
    String? nasaJplUrl;
    double? absoluteMagnitudeH;
    EstimatedDiameter? estimatedDiameter;
    bool? isPotentiallyHazardousAsteroid;
    List<CloseApproachDatum>? closeApproachData;
    bool? isSentryObject;

    factory NearEarthObject.fromRawJson(String str) => NearEarthObject.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory NearEarthObject.fromJson(Map<String, dynamic> json) => NearEarthObject(
        links: json["links"] == null ? null : NearEarthObjectLinks.fromJson(json["links"]),
        id: json["id"] == null ? null : json["id"],
        neoReferenceId: json["neo_reference_id"] == null ? null : json["neo_reference_id"],
        name: json["name"] == null ? null : json["name"],
        nasaJplUrl: json["nasa_jpl_url"] == null ? null : json["nasa_jpl_url"],
        absoluteMagnitudeH: json["absolute_magnitude_h"] == null ? null : json["absolute_magnitude_h"].toDouble(),
        estimatedDiameter: json["estimated_diameter"] == null ? null : EstimatedDiameter.fromJson(json["estimated_diameter"]),
        isPotentiallyHazardousAsteroid: json["is_potentially_hazardous_asteroid"] == null ? null : json["is_potentially_hazardous_asteroid"],
        closeApproachData: json["close_approach_data"] == null ? null : List<CloseApproachDatum>.from(json["close_approach_data"].map((x) => CloseApproachDatum.fromJson(x))),
        isSentryObject: json["is_sentry_object"] == null ? null : json["is_sentry_object"],
    );

    Map<String, dynamic> toJson() => {
        "links": links == null ? null : links!.toJson(),
        "id": id == null ? null : id,
        "neo_reference_id": neoReferenceId == null ? null : neoReferenceId,
        "name": name == null ? null : name,
        "nasa_jpl_url": nasaJplUrl == null ? null : nasaJplUrl,
        "absolute_magnitude_h": absoluteMagnitudeH == null ? null : absoluteMagnitudeH,
        "estimated_diameter": estimatedDiameter == null ? null : estimatedDiameter!.toJson(),
        "is_potentially_hazardous_asteroid": isPotentiallyHazardousAsteroid == null ? null : isPotentiallyHazardousAsteroid,
        "close_approach_data": closeApproachData == null ? null : List<dynamic>.from(closeApproachData!.map((x) => x.toJson())),
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

enum OrbitingBody { EARTH }

final orbitingBodyValues = EnumValues({
    "Earth": OrbitingBody.EARTH
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
        estimatedDiameterMin: json["estimated_diameter_min"].toDouble(),
        estimatedDiameterMax: json["estimated_diameter_max"] == null ? null : json["estimated_diameter_max"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "estimated_diameter_min": estimatedDiameterMin == null ? null : estimatedDiameterMin,
        "estimated_diameter_max": estimatedDiameterMax == null ? null : estimatedDiameterMax,
    };
}

class NearEarthObjectLinks {
    NearEarthObjectLinks({
        this.self,
    });

    String? self;

    factory NearEarthObjectLinks.fromRawJson(String str) => NearEarthObjectLinks.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory NearEarthObjectLinks.fromJson(Map<String, dynamic> json) => NearEarthObjectLinks(
        self: json["self"] == null ? null : json["self"],
    );

    Map<String, dynamic> toJson() => {
        "self": self == null ? null : self,
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
