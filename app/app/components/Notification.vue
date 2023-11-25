<template>
  <b-alert show variant="danger">
    <!-- 今後エラーメッセージが複数あった場合の対応を検討
    <div v-for="m in message" :key="m.id">
      <span>{{ m }}</span>
    </div> -->
    <div>
      <span>{{ message }}</span>
    </div>
  </b-alert>
</template>

<script>
export default {
  name: "Notification",
  props: ["message"],
};
</script>
