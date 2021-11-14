<template> 
<div>
    <div class="row">
      <div class="col-12">
        <card class="card-text">
            <h2> Total wourk hour for the team A this mounth : (voir working hour)</h2>
        </card>
        <card id="table-card">
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
                  <br>
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
                     <!-- <tr>
                        <td> test </td>
                        <td> test </td>
                        <td> test </td>
                        <td> test </td>
                        <td> test </td>
                        <td> test </td>
                      </tr> -->
                    </tbody>                         
                  </table>
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

  const apiEndPoint = process.env.VUE_APP_API_ENDPOINT;
  export default {
    data() {
      return {
        search:'',
        users: []
      };
    },
    mounted() {
      axios
        .get(`${apiEndPoint}/users`)
        .then((response) => {  
          this.users = response.data.data; 
          if(this.search)
          {
            return response.data.data.filter((item) => {
              this.users = item.firstname.toLowerCase().startsWith(this.Search);
            }) 
          }        
        });
    },
    methods: {
      workingTimes(userId) 
      {
        axios
          .get(`${apiEndPoint}/workingtimes/${userId}`)
          .then((response) => {
              return response.end; //quoi mettre? dans la table working time il y a start et end mais pas de temps de travail
          })  
      }
    }
    // methods:{
    //   result() {
    //     return this.users.filter((user) => {
    //       return user.firstname.toLowerCase().startsWith(this.Search);
    //     })
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