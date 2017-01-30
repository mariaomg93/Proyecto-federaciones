$(document).ready(function() {

	editarJugador();
	borrarJugador();

})

var limpiarModal= function(){
	
	$('.modal-title').text("Añadir Jugador");
	$('#nombre-jugador').val('');
	$('#edad-jugador').val('');
	$('#goles-jugador').val('');
	$('#equipo-jugador').val('');
	$('imagen-jugador').val('');
	$('#input').val('');
		
}




var borrarJugador = function() {
	cogerId();
	$(".btn-borrar").on("click", function() {
		var id = $(".modal-body #Jugador").val();
		$.ajax({
			url : "/sensei/jugadores/" + id,
			type : 'DELETE',
			success : function(result) {
				$('tr[data-id="' + id + '"]').remove();
			}
		});
	})
}

var cogerId = function() {
	$(document).on("click", ".open-Modal", function() {
		var Jugador = $(this).data("id");
		var nomjug = $(this).data("nombre");
		$(".modal-body #Jugador").val(Jugador);
		$(".modal-body #jugnombre").text(nomjug);
	});
}

var editarJugador = function() {
	cogerId();

	$(".editar-jugador").on("click", function() {
		var id = $(this).parents('tr').data('id');
		var url = '/sensei/jugadores/' + id;

		$.get(url).done(function(jugador) {

			$('.modal-title').text("Editar Jugador");
			$('#nombre-jugador').val(jugador.nombre);
			$('#edad-jugador').val(jugador.edad);
			$('#goles-jugador').val(jugador.goles);
			$('#equipo-jugador').val(jugador.equipo);
			$('imagen-jugador').val(jugador.imagen);
			$('#input').val(jugador.equi.id);
			$('#id-jugador').val(jugador.id);
			$('#modal-jugador').modal('show');

		})
		$('#modal-jugador').on('hide.bs.modal', limpiarModal);

	})
}
