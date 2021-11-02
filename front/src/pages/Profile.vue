<template>
  <div class="row">
    <div class="col-md-4">
      <user-card :user="user"></user-card>
      <user-report-card :user="user"></user-report-card>

    </div>
    <div class="col-md-8">
      <edit-profile-form :user="user" @editUser="editUser" @deleteUser="deleteUser"> </edit-profile-form>
    </div>
  </div>
</template>
<script>
import EditProfileForm from "./Profile/EditProfileForm";
import UserCard from "./Profile/UserCard";
import UserReportCard from "./Profile/UserReportCard";

import axios from "axios";

export default {
  components: {
    EditProfileForm,
    UserCard,
    UserReportCard
  },
  data() {
    return {
      model: {},
      user: {},
    };
  },
  created() {
    axios
      .get(`http://localhost:4000/api/users/1`)
      .then((response) => {
        // JSON responses are automatically parsed.

        this.user = response.data.data;
        console.log(this.user);
      })
      .catch((e) => {
        this.errors.push(e);
      });
  },
  methods: {
    editUser: function () {
      console.log(this.user);
      let objectUser = {
        user: this.user,
      };
      delete objectUser.user.id;
      axios
        .put("http://localhost:4000/api/users/1", objectUser)
        .then((response) => {
          alert("Profile edited");
        })
        .catch((e) => {
          this.errors.push(e);
        });
    },
    deleteUser: function () {
      if (
        confirm(
          "You are going to definetely delete your account, do you want to continue?"
        )
      ) {
        axios
          .delete("http://localhost:4000/api/users/1")
          .then((response) => {
            alert("User deleted");
          })
          .catch((e) => {
            this.errors.push(e);
          });
      }
    },
  },
};
</script>
<style>
</style>
