$(document).ready(() => $('svg').on('click', (event) => {
    const position = getMousePosition(event);
    const r = getRValue();
    const x = (position.x - 150) / 50;
    const y = (150 - position.y) / 75;
    const color = validateCoordinates(x, y, r) ? "green" : "red";
    createPointer(position.x, position.y, color);
    requestData({
        x: x,
        y: y,
        r: r
    })
}))

const dots = $('#dots')

$('input[type=checkbox]').on('click', () => dots.empty())

function getMousePosition(event) {
    const rect = document.querySelector("svg").getBoundingClientRect()
    return {
        x: event.clientX - rect.left,
        y: event.clientY - rect.top
    };
}

function createPointer(x, y, color) {
    dots.html(`${dots.html()}<circle fill="${color}" class="dots_res" 
        cx="${x}" cy="${y}" r="2.25"></circle>`)
}
function getYValue(){
    let yElements = document.getElementById("value_Y");
    return parseFloat(yElements.options[yElements.selectedIndex].text);
}
function getRValue(){
    let rElements = document.getElementById("value_R");
    let rrrrr = parseFloat(rElements.options[rElements.selectedIndex].text);
    return rrrrr;
}
function getXValue(){
    return parseFloat(document.getElementById("xstring").value);
}


function validateCoordinates(x, y, r) {
    return ((x >= -r) && (y <= r/2) && (y >= 0) && (x<=0) && (-x + 2* y <= r)) || //треугольник
        (x >= 0 && x <= r / 2 && y <= 0 && y >= -r) || //прямоугольник
        ((x * x + y * y <= r/2 * r/2) && (x >= 0) && (y >= 0)); //ебкруг
}