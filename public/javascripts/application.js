// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function() {
	$("#gift-registry").sortable({ items: '.gift', axis: 'y', cursor: 'crosshair', stop: function(event,ui){ 
			var ids_array = [];
			$("#gift-registry .gift").each(function(){
				var _id = $(this).attr('id').match(/[0-9]*$/i).toString();
				ids_array.push(_id);
			});
			if(ids_array.length > 0){
				var href = '/gifts/orderlike.xml';
				$.ajax({
                    url: href,
                    context: document.body,
					data: { orderlike: ids_array },
					dataType: 'xml',
                    type: 'post',
                    success: function(){
                        //console.log("success");
                    }
                });
			}
		} });
	$( "#gift-registry" ).disableSelection();
});