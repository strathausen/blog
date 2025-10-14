---
title: "automating git commit messages with gpt"
description: "using ai to do something good for once"
pubDate: "Sep 20 2024"
---

have you ever wanted to commit your changes on git, but found yourself to be too tired
or a bit too much in a hurry to think of a good commit message? too much in the zone
and don't want to interrupt your flow?

to scratch that itch, i've made a script called [gpt_commit](https://github.com/strathausen/gpt_commit)
that automates the generation of commit messages using openai.

## how it works

the script retrieves the diff of your staged changes and sends it to the openai with a prompt to generate a commit message.
it then provides you with options to accept the generated message, edit it, regenerate a new one, or abort the commit.

here's a simplified overview of the process:

1. **stage your changes**:
   ```bash
   git add .
   ```
2. **run the script**:
   ```bash
   gpt_commit
   ```
3. **interact with the generated message**:
   ```
   Generated commit message:
   "Fix authentication bug and improve error handling"

   Options:
     (y) Accept and commit
     (e) Edit message
     (r) Regenerate message
     (q) Abort
   Choose an option [y/e/r/q]:
   ```

### prerequisites

- **openai api key**: obtain one from [openai](https://platform.openai.com/api-keys).
- **jq**: for json processing.
  - install with homebrew:
    ```bash
    brew install jq
    ```
  - or with apt:
    ```bash
    sudo apt-get install jq
    ```
  - or get it at [github.com/jqlang/jq](https://github.com/jqlang/jq)

### installation

one way to install `gpt_commit` is as follows:

1. **clone the repository**:

   ```bash
   git clone https://github.com/strathausen/gpt_commit.git
   ```

2. **navigate to the directory**:

   ```bash
   cd gpt_commit
   ```

3. **make the script executable**:

   ```bash
   chmod +x gpt_commit
   ```

4. **add the script to your path**:

   ```bash
   export PATH="$PATH:$(pwd)"
   ```

   you might want to add this line to your `~/.bashrc` or `~/.zshrc` file.

or just copy the script from github and put it whereever you like.

### configuration

set your openai api key as an environment variable:

```bash
export OPENAI_API_KEY="your-openai-api-key"
```

## what's next

options to change models or add a custom prompt would be nice.
especially on retry it could ask for another prompt on how to improve the message.
providing more context to the llm is another idea: what is this codebase about? which commits preceded this one?

initially i had mixed feelings about the whole idea:
will this script just contribute to the amount of generated sludge coming from ai lately?
then i looked at the commit messages of me and my team and thought,
whatever generated sludge the ai will come up with,
it's almost certainly more helpful than that.

---

check out the repository on github: [strathausen/gpt_commit](https://github.com/strathausen/gpt_commit)

feel free to contribute or open issues!
