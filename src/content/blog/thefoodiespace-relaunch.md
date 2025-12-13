---
title: "pivoting my recipe app to a tiktok link-in-bio"
pubDate: "Oct 14 2025"
---

## why a pivot

a while ago, i created [thefoodie.space](https://www.thefoodie.space) as a social network for sharing recipes. as all social networks, it suffered from the same hen-and-egg problem: content creators need to join in order for users to come, but users won't come unless there's content.

so i tried something else. what if there was a website that provided a value to content creators right off the bat?

## what changed

**the old** was ambitious: recipe editors, social interactions (likes, comments, bookmarks), algolia search, moderation systems, and notification feeds. basically, building a full-fledged social network for food. and it wasn't anywhere close to being done. nowadays, a social network needs a mobile app for it to find wide acceptance. it needs a home feed of sorts that is engaging. i still think such a product could work, but it's beyond my ability as a full-time working father.

**the new** is minimal: sync your food posts from tiktok, get a beautiful profile page at `thefoodie.space/~username`, and share it. that's it.

instead of asking creators to manually input recipes, the platform now automatically pulls content from where they're already posting. like linktree, but specifically for food bloggers.

## what stayed the same

not much. the core thought remains: make exploring recipes more fun.

## who's the target audience

now this is where it gets a bit tricky. i thought about medium-size content creators who don't have their own blog.
big content creators usually have someone to transcribe their recipes on a website.

## what's still missing

a recipe editor and some email notifications would be great. influencers need to be able to review and fix recipes, but it shouldn't be much of a hassle either. other than that, this is pretty close to being where i want it to be. and it's totally usable already. if you're a food content creator and feel like something is missing, mail me at philipp[at]stratha.us

## this was fun

like all of my side projects, i'm mainly doing this **for fun** and in order to **learn things**. here i've taken the opportunity to give drizzle orm a try and see how easy it would be to transcribe audio from tiktok videos. there were some mild technical chalenges in where and how to process those videos.

there are no big plans for AI moderation or social features. just focusing on doing one thing well: giving food creators a better home for their recipes.

check it out: [thefoodie.space](https://www.thefoodie.space)
