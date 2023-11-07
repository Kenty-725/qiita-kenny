<template>
  <header>
    <div class="contents">
      <div class="header_left">
        <nuxt-link to="/">
          <p class="header_container">Qiita</p>
        </nuxt-link>
      </div>
      <div class="header_right">
        <ul>
          <li>
            <input
              type="search"
              class="content_search"
              placeholder="記事を検索"
            />
          </li>
          <li>
            <div class="circle"></div>
          </li>
          <li>
            <nuxt-link to="/post">
              <button class="post_page">投稿する</button>
            </nuxt-link>
          </li>
          <li>
            <b-button v-if="!this.$auth.loggedIn" variant="info" to="/login"
              >ログイン</b-button
            >
            <!-- <p>{{ this.$auth.loggedIn }}</p> -->
          </li>
          <li>
            <b-button
              v-if="this.$auth.loggedIn"
              variant="danger"
              @click="logout"
            >
              ログアウト</b-button
            >
          </li>
        </ul>
      </div>
    </div>
  </header>
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
        localStorage.removeItem("authorization");

        window.location.reload();
      });
    },
  },
};
</script>

<style>
header {
  padding: 10px 5px;
}
.contents {
  display: flex;
  justify-content: space-between;
}

.header_right ul {
  display: flex;
  justify-content: space-between;
}

li {
  margin-left: 10px;
}

.content_search {
  height: 50px;
  width: 250px;
  border: 1px solid black;
}

.circle {
  border: 1px solid black;
  width: 50px;
  height: 50px;
  border-radius: 50%;
  text-align: center;
  line-height: 50px;
}

.post_page {
  height: 50px;
  width: 100px;
  border: 1px solid #000;
  text-align: center;
  padding: 10px 0 10px 0;
  background-color: #55c500;
  border-radius: 10px;
  color: #fff;
  font-weight: 500;
  font-size: 1.1rem;
}
</style>
