const http = require('http');

http.get('http://quotes.rest/qod.json', res => {
    let body = "";
    res.on("data", data => {
      body += data;
    });
    res.on("end", () => {
      body = JSON.parse(body);
      console.log(body.contents.quotes[0].quote);
      console.log("~ " + body.contents.quotes[0].author);
    });
  });