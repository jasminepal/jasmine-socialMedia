// // Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// import "@hotwired/turbo-rails"
// import "controllers"



// $(document).on('turbolinks:load', function() {
//     $('#like-toggle').click(function() {
//       var socioId = $(this).data('socio-id');
//       var liked = $(this).data('liked');
//       var buttonText = liked ? 'Like' : 'Unlike';
  
//       $.ajax({
//         url: '/socios/' + socioId + '/like_toggle',
//         type: 'POST',
//         dataType: 'json',
//         success: function(response) {
//           if (response.liked) {
//             $('#like-toggle').data('liked', true).text('Unlike');
//           } else {
//             $('#like-toggle').data('liked', false).text('Like');
//           }
//         },
//         error: function(response) {
//           // Handle errors, if any
//         }
//       });
//     });
//   });
  