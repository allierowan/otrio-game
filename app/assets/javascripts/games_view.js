
(function() {
  window.otrio = window.otrio || {};

  window.otrio.handleDragStart = handleDragStart;
  window.otrio.handleDragOver = handleDragOver;
  window.otrio.handleDragEnter = handleDragEnter;
  window.otrio.handleDragLeave = handleDragLeave;
  window.otrio.handleDrop = handleDrop;
  window.otrio.handleDragEnd = handleDragEnd;
  window.otrio.elSize = elSize;

  var dragSrcEl = null;
  var gamePieceColor = null;

  function elSize(e) {
    if (e.classList.contains("lg-space") || e.classList.contains("size-3")) {
      return 3;
    } else if (e.classList.contains("md-space") || e.classList.contains("size-2")) {
      return 2;
    }  else if (e.classList.contains("sm-space") || e.classList.contains("size-1")) {
      return 1;
    } else {
      return "None";
    }
  }

  function containsX(string) {
    return string.includes("x");
  }
  function containsY(string) {
    return string.includes("y");
  }

  function elXCoor(e) {
    xClassName = e.className.split(" ").filter(containsX)[0];
    return xClassName.slice(-1);
  }

  function elYCoor(e) {
    yClassName = e.className.split(" ").filter(containsY)[0];
    return yClassName.slice(-1);
  }

  function handleDragStart(e) {
    // Target (this) element is the source node.
    this.style.opacity = '0.4';

    dragSrcEl = this;
    gamePieceColor = dragSrcEl.style.borderColor;

    e.dataTransfer.effectAllowed = 'move';
    e.dataTransfer.setData('text/html', this.outerHTML);

  }

  function handleDragOver(e) {
    if (e.preventDefault) {
      e.preventDefault(); // Necessary. Allows us to drop.
    }
    e.dataTransfer.dropEffect = 'move';
    return false;
  }

  function handleDragEnter(e) {
    // this / e.target is the current hover target.
    if (elSize(dragSrcEl) == elSize(this)){
      this.classList.add('over');
    }
  }

  function handleDragLeave(e) {
    this.classList.remove('over');  // this / e.target is previous target element.
  }

  function handleDrop(e) {
  // this/e.target is current target element.

    if (e.stopPropagation) {
      e.stopPropagation(); // Stops some browsers from redirecting.
    }

    // Don't do anything if dropping the same column we're dragging.
    console.log(elSize(dragSrcEl));
    if (dragSrcEl != this && (elSize(dragSrcEl) == elSize(this))) {
      // Set the source column's HTML to the HTML of the column we dropped on.
      dragSrcEl.style.display = "none";

      if (dragSrcEl.classList.contains("purple-color")) {
        this.style.borderColor = "rgb(110, 8, 119)";
        window.otrio.playGamePiece("purple", elSize(dragSrcEl), elXCoor(this), elYCoor(this));
      } else if (dragSrcEl.classList.contains("green-color")) {
        this.style.borderColor = "rgb(38, 113, 64)";
        window.otrio.playGamePiece("green", elSize(dragSrcEl), elXCoor(this), elYCoor(this));
      } else if (dragSrcEl.classList.contains("blue-color")) {
        this.style.borderColor = "rgb(16, 40, 113)";
        window.otrio.playGamePiece("blue", elSize(dragSrcEl), elXCoor(this), elYCoor(this));
      } else if (dragSrcEl.classList.contains("red-color")) {
        this.style.borderColor = "rgb(154, 22, 58)";
        window.otrio.playGamePiece("red", elSize(dragSrcEl), elXCoor(this), elYCoor(this));
      }
      this.removeEventListener('dragenter', handleDragEnter, false);
      this.removeEventListener('dragover', handleDragOver, false);
      this.removeEventListener('dragleave', handleDragLeave, false);
      this.removeEventListener('drop', handleDrop, false);
    }

    return false;
  }

  function handleDragEnd(e) {
  // this/e.target is the source node.
  this.style.opacity = '1';
    [].forEach.call(boardDivs, function (div) {
      div.classList.remove('over');
    });
  }

  var divs = document.querySelectorAll('div.game-piece');
  var boardDivs = document.querySelectorAll('div.board-space');

  [].forEach.call(divs, function(div) {
      div.addEventListener('dragstart', handleDragStart, false);
      div.addEventListener('dragend', handleDragEnd, false);
  });

  [].forEach.call(boardDivs, function(div) {
      div.addEventListener('dragenter', handleDragEnter, false);
      div.addEventListener('dragover', handleDragOver, false);
      div.addEventListener('dragleave', handleDragLeave, false);
      div.addEventListener('drop', handleDrop, false);
  });

}());
