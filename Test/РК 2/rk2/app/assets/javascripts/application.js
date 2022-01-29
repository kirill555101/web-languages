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

document.addEventListener('DOMContentLoaded', function() {
    document.querySelector("#add").addEventListener(
    'ajax:success', function(event) {
        [data, status, xhr] = event.detail
        showResult(data)
    })
})

function showResult()
{
    if (data.error)
    {
        document.getElementById("result").innerText = data.error
    }
    else
    {
        document.getElementById("result").innerText = data.result
        document.getElementById("array").value = data.array
    }
}

function clearResult()
{
    document.getElementById("array").value = "1 -2 3 -5 10 3 5"
    document.getElementById("result").innerText = ""
}