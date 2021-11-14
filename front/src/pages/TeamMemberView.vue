<template> 
  <div>
    <div class="row">
      <div class="col-12">
        <card class="card-text">
          <h2> Total wourk hour for the team A this mounth : (voir working hour)</h2>
          <select class="form-select" aria-label="Default select example" @change="getUserFromSelect">
            <option selected>Select a team member</option>
            <option v-for="user in users" :key="user.id" :value="user.id">{{ user.firstname }} {{ user.lastname }}</option>
          </select>
        </card>
        <div class="row">
          <div class="col-12">
            <card type="chart" id="long-card">
              <template slot="header">
                <div class="row">
                  <div class="col-sm-6">
                    <h5 class="card-category">Work management</h5>
                    <h2 class="card-title">Working hours</h2>
                    <button t ype="button" class="btn btn-success" @click="month">
                      Month
                    </button>
                    <button type="button" class="btn btn-success" @click="week">
                      Week
                    </button>
                  </div>
                </div>
              </template>
              <div class="chart-area">
                <BarMonthChart
                  :arrayWorkingTimes="arrayWorkingTimes"
                  v-show="barMonthChart"
                  v-if="done"
                />
                <BarWeekChart :wArr="wArr" v-show="barWeekChart" v-if="done" />
              </div>
           </card>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-4">
            <card type="chart" id="short-card">
              <template slot="header">
                <h5 class="card-category">Work Management</h5>
                <h2 class="card-title">Hours details</h2>
              </template>
              <div class="chart-area">
                <PieChart v-if="done" :pieData="pieData" />
              </div>
            </card>
          </div>
          <div class="col-lg-4">
            <card type="chart" id="medium-card">
              <template slot="header">
                <h5 class="card-category">Lorem Ipsum</h5>
                <h2 class="card-title">Lorem Ipsum</h2>
              </template>
            <div class="chart-area">
              <AreaChart />
            </div>
          </card>
        </div>
      </div>
    </div>
        <!-- <card id="table-card">
          <template slot="header">
            <div class="row">
              <div class="col-sm-6">
                <h5 class="card-category">Work Management</h5>
                <h2 class="card-title">Details : </h2>
                <div class="search-user"> 
                  <label>Search an user : </label><br>
                  <input type="text" v-model="search"/>
                </div>
                <div class="users">
                  
                  <table class="table table-striped">
                    <thead class="table-bordered">
                      <tr>
                        <th>First name</th>
                        <th>Last name</th>
                        <th>E-mail</th>
                        <th>Working time</th>
                      </tr>
                    </thead>
                    <tbody class="table-bordered">
                      <tr v-for="user in users" :key="user.id"> 
                        <td>{{ user.firstname }}</td>
                        <td>{{ user.lastname }}</td>
                        <td>{{ user.email }}</td>
                        <td>{{ this.workingTimes(user.id) }} </td>
                        <td>
                          <button class="btn btn-success m-1">Chart View</button>
                        </td>
                      </tr>
                    </tbody>                         
                  </table> -->
                  <!-- <nav aria-label="Page navigation example">
                    <ul class="pagination">
                      <li class="page-item"><a class="page-link" href="#">{{count}}</a></li>
                    </ul>
                  </nav> -->
                </div>
              </div>
            </div>
          </template>
        </card>
      </div>
    </div>
  </div>
</template>

<script>
  import axios from "axios";
  import moment from "moment";
  import BarWeekChart from "./Chart/BarWeekChart.vue";
  import BarMonthChart from "./Chart/BarMonthChart.vue";
  import PieChart from "./Chart/PieChart.vue";
  import AreaChart from "./Chart/AreaChart.vue";

  const apiEndPoint = process.env.VUE_APP_API_ENDPOINT;
  
  export default {
    components: {
      BarWeekChart,
      BarMonthChart,
      PieChart,
      AreaChart,
    },
    data() {
      return {
        // search:'',
        userSelected: '',
        users: [],
        chartData: {
          GrossSalary: 2500,
          NetSalary: 1750,
          IncomeTaxes: 750,
          Taxes: 900,
        },
        done: false,

        barWeekChart: true,
        barMonthChart: true,
        arrayWorkingTimes: {
          January: 0,
          February: 0,
          March: 0,
          April: 0,
          May: 0,
          June: 0,
          July: 0,
          August: 0,
          September: 0,
          October: 0,
          November: 0,
          December: 0,
        },
        wArr: {},
        pieData: {
          overtime: 0,
          normal: 0,
          night: 1,
          majorated : 0
        }
      };
    },
    mounted() {
      axios
        .get(`${apiEndPoint}/users`)
        .then((response) => {  
          this.users = response.data.data;     
        });
    },
    methods: {
      getUserFromSelect(event){
        userSelected = event.target.value;
        createGraph();
      },

      month() {
        this.barWeekChart = false;
        this.barMonthChart = true;
      },
      week() {
        this.barWeekChart = true;
        this.barMonthChart = false;
      },

      createGraph(){
        let currentYear = new Date().getFullYear();
        axios
          .get(`${apiEndPoint}/workingtimes/${userSelected}`)
          .then((response) => {
            let yearWorkingTimes = response.data.data;
            let wk = moment(new Date()).week();
            let firstWeek = wk - 12;
            let majorated = 0;
            for (let i = 0; i < 12; i++) {
              this.wArr[wk - 11 + i] = 0;
            }
            yearWorkingTimes.forEach((element) => {
              let elementStart = new Date(element.start);
              let elementEnd = new Date(element.end);
              let diff = moment(elementEnd).diff(moment(elementStart), "hours");

              // Hour per month Bar Chart
              if (new Date().getFullYear() == elementStart.getFullYear()) {
                let month = elementStart.toLocaleString("en-EN", {
                  month: "long",
                });

                this.arrayWorkingTimes[month] += diff;
                let elementWeek = moment(elementStart).week();

                if (elementWeek >= firstWeek) {
                  this.wArr[wk - (wk - elementWeek)] += diff;
                }
              }

              // Pie Chart Majorated hours
              if (diff > 7) {
                this.pieData.overtime += diff - 7;
              }
              else this.pieData.normal += diff;

              // Pie Chart weekend hours
              if (elementStart.getDay() == 0 || elementStart.getDay() == 6){
                this.pieData.majorated += diff;
              }
              // if (elementStart.getHours() < 7 && elementStart.getHours() >= 21) {
              //   Majorated += diff;
              // }
            });
            console.log(this.pieData);

            this.done = true;
          })
          .catch((e) => {
            this.errors.push(e);
          });
      }, 

      
    }
    // methods: {
    //   workingTimes(userId) 
    //   {
    //     axios
    //       .get(`${apiEndPoint}/workingtimes/${userId}`)
    //       .then((response) => {
    //           return response.end; //quoi mettre? dans la table working time il y a start et end mais pas de temps de travail
    //       })  
    //   }
    // }
  };
</script>

<style scope=""> 
  /* thead {
    background-color: rgba(39, 41, 61, 1);
  }
  #table-card{
    width: 60%;
  }
  .table-bordered {
    border: 0.0625rem solid rgba(255, 255, 255, 0.1);
    
  }
  .table-responsive {
    overflow: auto;
  }
  .table {
    width: 200% !important;
  } */
</style>