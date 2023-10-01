<template>
  <div class="signup_wrapper">
    <header>
      <p class="header_container">Qiita</p>
    </header>
    <div class="container">
      <h2>Qiitaにログイン</h2>
      <Notification :message="error" v-if="error" class="mb-4 pb-3" />
      <div class="signup_form">
        <div class="signup_form_left">
          <img src="https://placehold.jp/300x300.png" alt="" />
          <p>
            もしQiitaのアカウントを持っていない場合は<a href="../signup"
              >新規登録</a
            >から
          </p>
        </div>

        <div class="signup_form_right">
          <form @submit.prevent="login">
            <div class="form_container">
              <ul>
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
              </ul>
            </div>
            <button class="resister_button" type="submit" variant="primary">
              Qiitaにログイン
            </button>
          </form>
        </div>
      </div>
    </div>

    <footer>
      <p>Qiita</p>
    </footer>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      email: "",
      password: "",
      error: null,
    };
  },
  methods: {
    async login() {
      try {
        await this.$auth.loginWith("local", {
          data: {
            password: this.password,
            email: this.email,
          },
        });

        // ログインが成功した場合にリダイレクト
        this.$router.push("/sample");
      } catch (error) {
        // ログインが失敗した場合にエラーメッセージを表示
        this.error = error.response.data.errors;
      }
    },
  },
};
</script>

<style></style>
