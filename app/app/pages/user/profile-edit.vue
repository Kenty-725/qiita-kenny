<template>
  <div class="profile_wrapper">
    <h1>ユーザー設定変更</h1>
    <form @submit.prevent="editProfile">
      <div class="edit_wrapper">
        <p>アイコン</p>
        <div class="icon_upload">
          <p class="circle"></p>
          <label for="file" class="file">画像をアップロード</label>
          <input type="file" name="file" id="file" style="display: none" />
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
        ></textarea>
        <p>200文字以内</p>
      </div>
      <button class="btn_edit">変更する</button>
    </form>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      name: "",
      email: "",
      profile_text: "",
    };
  },
  async asyncData({ $axios }) {
    const response = await $axios.get(`http://localhost:3001/api/v1/users/me`);
    console.log(response.data);
    return {
      id: response.data.id,
      name: response.data.name,
      email: response.data.email,
      profile_text: response.data.profile_text,
    };
  },
  methods: {
    async editProfile() {
      const params = {
        name: this.name,
        email: this.email,
        profile_text: this.profile_text,
      };
      const response = await this.$axios.put(
        `http://localhost:3001/api/v1/users/${this.id}`,
        params
      );
      console.log(response.data);
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
