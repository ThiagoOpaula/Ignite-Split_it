abstract class EventDetailsStatus {}

class EventDetailsStatusEmpty extends EventDetailsStatus {}

class EventDetailsStatusLoading extends EventDetailsStatus {}

class EventDetailsStatusSucess extends EventDetailsStatus {}

class EventDetailsStatusFailure extends EventDetailsStatus {
  final String message;

  EventDetailsStatusFailure({
    required this.message,
  });
}
