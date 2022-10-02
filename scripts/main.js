function warn(){
    alert("warning");
}
let i = 0;
function copyData(){
    input = document.getElementById('input_data').value;
    new_par = document.createElement('p');
    new_par.innerText = input;
    new_par.setAttribute("onclick","remove(this)");
    new_par.setAttribute("id",`id${i++}`);
    document.body.appendChild(new_par);
}

function remove(elem){
    elem.remove();
}