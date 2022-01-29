// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks

handleAjaxSuccess = function(event) {
    [data, status, xhr] = event.detail;
    show_result(data);
}

document.addEventListener('DOMContentLoaded', function() {
    document.querySelector("#add").addEventListener(
    'ajax:success', handleAjaxSuccess)
})

function show_result(data)
{
    if (data.error)
    {
        document.getElementById("error").innerText = data.error;
        return;
    }
    document.getElementById("error").innerText = "";
    var table = document.getElementById("add_table");
    var tr = document.createElement("tr");
    if (data.all_segments)
        tr.innerHTML = '<td class="col">' + data.array +' </td>' + '<td class="col">' + data.all_segments + '</td>' + 
        '<td class="col">' + data.max_segment + '</td>' + '<td class="col">' + data.count + '</td>';
    else
        tr.innerHTML = '<td class="col">' + data.array +' </td>' + '<td class="col" colspan="3" style="color: red;">Нет отрезков</td>';
    table.appendChild(tr);
}
