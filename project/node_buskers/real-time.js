const app = require("express")();
const server = require("http").createServer(app);
const io = require("socket.io")(server);

const chat = io.of("/chat");

let all_members = [];
let members = [];
let profile = [];

io.on("connection", function (socket) {
    console.log("메인에 사용자 접속..");

    socket.on("login", function (nickName) {
        all_members[nickName] = socket.id;
        chat.emit("login", Object.keys(all_members));
    });

    socket.on("currentUsers", function () {
        io.emit("currentUsers", Object.keys(all_members).length);
        console.log(Object.keys(all_members));
    });

    socket.on("msg", function (data) {
        io.to(all_members[data.receiver]).emit(
            "msg",
            {
                sender: data.sender,
                title: data.title
            }
        );
    });

    socket.on("disconnect", function () {
		for (let i = 0; i < Object.keys(all_members).length; i++) {
            if (all_members[Object.keys(all_members)[i]] == socket.id) {
                delete all_members[Object.keys(all_members)[i]];
                io.emit("currentUsers", Object.keys(all_members).length);
            }
        }
    });
});

chat.on("connection", function (socket) {
    console.log("채팅방에 사용자 접속..");

	socket.on("disconnect", function () {
		for (let i = 0; i < Object.keys(members).length; i++) {
            if (members[Object.keys(members)[i]] == socket.id) {
                chat.emit("out", Object.keys(members)[i]);
                delete members[Object.keys(members)[i]];
                chat.emit("join", Object.keys(members));
            }
        }
	});

    socket.on("join", function (data) {
        members[data.nickName] = socket.id;
        
        let profileFlag = true;
        for (let i = 0; i < profile.length; i++) {
            if (profile[i].nickName == data.nickName) profileFlag = false;
        }
        if (profileFlag) profile.push(data);
        chat.emit("join", profile);
        chat.emit("in", data.nickName);
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
        let image = "";
        for (let i = 0; i < profile.length; i++) {
            console.log(profile[i].nickName);
            if (profile[i].nickName == data.sender) {
                image = profile[i].profile;
            }
        }
        if (data.receiver == "") {
            socket.broadcast.emit(
                "chat", 
                {
                    sender: data.sender,
                    content: data.content,
                    date: data.date,
                    color: data.color,
                    image: image
                }
            );
        } else {
            chat.to(members[data.receiver]).emit(
                "whisper", 
                {
                    sender: data.sender,
                    content: data.content,
                    date: data.date,
                    color: data.color,
                    image: image
                }
            );
        }
    });
});

server.listen(10001, function () {
    console.log("10001번 구동 중..");
});

