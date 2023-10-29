<template>
  <header>
    <div class="contents">
      <div class="header_left">
        <p class="header_container">Qiita</p>
      </div>
      <div class="header_right">
        <ul>
          <li>
            <input
              type="text"
              class="content_search"
              placeholder="記事を検索"
            />
          </li>
          <li>
            <div class="circle"></div>
          </li>
          <li>
            <nuxt-link to="/post/postForm">
              <button class="post_page">投稿する</button>
            </nuxt-link>
          </li>
        </ul>
      </div>
    </div>
  </header>
</template>

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
