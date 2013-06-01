function reset() {
    var elem = document.getElementById("fields");
    var childrenO = elem.children;
    for (var i = 0; i < childrenO.length; i++) {
        var cssClass = childrenO[i].getAttribute("class");
        if (cssClass === "field") {
            childrenO[i].children[1].setAttribute("class", "")
        }
    }
    var failBlock = document.getElementById("fail");
    failBlock.style.display = "none";
    failBlock.innerHTML = ""
}

function fail(field, msg) {
    var elem = document.getElementById(field);
    elem.setAttribute("class", "fail")
    var failBlock = document.getElementById("fail");
    failBlock.style.display = "block";
    failBlock.innerHTML += msg + "<br>"
}

function validate() {
    reset()
    return checks() != 0 ? true : false
}

function checkEquals(field1, field2, msg) {
    if (document.getElementById(field1).value !== document.getElementById(field2).value) {
        fail(field2, msg)
        return false
    } else {
        return true
    }
}

function check(field, msg, func) {
    var elem = document.getElementById(field);
    var value = elem.value
    if (!func(value)) {
        fail(field, msg)
        return false
    } else {
        return true
    }
}

function contains(s, char) {
    for (var i = 0; i < s.length; i++) {
        if (s.charAt(i) == char) return true
    }
    return false

    //s.indexOf(char)>=0
}

function checkSpace(value) {
    return !contains(value, ' ')
}

function checkEmpty(value) {
    return value.length != 0
}

function checkEmail(email) {
    return contains(email, '@') && email.indexOf("@") != 0 && contains(email, '.') && email.lastIndexOf(".") != email.length - 1
}

function checkUsernameLength(username) {
    return username.length > 2 && username.length <= 12
}

function checkPasswordLength(pass) {
    return pass.length > 6
}

function checkNumber(year) {
    return !isNaN(year)
}
