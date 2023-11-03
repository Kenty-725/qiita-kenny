<template>
  <div class="post_content_wrapper">
    <div class="fuga">
      <p class="circle"></p>
      <div class="content_right">
        <p>@kenny</p>
        <p>
          更新日:{{ data.formatted_updated_at }} 投稿日:{{
            data.formatted_created_at
          }}
        </p>
      </div>
    </div>
    <h1>{{ data.title }}</h1>
    <span>タグ1</span>
    <div
      class="markdown markdown_wrapper"
      v-html="$md.render(data.content)"
    ></div>
  </div>
</template>

<script>
export default {
  async asyncData({ params, $axios }) {
    const id = params.postId;
    const response = await $axios.get(
      `http://localhost:3001/api/v1/posts/${id}`
    );
    return {
      data: response.data,
    };
  },
};
</script>

<style>
.post_content_wrapper {
  background-color: #ffffff;
  width: 60%;
  margin: 0 auto;
  margin-top: 10px;
  height: auto;
  min-height: 70vh;
  padding: 10px 25px;
}

.post_content_wrapper > h1 {
  font-weight: bold;
  font-size: 1.5rem;
  margin: 20px 0;
}

.fuga {
  display: flex;
}

.content_right {
  margin-left: 20px;
}

.markdown_wrapper {
  border-top: 1px solid black;
  margin: 20px 0;
  padding: 10px 5px;
}
</style>
