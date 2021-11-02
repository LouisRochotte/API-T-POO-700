<script>
import { Bar } from "vue-chartjs";
export default {

    extends: Bar,

    
    mounted() {
        this.renderChart({
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
                "December"
            ],
            datasets: [{
                label: "Hour per month",
                backgroundColor: "#2dce89",
                data: [145, 133, 146, 132, 125, 126, 142, 141, 146, 133, 128, 145, 0]
            }],
        }, { responsive: true, maintainAspectRatio: false });
    }
};
</script>