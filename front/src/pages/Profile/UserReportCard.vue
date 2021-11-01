<template>
  <card>
    <p class="card-text"></p>
    <div class="author">
      <div class="row">
        <div class="col">
          <vue-timepicker format="HH:mm"></vue-timepicker>
        </div>

        <div class="col">
          <base-button type="primary" fill>Confirm</base-button>
        </div>
      </div>
    </div>

    <p></p>
  </card>
</template>
<script>
import VueTimepicker from "vue2-timepicker";

export default {
  props: {
    user: {
      type: Object,
      default: () => {
        return {};
      },
    },
  },
  components: {
    VueTimepicker,
  },
};
</script>
<style>
</style>
