const http = require("http");
const app = require("./index");

const server = http.createServer(app);
server.listen(300,() => {
    console.log("Api iniciada na porta 3000");
});
