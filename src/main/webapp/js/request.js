var w = null;
function requestData(params) {
    $.ajax({
        type: "GET",
        url: "controller",
        dataType: "html",
        async: false,
        data: {
            x: params.x,
            y: params.y,
            r: params.r,
            timezone: new Date().getTimezoneOffset(),
        },
        success: data => {
            if (w == null) {
                w = window.open('resultpage.jsp');
            }
            if (w.closed) {
                w = window.open('resultpage.jsp');
            } else {
                w.location.reload();
            }
            console.log(data)
            document.querySelector('#table-box').innerHTML = data;
        },
        error: function (error) {
            console.log(error)
        },
    })
}

$(document).ready(function(){
    window.onunload = function() {
        if (w.closed) {
            return;
        }else {
            w.close();
        }
    }
})
