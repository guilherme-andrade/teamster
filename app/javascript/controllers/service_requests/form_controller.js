import ApplicationController from '../application_controller'

export default class extends ApplicationController {
  addParcel(e) {
    e.preventDefault();
    e.stopPropagation();

    const parcel = {
      weight_value: document.getElementById('parcel-weight').value,
      height_value: document.getElementById('parcel-height').value,
      width_value: document.getElementById('parcel-width').value,
      length_value: document.getElementById('parcel-length').value
    }
    console.log(parcel);

    this.stimulate('ServiceRequests::FormReflex#add_parcel', parcel)
  }
}
