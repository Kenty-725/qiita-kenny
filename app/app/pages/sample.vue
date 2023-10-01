<template>
  <b-container>
    <b-col offset-md="1" md="10" class="mt-3">
      <b-jumbotron class="pb-5">
        <template #header>Hello World!</template>
        <div v-if="this.$auth.loggedIn">
          <h2>ログイン済み</h2>
        </div>
        <div v-if="!this.$auth.loggedIn">
          <h2>未ログイン</h2>
        </div>
        <hr class="my-4" />
        <b-button v-if="!this.$auth.loggedIn" variant="primary" to="/signup"
          >サインアップ</b-button
        >
        <b-button v-if="!this.$auth.loggedIn" variant="info" to="/login"
          >ログイン</b-button
        >
        <b-button v-if="this.$auth.loggedIn" variant="danger" @click="logout"
          >ログアウト</b-button
        >
      </b-jumbotron>
    </b-col>
  </b-container>
</template>

<script>
export default {
  data: function () {
    return {};
  },
  methods: {
    async logout() {
      await this.$auth.logout().then(() => {
        localStorage.removeItem("access-token");
        localStorage.removeItem("client");
        localStorage.removeItem("uid");
        localStorage.removeItem("token-type");

        window.location.reload();
      });
    },
  },
};
</script>

<style></style>
