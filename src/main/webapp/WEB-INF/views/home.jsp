<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false" %>
<html>
<head>
    <title>WebSocket with SockJS</title>
</head>
<body>
<h1>Welcome!</h1>
<ul id="ul">
</ul>
<script type="text/javascript" src="/resources/js/sockjs-1.0.0.min.js"></script>
<script>
    // SockJS与原生的WebSocket的方法基本是一致的，
    // 所以只需要将 new WebSocket(url); 换成 new SockJS(url); 就可以了
    var url = "/echo";
    var sock = new SockJS(url);
    sock.onopen = function (ev) {
        console.log("opening");
        sayHey();
    };

    sock.onmessage = function (ev) {
        console.log(ev.data);
        var li = document.createElement("li");
        li.innerText = ev.data;
        document.getElementById("ul").appendChild(li);
        setTimeout(sayHey, 2000);
    };

    sock.onclose = function (ev) {
        console.log("closed");
    };

    function sayHey() {
        console.log("sending 'Hey guy!'");
        sock.send("Hey guy!");
    };
</script>
</body>
</html>
