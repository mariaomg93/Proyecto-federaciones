$(document).ready(function(){
	$(document).on("click", ".open-Modal", function(){
		var Equipo=$(this).data("id");
		var nomfede=$(this).data("nombre");
		$(".modal-body #equipo").val(Equipo);	
		$(".modal-body #equinombre").text(nomfede);
	});
	
	$(".btn-borrar").on("click", function(){
		var id=$(".modal-body #Equipo").val();
		$.ajax({
			url : "/sensei/equipo/"+id,
			type: 'DELETE',
			success: function(result) {
		    $('tr[data-id="'+id+'"]').remove();
			
		   
		    }
		});
	
	})
	
$(".editar-equipo").on("click", function(){
		
		
		var id=$(this).parents('tr').data('id');
		var url='equipos/'+id;
		
		$.get(url).done(function(equipo){
			
			$('.modal-title').text("Editar Equipo");
			$('#nombre-equipo').val(equipo.nombre);
			$('imagen-equipo').val(equipo.imagen);
			$('#presupuesto-equipo').val(equipo.presupuesto);
			$('#estadio-equipo').val(equipo.estadio);
			$('#federacion-equipo').val(equipo.fede.id);
			$('#id-equipo').val(equipo.id);
			$('#modal-equipo').modal('show');
			
		})
		
		
	})

	
	
	
})