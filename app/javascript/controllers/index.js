// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import AddressAutocompleteController from "./address_autocomplete_controller"
application.register("address-autocomplete", AddressAutocompleteController)

import CompanyAddressAutocompleteController from "./company_address_autocomplete_controller"
application.register("company-address-autocomplete", CompanyAddressAutocompleteController)

import DisplaySuggestionsController from "./display_suggestions_controller"
application.register("display-suggestions", DisplaySuggestionsController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import MapController from "./map_controller"
application.register("map", MapController)
