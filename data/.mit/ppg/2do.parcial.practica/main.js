function borrarDatos(){
	//alert("borrar");
	//document.forma_datos.output_password.value=";;;";

}

function generarCuenta(){
	email = getFirstNameFirstChar();


}

function getFirstNameFirstChar(){
	firstName = document.forma_datos.input_persona_nombre.value;

	if ( firstName == "" ){
		alert("El nombre es obligatorio.");
		document.forma_datos.input_persona_nombre.style="background-color: red;";
		document.forma_datos.input_persona_nombre.style="background: red;";

	}

}
