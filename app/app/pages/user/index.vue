<template>
  <div class="wrapper flex_center">
    <div class="wrapper_left">
      <div class="profile_box">
        <p class="circle">写真</p>
        <p class="user_name">@{{ data.name }}</p>
        <div class="count_box">
          <div class="post_count_box">
            <p>1</p>
            <p>投稿</p>
          </div>
          <div class="like_count_box">
            <p>1</p>
            <p>いいね</p>
          </div>
        </div>
        <p>自己紹介文がここに入る。</p>
        <button class="btn_edit">プロフィールを編集する</button>
      </div>
    </div>
    <div class="wrapper_right1">
      <div class="flex2">
        <button
          @click="showPosts"
          class="btn_post"
          :class="{ btn_post_active: isPost, btn_post_inactive: !isPost }"
        >
          記事
        </button>
        <button
          @click="showLikes"
          class="btn_post"
          :class="{ btn_post_active: !isPost, btn_post_inactive: isPost }"
        >
          いいね
        </button>
      </div>
      <MyPost v-if="isPost" />
      <MyLike v-else />
    </div>
  </div>
</template>

<script>
import MyPost from "./my-post.vue";
import MyLike from "./my-like.vue";

export default {
  components: {
    MyPost,
    MyLike,
  },
  data() {
    return {
      isPost: true,
    };
  },
  async asyncData({ $axios }) {
    const response = await $axios.get(`http://localhost:3001/api/v1/users/me`);
    return {
      data: response.data,
    };
  },
  methods: {
    showPosts() {
      this.isPost = true;
    },
    showLikes() {
      this.isPost = false;
    },
  },
};
</script>

<style>
.flex {
  display: flex;
}

.flex_center {
  display: flex;
  justify-content: center;
}

.flex2 {
  margin-bottom: 10px;
}

.wrapper_left {
  width: 30%;
  margin-right: 30px;
}

.wrapper_right1 {
  width: 50%;
  padding: 10px;
}

.profile_box {
  background-color: #fff;
  padding: 10px;
  text-align: center;
  border-radius: 10px;
}

.profile_box > .circle {
  margin: 0 auto;
  width: 80px;
  height: 80px;
  line-height: 80px;
}

.count_box {
  border-top: 1px solid #000;
  margin-top: 20px;
  padding-top: 10px;
  display: flex;
  justify-content: center;
}

.user_name {
  font-size: 1.3rem;
  font-weight: bold;
  margin: 10px 0;
}

.post_count_box {
  margin-right: 30px;
  font-weight: bold;
  font-size: 1.1rem;
}

.like_count_box {
  font-weight: bold;
  font-size: 1.1rem;
}

.btn_edit {
  border: none;
  padding: 10px 15px;
  border-radius: 10px;
  background-color: #d9d9d9;
  margin-bottom: 10px;
}

.btn_post {
  padding: 2px 15px;
  border-radius: 20px;
  border: none;
  font-size: 1.1rem;
  margin-right: 8px;
}

.btn_post_active {
  background-color: #55c500;
  color: #fff;
}

.btn_post_inactive {
  background-color: #fff;
  color: #000;
}
</style>
