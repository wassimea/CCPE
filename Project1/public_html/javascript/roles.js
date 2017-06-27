function request_save_role() {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("save_button").innerHTML="";
      document.getElementById("result").innerHTML="";
      document.getElementById("result").innerHTML = this.responseText;
    }
  };
  xhttp.open("GET", "save_role", true);
  xhttp.send();
}