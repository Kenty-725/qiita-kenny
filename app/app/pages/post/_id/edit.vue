<template>
  <div>
    <ConfirmModal
      :show="showModal"
      @confirm="deletePost(id)"
      @cancel="cancel"
    />

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
        <ul>
          <li>
            <button
              class="post_submit btn_delete"
              @click.prevent="showConfirmModal"
            >
              削除する
            </button>
          </li>
          <li>
            <button class="post_submit btn_green">公開する</button>
          </li>
        </ul>
      </div>
    </form>
  </div>
</template>

<script>
import ConfirmModal from "~/components/confirm-modal.vue";

export default {
  components: {
    ConfirmModal,
  },
  data: function () {
    return {
      title: "",
      content: "",
      showModal: false,
    };
  },
  async asyncData({ params, $axios, redirect }) {
    const id = params.id;
    const response = await $axios.get(
      `http://localhost:3001/api/v1/posts/${id}`
    );
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
    showConfirmModal() {
      this.showModal = true;
    },
    async deletePost(id) {
      try {
        await this.$axios.delete(`/api/v1/posts/${id}`);
        this.$router.push("/");
      } catch (e) {
        console.log(e);
      }

      this.showModal = false;
    },
    cancel() {
      this.showModal = false;
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
  background-color: #fff;
  border: 1px solid black;
}

textarea {
  height: 50vh;
}

.post_submit_container {
  border-top: 1px solid black;
  padding: 10px;
}

.post_submit_container ul {
  display: flex;
  justify-content: flex-end;
}

.btn_delete {
  background-color: red;
  color: white;
}
</style>
