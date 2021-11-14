<template>
  <div>
    <h3 class="p-3 text-center">USER LIST</h3>
    <div class="table-responsive">
      <table class="table table-striped table-bordered">
        <thead>
          <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Role</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="user in filterUsers" :key="user.id">
            <td>{{ user.firstname }} {{ user.lastname }}</td>
            <td>{{ user.email }}</td>
            <td>{{ user.role }}</td>
            <td>
              <button
                class="btn btn-success m-1"
                v-on:click="promoteUser(user.id)"
              >
                Promote
              </button>
              <button
                class="btn btn-danger m-1"
                v-on:click="deleteUser(user.id)"
              >
                Delete
              </button>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import authHeader from "../services/auth-header";

const apiEndPoint = process.env.VUE_APP_API_ENDPOINT;

export default {
  computed: {
    currentUser() {
      return this.$store.state.auth.user;
    },
    filterUsers: function () {
      return this.users.filter(function (u) {
        return u.role != "GeneralManager";
      });
    }, // contains only Alex and James
  },
  data() {
    return {
      users: [],
    };
  },
  methods: {
    getUsers() {
      axios
        .get(`${apiEndPoint}/users`, authHeader())
        .then((response) => {
          this.users = response.data.data;
          console.log(this.users);
        })
        .catch((e) => {
          this.errors.push(e);
        });
    },
    promoteUser(id) {
      if (confirm("Are you sure to promote this user to Manager?")) {
        axios
          .put(
            `${apiEndPoint}/users/${id}`,
            {
              user: {
                role: "Manager",
              },
            },
            authHeader()
          )
          .then((response) => {
            this.getUsers();
          })
          .catch((e) => {
            this.errors.push(e);
          });
      }
    },
    deleteUser(id) {
      if (confirm("Are you sure to delete this user?")) {
        axios
          .delete(
            `${apiEndPoint}/users/${id}`,

            authHeader()
          )
          .then((response) => {
            this.getUsers();
          })
          .catch((e) => {
            this.errors.push(e);
          });
      }
    },
  },
  //  .put(this.path + '/' + id + '/promote', {
  //     user: {
  //       role: 1
  //     }
  mounted() {
    this.getUsers();
  },
};
</script>
<style scope="">
thead {
  background-color: rgba(39, 41, 61, 1);
}
.table-bordered {
  border: 0.0625rem solid rgba(255, 255, 255, 0.1);
}
.table-responsive {
  overflow: auto;
}
.table {
  width: 99% !important;
}
</style>