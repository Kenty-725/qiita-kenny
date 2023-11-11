<template>
  <div class="signup_wrapper">
    <div class="container">
      <h2>Qiitaへようこそ</h2>
      <p>新規登録して利用を開始しましょう。</p>
      <Notification :message="error" v-if="error" class="mb-4 pb-3" />

      <div class="signup_form">
        <div class="signup_form_left">
          <img src="https://placehold.jp/300x300.png" alt="" />
          <p>
            もしQiitaのアカウントを持っている場合は
            <NuxtLink to="/login">ログイン</NuxtLink>から
          </p>
        </div>
        <div class="signup_form_right">
          <form @submit.prevent="signup">
            <div class="form_container">
              <ul>
                <li>
                  <input
                    type="text"
                    placeholder="ユーザー名"
                    required
                    v-model="name"
                  />
                </li>
                <li>
                  <input
                    type="email"
                    placeholder="メールアドレス"
                    required
                    v-model="email"
                  />
                </li>
                <li>
                  <input
                    type="password"
                    placeholder="パスワード"
                    required
                    v-model="password"
                  />
                </li>
                <li>
                  <input
                    type="password"
                    placeholder="パスワード確認用"
                    required
                    v-model="password_confirmation"
                  />
                </li>
              </ul>
            </div>
            <button class="resister_button" type="submit" variant="primary">
              登録する
            </button>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  layout: "auth",
  data: function () {
    return {
      name: "",
      email: "",
      password: "",
      password_confirmation: "",
      error: null,
    };
  },
  methods: {
    async signup() {
      try {
        await this.$axios.post("/api/auth", {
          name: this.name,
          email: this.email,
          password: this.password,
          password_confirmation: this.password_confirmation,
        });
        await this.$auth.loginWith("local", {
          data: {
            password: this.password,
            email: this.email,
          },
        });
        if (this.$auth.loggedIn) {
          this.$router.push("/sample");
        }
      } catch (e) {
        this.error = e.response.data.errors.full_messages;
      }
    },
  },
};
</script>

<style></style>
