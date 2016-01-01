// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
// require bootstrap
//= require materialize-sprockets



// $('a[data-method="delete"]').click(function(event){
// 	event.preventDefault();
// 	urlDelete=this.href;
// 	var tr=this.parentNode.parentNode;
// 	//console.log($('meta[name="csrf-token"]').attr('content'));
// 	$.ajax({
//         url: urlDelete+".js",
//         type: "delete",
//         data:{
//         	authenticity_token:$('meta[name="csrf-token"]').attr('content')
//         }
//   	}).complete(function(data){
//   			console.log(data);
//   			$(tr).fadeOut('300',function(){
//   					$(tr).remove();
//   			});
//   	});
// });

// $('a[data-method="delete"]').click(function(event){
// 	event.preventDefault();
// 	urlDelete=this.href;
// 	var tr=this.parentNode.parentNode;
// 	//console.log($('meta[name="csrf-token"]').attr('content'));
// 	$.ajax({
//         url: urlDelete+".js",
//         type: "delete",
//         data:{
//         	authenticity_token:$('meta[name="csrf-token"]').attr('content')
//         }
//   	});
// });

$('[name="user[avatar]"]').change(function(){

	var reader = new FileReader();

	reader.onload=function(e){
		$('#img-avatar').attr("src",e.target.result);
		$('#img-avatar').css("display","inline-block");
	}
	reader.readAsDataURL(this.files[0]);
});

$('[name="post[file_name]"').change(function(){

	var reader = new FileReader();

	reader.onload=function(e){
		$('#img-article').attr("src",e.target.result);
		$('#img-article').removeClass("hide");
	}
	reader.readAsDataURL(this.files[0]);
});


function initPagination(){
	$('.getPostsPage').click(function(event){
		event.preventDefault();
		$('.getPostsPage').removeClass('active');
		$(this).addClass('active');
		// $('#loadPostBar').removeClass('hidden');

		var page=$(this).attr('data-page');
		$.ajax({
	        url: "/posts.json",
	        data:{
	        	// authenticity_token:$('meta[name="csrf-token"]').attr('content'),
	        	page:page,
	        	limit:$('#article-par-page').val()
	        }
	  	}).done(function(data)
	  	{
	  		console.log(data);
	  		$('.post-card').remove();
	  		for(var x in data){
				// console.log(data[x]);
				var card=	"<div class='col s6 post-card'>"+
								"<div class='card medium custom'>"+
									"<a href='/posts/1'>"+
								 		"<div class='card-image'>"+
								    		"<img src='"+data[x].file_name.thumb.url+"'>"+
								    		"<span class='card-title'>"+data[x].title+"</span>"+
									  	"</div>"+
								  	"</a>"+
									"<div class='card-content'>"+"<p>"+data[x].header+"<p></div>"+
									"<div class='card-action'>"+
									  	"<div class='row'>"+
									  		 "<div class='col m2'>"+
									  		 	"<img src='"+data[x].user.avatar.thumb.url+"'>"+
									  		 "</div>"+
									  		 "<div class='col m5'>"+
									  			"<a href='/users/"+data[x].user.id+"'>"+data[x].user.first_name+" "+data[x].user.last_name+"</a>"+
									  			"<span class='date'>le "+data[x].created_at.substr(0,10)+"</span>"+
									  		"</div>"+
									  		"<div class='col m5 link-card'>"+
	                    						"<a href='/posts/1'>voir l'article</a>"+
	          								"</div>"+
	          							"</div>"+
									"</div>"+
								"</div>"+
							"</div>";


				$("#list-posts").append(card);
				// $('#loadPostBar').addClass('hidden');
			}
	  	});
	});
}
// <div class="col s6 post-card">
//             <div class="card medium custom">
//               <a href="/posts/1"><div class="card-image">
//                 <img src="/uploads/post/file_name/1/thumb_article5.jpeg" alt="Thumb article5">
//                 <span class="card-title">
//                   odio condimentum id luctus nec molestie sed
//                 </span>
//               </div>
//               </a>
//               <div class="card-content">
//                 <p>
//                   leo maecenas pulvinar lobortis est phasellus sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in
//                 </p>
//               </div>
//               <div class="card-action">
//                 <div class="row">
//                   <div class="col m2">
//                     <img src="/uploads/user/avatar/6/thumb_default.png" alt="Thumb default">
//                   </div>
//                   <div class="col m5">
//                     Par
//                     <a href="/users/6">Holmes
//                     Jean
//                     </a>
//                     <span class="date">
//                       le
//                       2015-12-29
//                       à
//                       05:02PM
//                     </span>
//                   </div>
//                   <div class="col m5 link-card">
//                     <a href="/posts/1">voir l'article</a>
//                   </div>
//                 </div>
//               </div>
//             </div>
//           </div>

// $('.sign-form input').each(function(){

// 	if(this.value!=""){
// 		this.className="active";
// 	}
// 	else
// 	{
// 		this.className="";
// 	}
// });


// $('.sign-form input').keyup(function(){

// 	if(this.value!=""){
// 		this.className="active";
// 	}
// 	else
// 	{
// 		this.className="";
// 	}
// });

$( document ).ready(function(){
  $(".button-collapse").sideNav();
  $('#article-par-page').material_select();
  $('.modal-trigger').leanModal();
  initPagination();
}) 

$('#article-par-page').change(function(){
	// console.log(this.value);
	$('.getPostsPage').remove();
	var numberArticle=$('#article-par-page option:last-child').val();

	var mod=0;
	if(numberArticle%this.value!=0)
		mod+=1;

	for (var i = 1; i <= (numberArticle/this.value)+mod; i++) {
		$('#pagination-article').append('<li class="waves-effect getPostsPage" data-page="'+i+'">'+i+'</li>');
	};
	initPagination();
	$('#pagination-article li:first-child').addClass('active');
	$('#pagination-article li:first-child').click();
	
})

$('.delete-post-show').click(function(event){
	event.preventDefault();
	// console.log($(this).attr('data-name'));
	$('#name-article-delete').html($(this).attr('data-name'));
	$('#delete-post-button').off( "click" );
	$('#modal-delete').openModal();

	$('#delete-post-button').click(function(event){
		$('#form-post').submit();
	});
});

$('button.delete-post').click(function(event){
	event.preventDefault();
	$('#modal-delete').openModal();
	// console.log(this);
	var url=$(this).attr("data-url");
	console.log($(this).attr('data-name'));
	$('#name-article-delete').html($(this).attr('data-name'));
	$('#delete-post-button').off( "click" );
	
	$('#delete-post-button').click(function(event){
		console.log(url);
		// urlDelete=this.href;

		$('#modal-delete').closeModal();
		$.ajax({
	        url: url+".json",
	        type: "delete",
	        data:{
	        	id:4,
	        	authenticity_token:$('meta[name="csrf-token"]').attr('content')
	        }
	  	})
	  	.complete(function(data){
	  			$('#nbArticlesUser').html($('#nbArticlesUser').html()-1);
	  			$("#post-"+data.responseJSON).fadeOut('300',function(){
	  					$("#post"+data.id).remove();
	  			});
	  	});

	})
});