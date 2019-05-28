// npm install socket.io
const app = require("express")();
const server = require("http").createServer(app);
const io = require("socket.io")(server);

app.get("/", function (request, response) {
    response.sendFile(__dirname + "/test01.html");
});

// 사용자 소켓 접속할 때 발생
io.on("connection", function (socket) {
    console.log("사용자 접속했음..");
});

server.listen(10001, function () {
    console.log("10001번 구동 중..");
});