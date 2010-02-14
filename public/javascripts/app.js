$(document).ready(function() {
  $.get("/gotd", function(data) {
    $('#board').fadeOut('normal', function() {
      $('#board-loading').remove();
    
      var chess = $('#board').chess({pgn : data });

      $('#board-back').click(function() {
        chess.transitionBackward();
        return false;
      });

      $('#board-next').click(function() {
        chess.transitionForward();
        return false;
      });

      $('#board-flip').click(function() {
        chess.flipBoard();
        return false;
      });
      $('#gotd h2').html(chess.game.header['White'] + ' vs ' + chess.game.header['Black'] + ' ' + chess.game.header['Result']);
      $('#gotd p').html(chess.game.header['Event'] + ', ' + chess.game.header['Site'] + ', ' + chess.game.header['Date']);
    });
    
    $('#board').fadeIn('normal');
  });
});