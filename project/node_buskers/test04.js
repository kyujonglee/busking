// npm install socket.io
const app = require("express")();
const server = require("http").createServer(app);
const io = require("socket.io")(server);

// 접속한 사용자 정보를 담는다.
let loginUsers = [];

app.get("/", function (request, response) {
    response.sendFile(__dirname + "/test04.html");
});

// 사용자 소켓 접속할 때 발생
io.on("connection", function (socket) {
    console.log("사용자 접속했음..");

    socket.on("login", function (loginId) {
        console.log(loginId + "," + socket.id);
        loginUsers[loginId] = socket.id;

        io.emit("login", loginId);
    });

    // 이벤트를 설정하자
    socket.on("msg", function (data) {
        console.log("클라이언트 전송 데이터 : " + data);
        console.log("data.recvId : " + data.recvId);
        console.log("data.sendId : " + data.sendId);
        console.log("data.sendMsg : " + data.sendMsg);

        // 아이디가 data.recvId로 로그인한 사용자에게 메세지 전송
        io.to(loginUsers[data.recvId]).emit(
            "msg", 
            data.sendId + "님이 당신에게 메세지를 보냈습니다.\n" +
            data.sendMsg
        );
    });
});

server.listen(10001, function () {
    console.log("10001번 구동 중..");
});