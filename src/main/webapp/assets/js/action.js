/**
 * form login
 */
function validate(){
	let check = true;
	//let user = document.getElementById("user").value;
	//let pass = document.getElementById("pass").value;
	let email = document.forms["mForm"]["femail"].value;
	let pass = document.forms["mForm"]["fpass"].value;
	let box = document.getElementById("box-msg");
	box.innerHTML = "";
	
	var regMail = /^([_a-zA-Z0-9-]+)(\.[_a-zA-Z0-9-]+)*@([a-zA-Z0-9-]+\.)+([a-zA-Z]{2,3})$/;
	
	if(email == ""){
		box.appendChild(createElementMsg("Hãy nhập email!"));
		check = false;
	}
	
	if(pass == ""){
		box.appendChild(createElementMsg("Hãy nhập mật khẩu!"));
		check = false;
	}
	
	if(regMail.test(email) == false){
    	box.appendChild(createElementMsg("Email không hợp lệ."));
    	check = false;
    }
	return check;
}

function createElementMsg(msg){
	var p = document.createElement("p");
	p.className = "msg-error";
	p.innerHTML = msg;
	return p;
}


