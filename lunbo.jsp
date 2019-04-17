<%@page contentType="text/html;charset=utf-8" %>
<link rel="stylesheet" type="text/css" href="css/style-lunbo.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.themepunch.plugins.min.js"></script>
<script type="text/javascript" src="js/jquery.themepunch.revolution.min.js"></script>	
<script type="text/javascript">
jQuery(document).ready(function() {
	jQuery('.tp-banner').revolution({
		delay:9000,
		startwidth:1170,
		startheight:500,
		hideThumbs:10,
		fullWidth:"on",
		forceFullWidth:"on"
	});
});
</script>
<div class="tp-banner-container" style="position:relative;">
	<div class="tp-banner" >
		<ul style="position:relative">
			<li data-transition="slideleft" data-slotamount="14" >
			<img src="images/nav1.jpg" >
			</li>
			<li data-transition="slideleft" data-slotamount="14" >
			<img src="images/nav5.jpg" />
			</li>		
			<li data-transition="slideleft" data-slotamount="14" >
			<img src="images/nav7.jpg" />
			</li>
		</ul>
	</div>
</div>

