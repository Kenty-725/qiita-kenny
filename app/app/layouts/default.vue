<template>
  <div>
    <Header />
    <div class="wrapper">
      <Nuxt />
    </div>
    <Footer />
  </div>
</template>

<script>
import Footer from "./footer.vue";
import Header from "./header.vue";

export default {
  components: {
    Footer,
    Header,
  },
};
</script>

<style>
.wrapper {
  background-color: #d9d9d9;
  padding-top: 10px;
  min-height: 80vh;
}
</style>
