<script>
import { Bar } from "vue-chartjs";
export default {

    extends: Bar,

    
    mounted() {
        this.renderChart({
            labels: [
                "Week 1",
                "Week 2",
                "Week 3",
                "Week 4",
                "Week 5",
                "Week 6",
                "Week 7",
                "Week 8",
                "Week 9",
                "Week 10",
                "Week 11",
                "Week 12"
            ],
            datasets: [{
                label: "Hour per week (3 month)",
                backgroundColor: "#2dce89",
                data: [32, 36, 40, 37, 38, 28, 32, 35, 42, 41, 27, 36, 0]
            }],
        }, { responsive: true, maintainAspectRatio: false });
    }
};

</script>
