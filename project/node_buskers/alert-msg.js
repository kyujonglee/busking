// npm install socket.io
const app = require("express")();
const server = require("http").createServer(app);
const io = require("socket.io")(server);

// 접속한 사용자 정보를 담는다.
let members = [];

// 사용자 소켓 접속할 때 발생
io.on("connection", function (socket) {
    console.log("사용자 접속했음..");

    socket.on("login", function (nickName) {
        members[nickName] = socket.id;

        io.emit("login", nickName);
    });

    socket.on("msg", function (data) {
        io.to(members[data.receiver]).emit(
            "msg",
            {
                sender: data.sender,
                title: data.title
            }
        );
    });
});

server.listen(10001, function () {
    console.log("10001번 구동 중..");
});