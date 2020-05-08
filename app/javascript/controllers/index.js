// Load all the controllers within this directory and all subdirectories.
// Controller files must be named *_controller.js.

import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"
import StimulusReflex from 'stimulus_reflex'

// Manually register Flatpickr as a stimulus controller
const application = Application.start()
const context = require.context("controllers", true, /_controller\.js$/)
const controllers = definitionsFromContext(context)
application.load(controllers)

StimulusReflex.initialize(application)
