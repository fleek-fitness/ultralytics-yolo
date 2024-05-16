import 'dart:ui';

/// A detected object.
class DetectedObject {
  /// Creates a [DetectedObject].
  DetectedObject({
    required this.confidence,
    required this.boundingBox,
    required this.index,
    required this.label,
    this.detectedAt,
    this.isValid = false,
  });

  /// Creates a [DetectedObject] from a [json] object.
  factory DetectedObject.fromJson(Map<dynamic, dynamic> json) {
    return DetectedObject(
      confidence: json['confidence'] as double,
      boundingBox: Rect.fromLTWH(
        json['x'] as double,
        json['y'] as double,
        json['width'] as double,
        json['height'] as double,
      ),
      index: json['index'] as int,
      label: json['label'] as String,
      detectedAt: DateTime.now(),
      isValid: false,
    );
  }

  DetectedObject copyWith({
    DateTime? detectedAt,
    bool? isValid,
  }) {
    return new DetectedObject(
      confidence: confidence,
      boundingBox: boundingBox,
      index: index,
      label: label,
      detectedAt: detectedAt ?? this.detectedAt,
      isValid: isValid ?? this.isValid,
    );
  }

  /// The confidence of the detection.
  final double confidence;

  /// The bounding box of the detection.
  final Rect boundingBox;

  /// The index of the label.
  final int index;

  /// The label of the detection.
  final String label;

  /// The time the object was detected.
  DateTime? detectedAt;

  /// Whether the object is valid.
  bool isValid;
}
