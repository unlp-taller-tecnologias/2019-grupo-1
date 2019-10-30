    var jQueryScript = document.createElement('script'); 

    jQueryScript.setAttribute('src','https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js');
    
    document.head.appendChild(jQueryScript);
    
function validar(){
  var nombre = document.getElementById("select").value;

    if ( nombre == "" ){
        errorNombre = "vacio";
    }
    else{
      if(!nombre.match(/^[0-9]*$/)){
          errorNombre="nums"
        }
        else
            errorNombre = "";
    }

   if (errorNombre !=""){
      if(errorNombre=="vacio"){
          $.alert({
              title: 'Cambiar Cantidad',
              content: 'La cantidad no puede estar vacia',
              type: 'red',
          }); 
      }else{

          if(errorNombre=="nums"){
            $.alert({
                title: 'Cambiar Cantidad',
                content: 'Debe ingresar solo números!',
                type: 'red',
            });  
          }

      }
          return false;
      }else{
          return true;}
  }



