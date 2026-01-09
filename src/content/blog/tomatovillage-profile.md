---
title: "adding user profiles to my recipe app"
description: "implementing user profiles with image uploads using uploadthing and s3"
pubDate: "Nov 05 2023"
---

you can now create your own profile at [tomatovillage.com/profile](https://www.tomatovillage.com/profile).

## the tech behind it

for image uploads, i'm using [uploadthing.com](https://uploadthing.com/) which is a nice wrapper around aws s3. it saves you the trouble of creating and managing an aws account, setting up buckets, configuring cors, and dealing with presigned urls.

the integration was straightforward:

1. install the uploadthing package
2. set up the api routes
3. use their react components for the upload ui

what i like about uploadthing is that it handles all the complexity of file uploads - progress indicators, error handling, file type validation - without me having to build that from scratch.

## what's in a profile

right now, profiles are simple: a profile picture, a display name, and a short bio. nothing fancy, but it's a foundation to build on. eventually i want to add:

- recipe collections (your own and saved from others)
- follower/following system
- activity feed

## next steps

with profiles in place, the next big feature is the recipe editor itself. users should be able to create, edit, and publish their own recipes with photos and step-by-step instructions.

---

*tomatovillage is one of my [side projects](/projects). see what else i'm building.*
