function putMessage(text)
 {
   if (!document.getElementById) return; 

   var elm = document.getElementById('message01');
   elm.innerHTML = text;
 }
