abstract class CityDeleteEvent {}

class DeleteEvent extends CityDeleteEvent {
  var indexToDelete;
  DeleteEvent({required int indexToDelete}) {
    this.indexToDelete = indexToDelete;
  }
}

class DeleteInitEvent extends CityDeleteEvent {}
