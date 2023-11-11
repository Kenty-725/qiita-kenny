<template>
  <form @submit.prevent="editPost(id)">
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
  async asyncData({ params, $axios, redirect }) {
    const id = params.id;
    const response = await $axios.get(
      `http://localhost:3001/api/v1/posts/${id}`
    );
    console.log(response.data);
    if (!response.data.is_current_user_post_owner) {
      return redirect(`/post/${id}`);
    }
    return {
      id: response.data.id,
      title: response.data.title,
      content: response.data.content,
    };
  },
  methods: {
    async editPost(id) {
      try {
        await this.$axios.put(`/api/v1/posts/${id}`, {
          post: {
            title: this.title,
            content: this.content,
          },
        });
        this.$router.push(`/post/${id}`);
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
