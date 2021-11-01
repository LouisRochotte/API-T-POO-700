<template>
    <div>
        <div class="row">
            <div class="col-12">
                <card type="chart" id="long-card">
                    <template slot="header">
                        <div class="row">
                            <div class="col-sm-6" :class="isRTL ? 'text-right' : 'text-left'">
                                <h5 class="card-category">
                                    Work management
                                </h5>
                                <h2 class="card-title">Working hours</h2>
                                <button type="button" class="btn btn-success" @click="">Month</button>
                                <button type="button" class="btn btn-success" @click="">Days</button>
                            </div>
                            <div class="col-sm-6"></div>
                        </div>
                    </template>
                    <div class="chart-area">
                        <BarChart></BarChart>
                    </div>
                </card>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4" :class="{ 'text-right': isRTL }">
                <card type="chart" id="short-card">
                    <template slot="header">
                        <h5 class="card-category">Lorem ipsum</h5>
                        <h2 class="card-title">Lorem Ipsum</h2>
                    </template>
                    <div class="chart-area">
                        <PieChart/>
                    </div>
                </card>
            </div>
            <div class="col-lg-4" :class="{ 'text-right': isRTL }">
                <card type="chart" id="medium-card">
                    <template slot="header">
                        <h5 class="card-category">Lorem Ipsum</h5>
                        <h2 class="card-title">Lorem Ipsum</h2>
                    </template>
                    <div class="chart-area" >
                        <AreaChart/>
                    </div>
                </card>
            </div>
        </div>
    </div>
</template>

<script>
import BarChart from "./Chart/BarChart.vue";
import PieChart from "./Chart/PieChart.vue";
import AreaChart from "./Chart/AreaChart.vue";
export default {
    name: "App",
    components: {
        BarChart,
        PieChart,
        AreaChart
    },
    data() {
        return {
            chartData: {
                GrossSalary: 2500,
                NetSalary: 1750,
                IncomeTaxes: 750,
                Taxes: 900,
            },
            // chart: BarChart
            // labelsTest: $BarChart.labelsMonth,
            // datasetsTest: $BarChart.datasetsMonth
        };
    },
//     methods: {
//         displayMonthChart() {
//             this.labelsTest = [
//                 $BarChart.labelsMonth
//             ],
//             this.datasetsTest = [
//                 $BarChart.datasetsMonth
//             ];
//         },
//         displayDaysChart() {
//             this.labelsTest = [
//                 $BarChart.labelsDays
//             ],
//             this.datasetsTest = [
//                 $BarChart.datasetsDays
//             ];
//         }
//     }
};
</script>
<style>
    #long-card{
        width: auto;
        height: 540px;
    }
    #short-card, #medium-card{
        height:520px;
    }
    #medium-card
    {
        width: 206%;
    }
    @media(max-width: 970px)
    {
        #medium-card{
            width: auto;
        }
    }
</style>
