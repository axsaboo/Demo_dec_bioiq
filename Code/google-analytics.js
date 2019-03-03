<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-135503939-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-135503939-1');

	$(document).on('st', 'select', function(e) {
    	ga('send', 'event', 'widget', 'select data', $(e.currentTarget).val());
  	});

	$(document).on('pp', 'select', function(e) {
    	ga('send', 'event', 'widget', 'select data', $(e.currentTarget).val());
  	});
  
  	$(document).on('go', 'button', function() {
    	ga('send', 'event', 'button', 'plot data');
  	});
</script>