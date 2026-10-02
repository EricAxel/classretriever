import 'package:collection/collection.dart';

enum UiCorners {
  BottomRight,
  Top_Right,
  Top_Left,
  Bottom_Left,
}

enum Status {
  Success,
  Failed,
  Pending,
}

enum UiSize {
  xxSmall,
  xSmall,
  Small,
  Medium,
  Large,
  xLarge,
}

enum UiType {
  Solid,
  Outline,
}

enum EventRecurrency {
  Hour,
  Day,
  Week,
  Bi_Week,
  Month,
  Bi_Month,
  Quarter,
  Semester,
  Year,
}

enum UiAlign {
  Left,
  Center,
  Right,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (UiCorners):
      return UiCorners.values.deserialize(value) as T?;
    case (Status):
      return Status.values.deserialize(value) as T?;
    case (UiSize):
      return UiSize.values.deserialize(value) as T?;
    case (UiType):
      return UiType.values.deserialize(value) as T?;
    case (EventRecurrency):
      return EventRecurrency.values.deserialize(value) as T?;
    case (UiAlign):
      return UiAlign.values.deserialize(value) as T?;
    default:
      return null;
  }
}
