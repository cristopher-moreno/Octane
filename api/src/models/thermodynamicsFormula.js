
let x, y, x1, y1, x2, y2 = 0

x1 = 80
x = 100
x2 = 120
y1 = 2483.70
y2 = 2542.40

y = f_linear_interpolation(x, x1, y1, x2, y2)

console.log(y)

function f_linear_interpolation(x, x1, y1, x2, y2) {
    return parseFloat((((y2 - y1) * (x - x1)) / (x2 - x1)) + (y1)).toFixed(3)
}


function f_correlativo(x, x1, y1, x2, y2) {
    return parseFloat((((y2 - y1) * (x - x1)) / (x2 - x1)) + (y1)).toFixed(3)
}

