var form = document.querySelector('.validate_form');
var validateButton = form.querySelector('.validate');
var fields= document.querySelectorAll('.validate');

var xCoord = document.getElementById("xstring");
var yCoord = getYValue();
var rCoord = getRValue();
function isNumber(n) {
    return !isNaN(parseFloat(n)) && isFinite(n);
}
function removeMsg() {
    var msg = form.querySelectorAll('.msg')
    for (var i = 0; i < msg.length; i++) {
        msg[i].remove()
    }
}
function createError(text){
    let msg = document.createElement('div');
    msg.className = 'msg';
    msg.style.color = 'red';
    msg.style.fontSize = '14px';
    msg.innerHTML = text;
    return msg
}
function validateCoordinate(coordinate){
    if(coordinate.value){
        if(coordinate.value<-5 || coordinate.value>3 || !isNumber(coordinate.value)){
            let error = createError('Неправильное число')
            coordinate.parentElement.insertBefore(error, coordinate)
            return false;
        }
        return true
    }
    let error = createError('Пустое поле ввода');
    coordinate.parentElement.insertBefore(error, coordinate);
    return false;
}
$("#input-form").on("submit", function (event) {
    event.preventDefault();
    removeMsg();
    if (!validateCoordinate(xCoord)) {
        console.log("post canceled")
        return
    }
    let rElements = document.getElementById("value_R");
    let rrrrr = rElements.options[rElements.selectedIndex].text;
    console.log("data sending...")
    console.log(xCoord.value + " " + yCoord+ " "+ rrrrr +" " +new Date().getTimezoneOffset())
    $.ajax({
        url: 'controller',
        method: "GET",
        data: {
            x: xCoord.value,
            y: yCoord,
            r: rrrrr,
            timezone: new Date().getTimezoneOffset(),
        },
        dataType: "html",
        success: function (data) {
            console.log(data);
            $(".validate").attr("disabled", false);
            document.querySelector('#table-box').innerHTML = data;
            if(w == null){
                w = window.open('resultpage.jsp');
                return;
            }
            if (w.closed) {
                w = window.open('resultpage.jsp');
            }else {
                w.location.reload();
            }
        },
        error: function (error) {
            console.log(error);
            $(".validate").attr("disabled", false);
            window.location.replace('check');
        },
    })

});
$(".resetData").on("click",function(event){
    removeMsg();
    $.ajax({
        url: 'controller',
        method: "GET",
        dataType: "html",
        data: {
            'clear': true
        },
        success: function(data){
            console.log(data);
            $("#table_out").empty();
            if(w == null){
                w = window.open('resultpage.jsp');
            }else {
                w.location.reload();
            }
            $(".dots_res").remove();
        },
        error: function(error){
            console.log(error);
        },
    })
})



