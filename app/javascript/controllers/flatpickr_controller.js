import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = [ "dateFrom", "dateTo","participants","beverage","food", "otherservices"]

  connect() {
    console.log("flatpickr");
    flatpickr(this.dateFromTarget, {
      enableTime: false
    })
    flatpickr(this.dateToTarget, {
      enableTime: false
    })
  }

  calculateTotalPrice(){

    const FOOD_OPTIONS = {"Local Cuisine Experience": 1000, "Dinner Only" :2000, "All inclusive" : 4000, "Continental Breakfast" : 1500}
    const BEVERAGE_OPTIONS = {"Alcoholic":2000, "Non-alcoholic" :  4000, "Alcoholic and Non-alcoholic": 7000 }
    const OTHER_SERVICES_OPTIONS = {"Changing room with lockers" :  2000, "Guided tours" :  3000, "Land and water activities" :  4000 }

    // const FOOD_OPTIONS = {"Salads":100, "Pasta" : 200, "Mini croques" : 50, "Fruits" : 200};
    // const BEVERAGE_OPTIONS = {"Smoothies and soft drinks" : 100, "Alcoholic" : 300, "Non-alcoholic beverages" : 500};
    // const OTHER_SERVICES_OPTIONS = {"Room with private view" : 100, "Guided tours" : 200, "Bottle of champagne" : 300};

    const subTotalElement = document.getElementById("subtotal-value");
    const venuePrice = parseInt(document.getElementById("venue-price").textContent,10)


    var total = 0;

    // subTotalElement.innerText = "200";

    const startDate = new Date(this.dateFromTarget.value);
    const endDate = new Date(this.dateToTarget.value);

    if ( !isNaN(startDate) && ! isNaN(endDate)) {

      const diff = endDate - startDate;
      const daysDiff = Math.round(
        diff /  (1000 * 60 * 60 * 24)
      )
      total = (daysDiff+1) * venuePrice;

      const foodOffered = document.getElementById("food-bev-offered");
      console.log("foodOffered"  , foodOffered);
      const isFoodOffered = foodOffered.textContent.trim()  == "Yes";
      console.log("isFoodOffered", isFoodOffered);

      if (isFoodOffered){
        if (this.beverageTarget.value != null &&   BEVERAGE_OPTIONS.hasOwnProperty(this.beverageTarget.value)) {
          total += ( BEVERAGE_OPTIONS[this.beverageTarget.value] * (daysDiff+1) );
        }

        if (this.foodTarget.value != null &&   FOOD_OPTIONS.hasOwnProperty(this.foodTarget.value)) {
          total += ( FOOD_OPTIONS[this.foodTarget.value] * (daysDiff+1) );
        }
      }

      const servicesOffered = document.getElementById("services-offered");
      const isServicesOffered = servicesOffered.textContent.trim()  == "Yes";
      console.log("isServicesOffered 1", isServicesOffered);
      if (isServicesOffered) {
        if (this.otherservicesTarget && this.otherservicesTarget.value != null &&   OTHER_SERVICES_OPTIONS.hasOwnProperty(this.otherservicesTarget.value)) {
          total += ( OTHER_SERVICES_OPTIONS[this.otherservicesTarget.value] * (daysDiff+1) );
        }

      }



      subTotalElement.innerText = total;


    }

    // console.log("calculate");
    // console.log(this.participantsTarget.value);
    // console.log(this.beverageTarget.value);
    // console.log(this.foodTarget.value);

    // date_booked = (self.date_to - self.date_from).to_i
    // venue_price = self.venue.price * date_booked
    // total += venue_price

    // if self.food.present? && FOOD_OPTIONS.key?(self.food)
    //   total += FOOD_OPTIONS[self.food]
    // end

    // if self.beverage.present? && BEVERAGE_OPTIONS.key?(self.beverage)
    //   total += BEVERAGE_OPTIONS[self.beverage]
    // end

    // if self.other_services_offered.present? && OTHER_SERVICES_OPTIONS.key?(self.other_services_offered)
    //   total += OTHER_SERVICES_OPTIONS[self.other_services_offered]
    // end
  }
}
