document.addEventListener("turbolinks:load", function() {
	// body...
	$input =  $("[data-behavior='autocomplete']")
	var options = {
			getValue: "name",
			url: function(phrase){
				return "/search.json?q=" + phrase;
			},
			categories: [
				{
					// listlocations: "users",
					// header: "<strong>User</strong>"
				}
			],
			list: {
				onChooseEvent: function(){
					var url = $input.getSelectedItemData().url
					$input.val("")
					Turbolinks.visit(url);
				}
			},
			theme: "dark"

	}
	$input.easyAutocomplete(options);
	// $("#easy-autocomplete-container li:first").addClass("selected");
});


