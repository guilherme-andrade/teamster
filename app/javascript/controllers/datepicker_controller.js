import Flatpickr from "stimulus-flatpickr";
import StimulusReflex from 'stimulus_reflex'
import I18n from 'i18n-js'

import { Portuguese } from "flatpickr/dist/l10n/pt.js";

export default class extends Flatpickr {
  locales = {
    pt: Portuguese
  };

  connect() {
    StimulusReflex.register(this)

    this.config = {
      locale: window.locale,
      altInput: true,
      showMonths: 2
    };

    super.connect();
  }
}
