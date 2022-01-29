function change_array()
{
    let array = document.getElementById("array").value
        .split(" ")
        .filter(x => !!x)
        .map(Number)
        .filter(x => !isNaN(x))

    if (array.length == 0)
    {
        document.getElementById("result").innerText = "Введите массив, состоящий из чисел!"
        return
    }

    document.getElementById("array").value = array.join(" ")
    let first_index = 0
    let has_elements = false
    for (let i = 0; i < array.length; i++)
        if (array[i] % 71 == 0)
        {
            first_index = i
            has_elements = true
            break
        }
    
    if (!has_elements)
    {
        document.getElementById("result").innerText = "В данном массиве нет чисел, кратных 71"
        return
    }

    let min_index = 0
    for (let i = 0; i < array.length; i++)
        if (array[i] < array[min_index])
            min_index = i
    
    array[min_index] = first_index
    document.getElementById("result").innerText = "Результат: " + array.join(", ")
}

function clear_result()
{
    document.getElementById("array").value = "5 4 71 0 9 -5 3 -10 1 2 142"
    document.getElementById("result").innerText = ""
}