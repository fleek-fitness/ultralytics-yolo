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
    this.base64Encoded,
    // this.croppedImagePath,
  });

  /// Creates a [DetectedObject] from a [json] object.
  factory DetectedObject.fromJson(Map<dynamic, dynamic> json) {
    return DetectedObject(
      confidence: (json['confidence'] as num).toDouble(),
      boundingBox: Rect.fromLTWH(
        (json['x'] as num).toDouble(),
        (json['y'] as num).toDouble(),
        (json['width'] as num).toDouble(),
        (json['height'] as num).toDouble(),
      ),
      index: json['index'] as int,
      label: json['label'] as String,
      detectedAt: DateTime.now(),
      base64Encoded: json['base64Encoded'] as String?,
      // croppedImagePath: json['croppedImagePath'] as String?,
    );
  }

  toJson() {
    return {
      'confidence': confidence,
      'x': boundingBox.left,
      'y': boundingBox.top,
      'width': boundingBox.width,
      'height': boundingBox.height,
      'index': index,
      'label': label,
      'base64Encoded': base64Encoded,
      // 'croppedImagePath': croppedImagePath,
    };
  }

  /// Copy the [DetectedObject] with the given parameters.
  DetectedObject copyWith({
    DateTime? detectedAt,
    bool? isValid,
  }) {
    return DetectedObject(
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

  /// The base64 encoded image.
  final String? base64Encoded;

  // /// The path of the cropped image.
  // final String? croppedImagePath;

  /// The area of the bounding box.
  double get area => boundingBox.width * boundingBox.height;
}
