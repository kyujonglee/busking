const app = require("express")();
const server = require("http").createServer(app);
const io = require("socket.io")(server);

const chat = io.of("/chat");

let members = [];

chat.on("connection", function (socket) {
    console.log("사용자 접속..");

	socket.on("disconnect", function () {
		for (let i = 0; i < Object.keys(members).length; i++) {
            if (members[Object.keys(members)[i]] == socket.id) {
                chat.emit("out", Object.keys(members)[i]);
                delete members[Object.keys(members)[i]];
                chat.emit("login", Object.keys(members));
            }
        }
	});

    socket.on("login", function (nickname) {
        members[nickname] = socket.id;
        chat.emit("login", Object.keys(members));
        chat.emit("in", nickname);
    });

    /*
    socket.on("msg", function (data) {
        io.to(members[data.receiver]).emit(
            "msg",
            {
                sender: data.sender,
                title: data.title
            }
        );
    });
    */

    socket.on("chat", function (data) {
        console.log(data);
        if (data.receiver == "") {
            socket.broadcast.emit(
                "chat", 
                {
                    sender: data.sender,
                    content: data.content,
                    date: data.date,
                    color: data.color
                }
            );
        } else {
            chat.to(members[data.receiver]).emit(
                "whisper", 
                {
                    sender: data.sender,
                    content: data.content,
                    date: data.date,
                    color: data.color
                }
            );
        }
    });
});

server.listen(10001, function () {
    console.log("10001번 구동 중..");
});

