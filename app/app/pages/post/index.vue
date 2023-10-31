<template>
  <form @submit.prevent="newPost">
    <div class="content_wrapper">
      <ul>
        <li>
          <input type="text" placeholder="記事タイトル" v-model="title" />
        </li>
        <li>
          <input
            type="text"
            placeholder="タグを入力してください。スペース区切りで入力できます。"
          />
        </li>
        <li>
          <textarea
            placeholder="知識をMarkdown記法で書いて共有しよう"
            v-model="content"
          ></textarea>
        </li>
      </ul>
    </div>
    <div class="post_submit_container">
      <button class="post_submit">公開する</button>
    </div>
  </form>
</template>

<script>
export default {
  data: function () {
    return {
      title: "",
      content: "",
    };
  },
  methods: {
    async newPost() {
      try {
        await this.$axios.post("/api/v1/posts", {
          title: this.title,
          content: this.content,
        });
        this.$router.push("/");
      } catch (e) {
        console.log(e);
      }
    },
  },
};
</script>

<style>
.content_wrapper {
  width: 97%;
  margin: 0 auto;
  /* border-bottom: 1px solid black; */
}

li > input,
textarea {
  width: 100%;
  margin-bottom: 15px;
}

textarea {
  height: 50vh;
}

.post_submit {
  display: block;
  margin-left: auto;
  text-align: center;
  padding: 1px 10px;
  border: 1px solid black;
  border-radius: 10px;
  background-color: white;
}

.post_submit_container {
  border-top: 1px solid black;
  padding: 10px;
}
</style>
