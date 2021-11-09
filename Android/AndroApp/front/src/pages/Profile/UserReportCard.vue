<template>
  <card>
    <p class="card-text"></p>
    <div class="author">
      <h5 class="title">{{ todayDate }}</h5>
      <div class="row">
        <div class="col">
          <base-input
            label="Arrival time"
            v-model="Arrival"
            placeholder="Please confirm arrival"
          >
          </base-input>
          <!-- <vue-timepicker format="HH:mm"></vue-timepicker> -->
        </div>

        <div class="col">
          <base-input
            label="Departure time"
            v-model="Departure"
            placeholder="Please confirm departure"
          >
          </base-input>
        </div>
      </div>
      <div class="row d-flex justify-content-center">
        <h5 id="info">{{ confirmStatusText }}</h5>
      </div>
      <div class="row">
        <div class="col d-flex justify-content-center">
          <base-button type="primary" fill v-on:click="confirmArrival"
            >Clock in</base-button
          >
        </div>
      </div>
    </div>

    <p></p>
  </card>
</template>
<script>
import VueTimepicker from "vue2-timepicker";
import moment from "moment";

export default {
  props: {
    user: {
      type: Object,
      default: () => {
        return {};
      },
    },
  },
  data() {
    return {
      todayDate: "",
      Arrival: "",
      Departure: "",
      confirmStatusText: "Please your arrival",
      Arrived: true,
    };
  },
  components: {
    VueTimepicker,
  },
  mounted() {
    this.todayDate = moment().format("MMMM Do YYYY");
  },
  methods: {
    confirmArrival: function () {
      if (this.Arrived) {
        if (confirm("Do you want to confirm your arrival?")) {
          this.Arrival = moment().format("LTS");
          this.confirmStatusText = "Press confirm to validate departure.";
          this.Arrived = false;
        }
      } else {
        if (confirm("Do you want to confirm your departure?")) {
          this.Departure = moment().format("LTS");
          this.confirmStatusText = "Arrival and departure validated for today.";
        }
      }
    },
  },
};
</script>
<style>
#info {
  color: #e3dc54;
}
</style>
