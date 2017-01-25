
(function() {
  window.otrio = window.otrio || {};

  window.otrio.handleDragStart = handleDragStart;
  window.otrio.handleDragOver = handleDragOver;
  window.otrio.handleDragEnter = handleDragEnter;
  window.otrio.handleDragLeave = handleDragLeave;
  window.otrio.handleDrop = handleDrop;
  window.otrio.handleDragEnd = handleDragEnd;

  var dragSrcEl = null;
  var gamePieceColor = null;

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
    this.classList.add('over');
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
    if (dragSrcEl != this) {
      // Set the source column's HTML to the HTML of the column we dropped on.
      dragSrcEl.style.display = "none";

      if (dragSrcEl.classList.contains("purple-color")) {
        this.style.borderColor = "rgb(110, 8, 119)";
      } else if (dragSrcEl.classList.contains("green-color")) {
        this.style.borderColor = "rgb(38, 113, 64)";
      } else if (dragSrcEl.classList.contains("blue-color")) {
        this.style.borderColor = "rgb(16, 40, 113)";
      } else if (dragSrcEl.classList.contains("red-color")) {
        this.style.borderColor = "rgb(154, 22, 58)";
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
