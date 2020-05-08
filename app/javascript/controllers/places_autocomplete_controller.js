import ApplicationController from './application_controller'
import AddressAutocomplete from 'google-address-autocomplete';

export default class extends ApplicationController {
  connect() {
    new AddressAutocomplete(`#${this.element.id}`, (results) => {
      console.log(results);
    });
  }

  updateAllAddressFields(e) {
    e.preventDefault();
    if (e.keyCode == 13) {
      e.preventDefault();
    }
  }
}
