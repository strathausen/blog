
# My personal nodejs lessons.

Don't callback in try-catch.

try {
  cb(null, JSON.parse());
} catch(e) {
  cb(e);
}

JSON.parse succeeds, but the callback throws an error -> it get's executed twice!
