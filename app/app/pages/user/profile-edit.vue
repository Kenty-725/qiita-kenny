<template>
  <div class="profile_wrapper">
    <Notification :message="localError" v-if="localError" class="mb-4 pb-3" />
    <h1>ユーザー設定変更</h1>
    <form @submit.prevent="editProfile">
      <div class="edit_wrapper">
        <p>アイコン</p>
        <div class="icon_upload">
          <img
            :src="user.icon_url ? user.icon_url : '/user_default.png'"
            alt="icon"
            width="100px"
            height="100px"
            class="circle"
          />
          <label for="file" class="file">画像をアップロード</label>
          <input
            type="file"
            id="file"
            @change="onFileSelect($event)"
            style="display: none"
          />
        </div>
      </div>
      <div class="edit_wrapper">
        <p>ユーザー名</p>
        <input type="text" v-model="name" />
      </div>
      <div class="edit_wrapper">
        <p>メールアドレス</p>
        <input type="email" v-model="email" />
      </div>
      <div class="edit_wrapper">
        <p>自己紹介文</p>
        <textarea
          v-model="profile_text"
          placeholder="自己紹介を記入してください"
          maxlength="200"
        ></textarea>
        <p>残り{{ remainingChars }}文字</p>
      </div>
      <button class="btn_edit">変更する</button>
    </form>
  </div>
</template>

<script>
export default {
  middleware: "check-auth",
  data: function () {
    return {
      icon: "",
      name: "",
      email: "",
      profile_text: "",
      localError: null,
    };
  },
  computed: {
    remainingChars() {
      return 200 - (this.profile_text ? this.profile_text.length : 0);
    },
    user() {
      return this.$store.state.user.user;
    },
    error() {
      return this.$store.state.user.error;
    },
  },
  watch: {
    user(user) {
      if (user) {
        this.icon = user.icon;
        this.name = user.name;
        this.email = user.email;
        this.profile_text = user.profile_text;
      }
    },
    error: {
      handler(error) {
        if (error) {
          this.localError = error;
        }
      },
      immediate: true,
    },
  },
  created() {
    this.$store.dispatch("user/fetchUser");
  },
  methods: {
    onFileSelect(e) {
      this.icon = e.target.files[0];
    },
    async editProfile() {
      let formData = new FormData();
      formData.append("user[name]", this.name);
      formData.append("user[email]", this.email);
      formData.append("user[profile_text]", this.profile_text);
      if (this.icon) {
        formData.append("user[icon]", this.icon);
      }
      const params = formData;

      this.$store.dispatch("user/editUser", {
        userId: this.user.id,
        params: params,
      });
    },
  },
};
</script>

<style>
.profile_wrapper {
  border: 1px solid black;
  width: 85%;
  margin: 10px auto;
  padding: 10px 25px;
  background-color: #fff;
  min-height: 60vh;
}

h1 {
  font-size: 1.5rem;
}

.icon_upload {
  display: flex;
}

.profile_wrapper input,
.profile_wrapper textarea {
  border: 1px solid black;
  width: 100%;
}

.profile_wrapper input {
  padding: 10px;
  height: 30px;
}

.profile_wrapper textarea {
  height: 100px;
}

.profile_wrapper p {
  margin: 0;
}

.edit_wrapper {
  margin-bottom: 15px;
}

.file {
  line-height: 50px;
  margin-left: 10px;
}

.btn_edit {
  padding: 5px 10px;
  border-radius: 10px;
  background-color: #55c500;
  color: #fff;
  cursor: pointer;
}
</style>
