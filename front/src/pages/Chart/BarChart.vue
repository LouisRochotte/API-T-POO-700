<script>
import { Bar } from "vue-chartjs";
export default {

    extends: Bar,

    
    mounted() {
        this.renderChart({
            labels: [
                "Monday",
                "Tuesday",
                "Wednesday",
                "Thursday",
                "Friday",
                "Saturday",
                "Sunday"
            ],
            // labelsMonth: [
            //     "January",
            //     "February",
            //     "March",
            //     "April",
            //     "May",
            //     "June",
            //     "July",
            //     "August",
            //     "September",
            //     "october",
            //     "November",
            //     "December"
            // ],
            datasets: [{
                label: "Hour per day",
                backgroundColor: "#2dce89",
                data: [7, 4, 10, 7, 6, 4, 9, 0]
            }],
            // datasetsMonth: [{
            //     label: "Hour per month",
            //     backgroundColor: "#2dce89",
            //     data: [126, 95, 72, 132, 125, 126, 142, 141, 146, 133, 76, 95, 0]
            // }],
        }, { responsive: true, maintainAspectRatio: false });
    }
};

</script>
