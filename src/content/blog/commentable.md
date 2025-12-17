---
title: "building a self-hosted commenting system"
description: "comments for your website, without the bloat"
pubDate: "Dec 17 2025"
---

## why another commenting system?

i wanted comments on my websites without handing over my visitors' data to some third party. disqus is bloated and tracks everything. other solutions either cost money or require you to set up complex infrastructure.

so i built [commentable](https://www.commentable.space).

## what it does

commentable is a simple, self-hosted commenting system. you run it on your own server, embed a small script on your site, and that's it. your data stays yours.

it also has ai-powered moderation built in - it automatically filters spam and problematic content so you don't have to manually review every comment.

## the tech

i wanted to try something different, so i built this with swift and vapor instead of the usual node/typescript stack. the frontend embed is just vanilla js - no frameworks, no build step, minimal footprint.

## how to use it

the easiest way is to use the hosted version at [commentable.space](https://www.commentable.space) - it's free. just sign up, add a script tag to your site, and you're done.

if you prefer to own your infrastructure, you can self-host it. there's a docker image ready to go.

either way:

1. add a small script tag to your website
2. customize the look to match your site
3. comments just work

you can also write custom prompts to tailor the ai moderation to your needs - stricter, more lenient, whatever fits your community.

check it out at **[commentable.space](https://www.commentable.space)** or grab the code on [github](https://github.com/strathausen/commentable).
