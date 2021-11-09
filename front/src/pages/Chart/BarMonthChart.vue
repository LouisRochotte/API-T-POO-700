<script>
import { Bar } from "vue-chartjs";

export default {
  extends: Bar,
  props: {
    arrayWorkingTimes: Object
  },

  mounted() {
    let chartData = [];

    console.log(this.arrayWorkingTimes);
    console.log(this.arrayWorkingTimes["November"]);

    for (const [key, value] of Object.entries(this.arrayWorkingTimes)) {
       chartData.push(value);
    //   console.log(value);
    }
    // console.log(this.arrayWorkingTimes["November"])

    // console.log(this.arrayWorkingTimes);
    // for (const [key, value] of Object.entries(this.arrayWorkingTimes)) {
    //     console.log(value)

    // }
    // this.arrayWorkingTimes.forEach(element => {
    //     difference = element.start.diff(element.end, 'hours');
    //     console.log(difference)
    // });
    this.renderChart(
      {
        labels: [
          "January",
          "February",
          "March",
          "April",
          "May",
          "June",
          "July",
          "August",
          "September",
          "october",
          "November",
          "December",
        ],
        datasets: [
          {
            label: "Hour per month",
            backgroundColor: "#2dce89",
            data: chartData,
          },
        ],
      },
      { responsive: true, maintainAspectRatio: false }
    );
  },
};
</script>