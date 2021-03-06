<!DOCTYPE html>
<html lang="en">
  <head>
    <title><?php echo $title;?></title>
    <meta charset="utf-8">
	  <meta name="theme-color" content="#000000" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Muli:700" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/animate.css">
    <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="assets/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="assets/css/magnific-popup.css">
    <link rel="stylesheet" href="assets/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="assets/css/icomoon.css">
    <link rel="stylesheet" href="assets/css/style.css">

    <script src="https://code.jquery.com/jquery-2.2.4.js" charset="utf-8"></script>
  </head>
  <body data-spy="scroll" data-target="#ftco-navbar" data-offset="200">
    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
      <div class="container">
        <a class="navbar-brand" href="#">S<sub>5</sub> Restaurant</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="oi oi-menu"></span>&nbsp;Menu
        </button>
        <a href="cart" title="Cart"> <img src="./assets/images/cart_1.png">(<span id="cart-count"></span>)</a>
        <div class="collapse navbar-collapse" id="ftco-nav">
          <ul class="navbar-nav ml-auto">
		        <?php foreach ($categories as $key => $value):
               $list = '<li class="nav-item"><a href="#section-'.$value['name'].'" class="nav-link">'.$value['name'].'</a></li>';
               echo $list;
			        endforeach; 
            ?>
          </ul>
        </div>
      </div>
    </nav>
    <!-- END nav -->

	  <div class="container">
      <div class="row">
        <div class="col-md-10 text-center mb-5 ">
		      <h2>Hello &nbsp;<?php $var = $this->session->userdata; echo $var['username_store_front']; ?></h2>
          <h5 class="display-4">Today's Menu</h5>
          <div class="row justify-content-center">
           <div class="col-md-7">
             <p class="lead">Cheese is the most stolen food in the world</p>
           </div>
          </div>
        </div>
	    </div>
    </div>

	  <!-- SECTIONS -->
    <form method="post" onsubmit="return false" id="addtoCart">
      <?php foreach ($categories as $key => $value): ?>
  	  <section id="section-<?php echo $value['name'];?>">
  	    <div class="container">
          <div class="col-md-10 text-center">
  	        <div class="text-center">
  	         <h4>------- <?php echo "<p style='color:#f4511e;'>".$value['name']."</p>";?>--------</h4>
  	      </div>

          <?php foreach ($products as $k => $v):

           /*$string = $products[$k]["category_id"];
           $string = substr($string,2);
           $string = substr($string, 0, -2);*/

           if($value['name'] == $products[$k]["category_name"]){ ?>

             <div class="tab-content">
              <div class="row">
                <div class="col-md-12 ftco-animate">
                  <div class="media menu-item">
                    <div class="media-body">
                     <table id="menuTable" style="width:100%;"><tr>
                      <th style="width:70%;text-align:left"><h5 class="mt-0"> <?php echo $products[$k]["name"]; ?></h5></th>
                      <input type="hidden" name="id" id="id" value="<?php echo $var['id_store_front']; ?>">
                        <input type="hidden" name="id" id="id_<?php echo $products[$k]["id"]; ?>" value="<?php echo $var['id_store_front']; ?>">
                        <input type="hidden" name="product_id" id="product_id_<?php echo $products[$k]["id"]; ?>" value="<?php echo $products[$k]["id"]; ?>">
                        <input type="hidden" name="product_name" id="product_name_<?php echo $products[$k]["id"]; ?>" value="<?php echo $products[$k]["name"]; ?>">
                        <td style="width:30%;text-align:right">
                         <div class="quantity">
                          <button class="minus-btn" type="button" name="button">-</button>
                          <input type="text" name="quantity" id="quantity_<?php echo $products[$k]["id"]; ?>" value="0">
                          <button class="plus-btn" type="button" name="button">+</button>
                         </div>
                        </td></tr>
                       <tr><th style="text-align:left"><h6 class="text-primary menu-price"><?php echo "&#8377;".$products[$k]["price"]; ?></h6></th>
                        <input type="hidden" name="price" id="price_<?php echo $products[$k]["id"]; ?>" value="<?php echo $products[$k]["price"]; ?>">
                        <input type="hidden" name="amount" id="amount_<?php echo $products[$k]["id"]; ?>" value="<?php echo $products[$k]["price"]; ?>">
    				           <td style="text-align:right;white-space:nowrap;"><span id="remove_<?php echo $products[$k]["id"]; ?>" data-value="<?php echo $products[$k]["id"]; ?>" class="fa fa-trash-o" style="font-size:24px;color:red;visibility: hidden;"></span>&nbsp;&nbsp;<input type="button" id="submit" class="btn btn-success" value="Add" data-value="<?php echo $products[$k]["id"]; ?>"></td></tr>
                     </table>
                    </div>
                  </div>
                </div>
    		      </div>	
    		     </div>		 
           <?php } ?>
          <?php endforeach; ?>      
        </div>
  	  </section>
      <?php endforeach; ?>
    </form>	

	<!-- FOOTER -->
	<footer class="ftco-footer ftco-bg-dark ftco-section">
      <div class="container">
        <div class="row ftco-animate">
          <div class="col-md text-left">
            <p style="text-align:center;">&copy; <?php echo date('Y');?> <a href="https://festech.in">Festech Solutions</a> <br>All Rights Reserved. </p>
          </div>
        </div>
      </div>
  </footer>
	<div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

	<script type="text/javascript">
    $(document).ready(function() {
      
      var base_url = "<?php echo base_url(); ?>";
      var user_id = $('#id').val();

      $.ajax({
        url: base_url + 'cart/getCartProducts',
        type: 'post',
        dataType: 'json',
        data: { cust_id: user_id },
        success: function(data)
        {
            console.log('success',data);
            $("#cart-count").html('<label>'+ data.count +'</label>');
            for ( i = 0; i < data.count; i++) {
              $("#quantity_" +data.products[i].product_id).val(data.products[i].qty);
              document.getElementById("remove_" +data.products[i].product_id).style.visibility = "visible";
            }
        }
      })

      $(document).on('click', "#submit", function(e) {

        var id = $('#id_'+ $(this).data("value")).val();
        var product_id = $('#product_id_'+ $(this).data("value")).val();
        var product_name = $('#product_name_'+ $(this).data("value")).val();
        var qty = $('#quantity_'+ $(this).data("value")).val();
        var price = $('#price_'+ $(this).data("value")).val();
        var amount = qty * price;

        $.ajax({
            url: base_url + 'cart/updatecart',
            type: 'post',
            dataType: 'json',
            data: { cust_id:id, product_id:product_id, product_name:product_name, qty:qty, rate:price, amount:amount },
            success: function(data)
            {
                console.log('success',data);
            }
        })

        if(qty == 0){
          alert("Product quantity cannot be zero");
        }
        else{
          alert("Product updated to cart");
        }

        $.ajax({
          url: base_url + 'cart/getcartcount',
          type: 'post',
          dataType: 'json',
          data: { cust_id: id },
          success: function(data)
          {
              console.log('success',data);
              $("#cart-count").html(data);
              $("#remove_" +product_id).css('visibility', 'visible');
          }
        })
      });

      $(document).on('click', '[id*="remove_"]', function(e) {

        var id = $('#id_'+ $(this).data("value")).val();
        var product_id = $('#product_id_'+ $(this).data("value")).val();

        $.ajax({
            url: base_url + 'cart/removecart',
            type: 'post',
            dataType: 'json',
            data: { cust_id:id, product_id:product_id },
            success: function(data)
            {
                console.log('success',data);
            }
        })

        alert("Product removed from cart");

        $.ajax({
          url: base_url + 'cart/getcartcount',
          type: 'post',
          dataType: 'json',
          data: { cust_id: id },
          success: function(data)
          {
              console.log('success',data);
              $("#cart-count").html(data);
              $("#quantity_" +product_id).val(0);
              $("#remove_" +product_id).css('visibility', 'hidden');
          }
        })
      });


      $('.minus-btn').on('click', function(e) {
    		e.preventDefault();
    		var $this = $(this);
    		var $input = $this.closest('div').find('input');
    		var value = parseInt($input.val());
    		if (value > 1) {
    			value = value - 1;
    		} else {
    			value = 0;
    		}
        $input.val(value);
    	});

    	$('.plus-btn').on('click', function(e) {
    		e.preventDefault();
    		var $this = $(this);
    		var $input = $this.closest('div').find('input');
    		var value = parseInt($input.val());
    		if (value < 100) {
      		value = value + 1;
    		} else {
    			value =100;
    		}
    		$input.val(value);
    	});
    });
  </script>
  <script src="assets/js/main.js"></script> <!-- Resource jQuery -->
  <script src="assets/js/jquery.min.js"></script>
  <script src="assets/js/popper.min.js"></script>
  <script src="assets/js/bootstrap.min.js"></script>
  <script src="assets/js/jquery.easing.1.3.js"></script>
  <script src="assets/js/jquery.waypoints.min.js"></script>
  <script src="assets/js/owl.carousel.min.js"></script>
  <script src="assets/js/jquery.magnific-popup.min.js"></script>
  <script src="assets/js/bootstrap-datepicker.js"></script>
  <script src="assets/js/jquery.timepicker.min.js"></script>
  <script src="assets/js/jquery.animateNumber.min.js"></script>
  <script src="assets/js/main.js"></script>
</body>
</html>