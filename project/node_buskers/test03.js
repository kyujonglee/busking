// npm install socket.io
const app = require("express")();
const server = require("http").createServer(app);
const io = require("socket.io")(server);

app.get("/", function (request, response) {
    response.sendFile(__dirname + "/test03.html");
});

// 사용자 소켓 접속할 때 발생
io.on("connection", function (socket) {
    console.log("사용자 접속했음..");

    // 이벤트를 설정하자
    socket.on("msg", function (data) {
        console.log("클라이언트 전송 데이터 : " + data);

        // 접속한 사용자에게만 메세지 보내기
        // socket.emit("msg", data);

        // 접속한 사용자 모두에게 메세지 보내기
        // io.emit("msg", data)

        // 나를 제외한 접속자 모두에게 메세지 보내기
        socket.broadcast.emit("msg", data);
    });
});

server.listen(10001, function () {
    console.log("10001번 구동 중..");
});