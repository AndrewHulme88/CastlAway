// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";
import "@popperjs/core";
import "bootstrap";


//castle index logic
$(document).ready(function() {
  $('.toggle-favorite').click(function(e) {
    e.preventDefault(); // Prevent default form submission

    var $button = $(this);
    var castleId = $button.data('castle_id');
    var isFavorite = $button.data('favorite');

    $.ajax({
      url: '/toggle_favorite', // Replace with your route for toggling favorite status
      method: 'PUT',
      dataType: 'json',
      data: { castle_id: castleId, favorite: !isFavorite }, // Toggle favorite status
      success: function(response) {
        // Update button appearance based on response
        if (response.favorite) {
          $button.find('i').removeClass('far').addClass('fas');
        } else {
          $button.find('i').removeClass('fas').addClass('far');
        }
        $button.data('favorite', response.favorite);
      },
      error: function(xhr, status, error) {
        console.error(error);
      }
    });
  });
});
