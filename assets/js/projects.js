$(document).ready(function(){
	$.get('/data/projects.csv', function(data){
		var content = $.csv.toArrays(data);
		content.splice(0,1); //get rid of column headers
		var html = '';
		var pname = '';
		var pcontact = '';
		var pdesc = '';
		var pgithub = '';
		var pneeds = '';
		var plink = '';
		var pstatus = '';
		var row_switch = false;
		
		for(var row in content){
			pstatus = content[row][7];
			if(pstatus != "inactive" && pstatus !="not started"){
				projectId = "project" + row;
				pname = content[row][0];
				if(pname == ""){
						pname = "Unnamed project"
				}
			
				pdesc = content[row][1];

				pcontact = content[row][2];
				if(pcontact == ""){ 
					pcontact == "Matt Bailey";
				}
				ptwitter = content[row][3];
				if(ptwitter == "" && pcontact == "Matt Bailey"){
					ptwitter == "@mattbailey0";
				}
				
				pemail = content[row][4];
			
				pneeds = content[row][5];
				if(pstatus == "not started"){
					pneeds = "This project hasn't started! Get in touch to kick it off."
				}
				
				purl_info = content[row][8];
				pgithub = content[row][9];
				purl_home = content[row][10];
															
				if(!row_switch){
					html += 	'<div class="col-lg-12">';
				}

				html += '<div class="col-lg-2 project-icon"><img src="images/launch.png" width="100px"/></div>';
			
				html += '<div class="col-lg-10 project-text" id="' + projectId + '">	<h3><a name="'+ pname + '"></a>' + pname + '</h3>';
				html += "<p class='project-content'>"

				if(pdesc != ""){html += pdesc + '<br/>';}
				html += 'Contact: ' + pcontact;
				if(ptwitter != ""){
					html += ' (<a href="http://www.twitter.com/' + ptwitter.substring(1) +'">'+ ptwitter +'</a>)';
				}
				html += '</br>';
				
				if(pneeds != ""){html += 'Needs: '+ pneeds + '<br/>';}
				if(purl_info != ""){html += '<a href="'+ purl_info +'" target="_blank">Read more about this project</a><br/>';}
				

				if(pgithub != ""){
					html += '<a href="'+ pgithub +'" target="_blank">Browse the code</a><br/>';
					
					getGitContent(projectId,pgithub);
				}
				


				if(purl_home != "" && purl_home.indexOf("www.codefordc.org") == -1 ){html += '<a href="'+ purl_home +'" target="_blank">Check out the website</a>';}
				

				html += '</p></div>';
				
				if(row_switch){
					html +=	'</div>';
				}
				row_switch = !row_switch;
			}
		}
		$("#project-list").html(html);
	});
 });


function getGitContent(project, url){
	var projectElement = "#" + project + " .project-content";

	var chunked_url = url.split("/");
	git_user = chunked_url[3];
	git_repo = chunked_url[4];

	$.get('https://api.github.com/repos/' + git_user + '/' + git_repo + '/contributors').done(function(data){
		var val = '';
		$.each( data, function(index, value	){
			
			$(projectElement).before("<img src='" + value.avatar_url + "' class='project-git-human' /> ");
		});
	});
}
