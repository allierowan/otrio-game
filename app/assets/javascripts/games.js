(function() {
  window.otrio = window.otrio || {};

  window.otrio.playGamePiece = playGamePiece;

  function playGamePiece(color, size, x_pos, y_pos) {
    var locArray = window.location.pathname.split("/");
    var gameId = locArray.pop();

    var data = {move: {color: color, x_pos: x_pos, y_pos: y_pos, size: size}};
    console.log("data:");
    console.log(data);
    $.ajax("/games/"+gameId, {
      contentType: "application/json",
      dataType: "json",
      method: "PATCH",
      data: JSON.stringify(data)
    });
  }

}());
