var $container = $('#feed_container');
// initialize
$container.masonry({
 itemSelector: '.feed_item'
 columnWidth: 125,
 animated: true,
 isAnimated: true,
  animationOptions: {
    duration: 750,
    easing: 'linear',
    queue: false
  }
});

var msnry = $container.data('masonry');