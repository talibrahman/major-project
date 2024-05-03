/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */



var http = getXMLHTTPRequest();
function getXMLHTTPRequest() {
    var req = false;
    try {
        req = new XMLHttpRequest();
    }
    catch (err1) {
        try {
            req = new ActiveXObject("Msxml2.XMLHTTP");
        }
        catch (err2) {
            try {
                req = new ActiveXObject("Microsoft.XMLHTTP");
            }
            catch (err3) {
                req = false;
            }
        }
    }
    return req;
}
function getSubsequentOptions(fromId, typeId, type, callback) {
   http = getXMLHTTPRequest();
    var code = document.getElementById(fromId).value;
    var url = "ReportExecution1.jsp?type=" + type + "&param=" + code;
//    if (type == "sample") {
//        var code2 = document.getElementById('constituency_code').value;
//        url += "&sample=" + code2;
//    }
 if (type == "ccnames"){
             var gan = document.getElementById('type_col').value;
             
        url += "&ccnames="+gan;
    }
    
 if (type == "districts") {
              var gan2 = document.getElementById('type_col').value;
              var cc1 = document.getElementById('mla_code').value;
        url += "&districts=" + cc1+"&ccnames="+gan2;
    }

     if (type == "mlanames") {
        var gan = document.getElementById('type_col').value;
        var code3 = document.getElementById('constituency_code').value;
        url += "&mlanames="+code3+"&ccnames="+gan;
    }

 if (type == "sample1") {
        var codee = document.getElementById('mla_code').value;
        url += "&sample1=" + codee;
    }


if (type == "sample2") {
        var code4 = document.getElementById('source_of_funding').value;
        url += "&sample2=" + code4;
    }
    
    if (type == "sample3") {
        var code5 = document.getElementById('constituency_code').value;
        url += "&sample3=" + code5;
    }
    if (type == "sample4") {
        var code6 = document.getElementById('district_code').value;
        url += "&sample4=" + code6;
    }
    if (type == "sample5") {
        var code6 = document.getElementById('district_code').value;
         var code7 = document.getElementById('mandal_code').value;
        url += "&sample5=" + code7+ "&sample4=" + code6;
    }
     if (type == "sample6") {
        var sector1 = document.getElementById('sector_code').value;
        url += "&sample6=" + sector1;
    }
    http.open("GET", url, true);
    http.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    http.onreadystatechange = function () {
        return populateOptions(typeId, callback)
    };
    http.send(null);
}
function getSubsequentOptioned(fromId, typeId, type, callback) {
   http = getXMLHTTPRequest();
    var code = document.getElementById(fromId).value;
    var url = "ReportExecution1.jsp?type=" + type + "&param=" + code;
//    if (type == "sample") {
//        var code2 = document.getElementById('constituency_code').value;
//        url += "&sample=" + code2;
//    }
     if (type == "mlanames2") {
        var code3 = document.getElementById('constituency_code').value;
        url += "&mlanames2=" + code3;
    }
 if (type == "mlaworks") {
        var mlawork = document.getElementById('type_col').value;
        url += "&mlaworks=" + mlawork;
    }
    if (type == "fy") {
        var fy = document.getElementById('funding_year').value;
        url += "&fy=" + fy;
    }
     
     if (type == "mla") {
        var mla = document.getElementById('mla').value;
        url += "&mla=" + mla;
    }
    
if (type == "san_balance") {
        var s1 = document.getElementById('source_of_funding').value;
        var fy = document.getElementById('funding_year').value;
        var mla = document.getElementById('mla').value;
        url += "&san_balance=" + s1+"&fy=" + fy+"&mla=" + mla;
    }

   if(type=="work_locations")
   {
        var work_locations = document.getElementById('work_location').value;
        url += "&work_locations=" + work_locations;

   }

    http.open("GET", url, true);
    http.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    http.onreadystatechange = function () {
        return populateOptions(typeId, callback)
    };
    http.send(null);
}

function populateOptions(typeId, callback) {
    if (http.readyState == 4) {
        var response = http.responseText;
        document.getElementById(typeId).innerHTML = response;
        if (callback != undefined) {
            setTimeout(callback, 10);
        }
    }
}

function getSubsequentOptions1(fromId, typeId, type, callback) {
    http = getXMLHTTPRequest();

    var code = document.getElementById(fromId).value;
    var url = "AjaxExecutionForDuplicates.jsp?type=" + type + "&param=" + code;
    http.open("GET", url, true);
    http.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    http.onreadystatechange = function () {
        return populateOptions(typeId, callback)
    };
    http.send(null);
}

        