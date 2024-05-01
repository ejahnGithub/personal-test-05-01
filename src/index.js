const fetch = require("make-fetch-happen").defaults({
  cachePath: "./my-cache", // path where cache will be written (and read)
});

fetch("https://registry.npmjs.org/make-fetch-happen")
  .then((res) => {
    return res.json(); // download the body as JSON
  })
  .then((body) => {
    console.log(`got ${body.name} from web`);
    return fetch("https://registry.npmjs.org/make-fetch-happen", {
      cache: "no-cache", // forces a conditional request
    });
  })
  .then((res) => {
    console.log(res.status); // 304! cache validated!
    return res.json().then((body) => {
      console.log(`got ${body.name} from cache`);
    });
  });
