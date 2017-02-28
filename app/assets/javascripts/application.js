// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require_tree .

$(function(){ $(document).foundation(); });

$(window).load(function() {

	// new site
	var new_site_button = document.getElementById("new_site_url_button");
	new_site_button.onclick = function(){
		var new_url = document.getElementById("new_site_url").value;
		var new_pseudo = document.getElementById("new_site_pseudo").value; 
	 	var link = "/sites.json";
	 	var new_url_info = {"url":new_url,"pseudo":new_pseudo};
		$.post(
		    link,
		    new_url_info,
		    function() {
		    }
		).done(function(callback) {
			console.log(callback);
			if (callback.status == "ok"){
				var html ="";
				html += "<td>"+new_url+" | pseudo :"+new_pseudo +"</td>"; 
	    		html += "<td></td>";
				var table = document.getElementById("all_site");
				var new_line = table.insertRow(1);
				$(new_line).html(html);
				$("#notice").fadeIn(1200).html("Créer avec succes");
			} else {
				$("#notice").fadeIn(1200).html("impossible de créer : verifier l'url ou que le lien n'existe pas");
			}
			plus_un_score();
			$("#new_site_url").val('');
		});

	};

	// new like
	var all_chekcin_bouton = $("[type='new_checkin']");

	for (var i = all_chekcin_bouton.length - 1; i >= 0; i--) {
		$(all_chekcin_bouton[i]).click(function(){
		 	var link = this.getAttribute("url");
		 	$(this).fadeOut(1200);
			$.get(
			    link,
			    {},
			    function(data) {
			    	
			    }
			).done(function(callback) {
				plus_un_score();
			});

		});
	}

	// +1 to Like score
	function plus_un_score(){
		var score_string = document.getElementById("nb_like");
		var score = parseInt($(score_string).html());
		score ++;
		$(score_string).html(score);
	}
	
// load newt data at the end
$(window).scroll(function() {
       if($(window).scrollTop() + $(window).height() == getDocHeight()) {
       	var step = 10;
       	start +=step;
       	var stop = start+step;
       	var link = "sites/get_next_site?start="+start+"&stop="+stop;
		$.get(
		    link,
		    {},
		    function(data) {
		    	sites_to_be_added = JSON.parse(data.sites);
		    	all_site = $("#all_sites")
		    	if (sites_to_be_added != null){
			    	for (var i = sites_to_be_added.length - 1; i >= 0; i--) {
			    		var current_site = sites_to_be_added[i];
						html = '<tr><td><a target="_blank" href="'+current_site.url+'">'+current_site.url+'</a></td><td>'+current_site.pseudo+'</td><td>';
						html += '<div type="new_checkin" class="button" url="/sites/checkin_site?id='+current_site.id+'">';
	            		html += '"je l\'ai liké"</div></td></tr>';
	            		all_site.append(html);
			    	}		    		
	    		}
		    }
		)	
           //alert("bottom!");
       }
   });


});

function getDocHeight() {
    var D = document;
    return Math.max(
        D.body.scrollHeight, D.documentElement.scrollHeight,
        D.body.offsetHeight, D.documentElement.offsetHeight,
        D.body.clientHeight, D.documentElement.clientHeight
    );
}

