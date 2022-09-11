import { createApp } from "vue";
import Tweet from "../components/Tweet.vue";

document.addEventListener("DOMContentLoaded", () => {
  createApp(Tweet).mount("#test");
});
