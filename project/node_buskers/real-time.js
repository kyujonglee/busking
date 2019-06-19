const app = require("express")();
const server = require("http").createServer(app);
const io = require("socket.io")(server);

const chat = io.of("/chat");

let all_members = [];
let members = [];
let profile = [];
let room_id = [];

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

    socket.on("show-alarm", function (data) {
        for (let i = 0; i < data.nickName.length; i++) {
            console.log(data.nickName[i].nickName);
            io.to(all_members[data.nickName[i].nickName]).emit('show-alarm', data.activityName);
        }
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

    socket.on("joinRoom", function (data) {
        room_id[socket.id] = data;
        socket.join(data);
    });

	socket.on("disconnect", function () {
        console.log("로그아웃함");
        console.log(members);
		for (let i = 0; i < Object.keys(members).length; i++) {
            if (members[Object.keys(members)[i]] == socket.id) {
                chat.in(room_id[socket.id]).emit("out", Object.keys(members)[i]);
                for (let j = 0; j < profile.length; j++) {
                    if (profile[j].nickName == Object.keys(members)[i]) {
                        profile.splice(j, 1);   
                        delete members[Object.keys(members)[i]];
                    }
                }
                socket.leave(room_id[socket.id]);
                chat.in(room_id[socket.id]).emit("join", profile);
                console.log(profile);
            }
        }
	});

    socket.on("join", function (data) {
        members[data.nickName] = socket.id;
        
        let profileFlag = true;
        for (let i = 0; i < profile.length; i++) {
            if (profile[i].nickName == data.nickName) {
                profileFlag = false;
                profile[i].profile = data.profile;
                profile[i].roomId = data.roomId;
            }
        }
        if (profileFlag) profile.push(data);
        chat.in(room_id[socket.id]).emit("join", profile);
        chat.in(room_id[socket.id]).emit("in", data.nickName);
    });

    socket.on("chat", function (data) {
        console.log(profile);
        let image = "";
        for (let i = 0; i < profile.length; i++) {
            if (profile[i].nickName == data.sender) {
                image = profile[i].profile;
            }
        }
        if (data.receiver == "") {
            socket.broadcast.in(room_id[socket.id]).emit(
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

