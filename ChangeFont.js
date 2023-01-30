function changeFont(input,textid){
    ​
    if(input.checked){
        document.getElementById(textid).style.fontWeight="bold";
    } else {
     document.getElementById(textid).style.fontWeight="normal";
    }
    }