<script setup lang="ts">
import { ref } from "vue";
import TweetPostForm from "./TweetPostForm.vue";
import TweetList from "./TweetList.vue";

// refを使うことでリアクティブな値にする
const tweets = ref([]);

const inputtingDescription = ref<string>("");

const fetchTweets = async () => {
  const result = await fetch("api/v1/tweets");
  const jsonData = await result.json();
  const data = jsonData.data.map((element) => ({
    id: Number(element.id),
    content: element.attributes.content,
  }));
  tweets.value = data;
};
fetchTweets();

const postTweet = async (content: string) => {
  // const result = await fetch("api/v1/tweets", {
  //   method: "POST",
  //   headers: {
  //     "Content-Type": "application/json",
  //   },
  //   body: JSON.stringify({
  //     content: content,
  //   }),
  // });
  // console.log(result);
  // const jsonData = await result.json();
  // console.log(jsonData);
};

const deleteTweet = (id: number) => {
  // tweets.value = tweets.value.filter((t) => t.id !== id);
};
</script>

<template>
  <div class="container">
    <h1>Tweeter</h1>
    <TweetPostForm @post-tweet="postTweet" />
    <div class="tweet-container">
      <!-- v-ifでもv-showでもよい -->
      <p v-show="tweets.length <= 0">No tweets have been added</p>
      <ul>
        <TweetList :tweets="tweets" :delete-tweet="deleteTweet" />
      </ul>
    </div>
  </div>
</template>

<style scoped>
.container {
  display: flex;
  flex-direction: column;
  align-items: center;
}
</style>
