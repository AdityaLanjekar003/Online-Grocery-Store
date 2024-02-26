<!DOCTYPE html>
<html lang="en">

<head>
	<title>Responsive Fruit Website Using HTML and CSS</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="style.css" rel="stylesheet">

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
		integrity="sha512-SfTiTlX6kk+qitfevl/7LibUOeJWlt9rbyDn92a1DqWOw9vWG2MFoays0sgObmWazO5BQPiFucnnEAjpAB+/Sw=="
		crossorigin="anonymous" referrerpolicy="no-referrer" />

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css"
		integrity="sha512-yHknP1/AwR+yx26cB1y0cjvQUMvEa2PFzt1c9LlS4pRQ5NOTZFWbhBig+X9G9eYW/8m0/4OXNx8pxJ6z57x0dw=="
		crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.css"
		integrity="sha512-6lLUdeQ5uheMFbWm3CP271l14RsX1xtx+J5x2yeIDkkiBpeVTNhTqijME7GgRKKi6hCqovwCoBTlRBEC20M8Mg=="
		crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"
		integrity="sha512-tS3S5qG0BlhnQROyJXvNjeEM4UpMXHrQfTGmbQ1gKmelCxlSEBUaxhRBj/EFTzpbP4RVSrpEikbmdJobCvhE3g=="
		crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
		integrity="sha512-c42qTSw/wPZ3/5LBzD+Bw5f7bSF2oxou6wEb+I/lqeaKV5FDIfMvvRp772y4jcJLKuGUOpbJMdg/BTl50fJYAw=="
		crossorigin="anonymous" referrerpolicy="no-referrer" />

	<!--  End CSS Libraries Used  -->
	
	<style>
	.add-to-cart {
            background-color: #12b10c;
            border: none;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 4px;
        }

        /* Style for cart icon */
        #cart-icon {
            background-color: #f44336;
            color: white;
            border: none;
            border-radius: 50%;
            width: 30px;
            height: 30px;
            text-align: center;
            font-size: 18px;
            cursor: pointer;
            position: fixed;
            top: 20px;
            right: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        /* Style for cart items display */
        #cart-items {
            position: fixed;
            top: 120px;
            right: 20px;
            background-color: white;
            border: 1px solid #ccc;
            padding: 10px;
            border-radius: 4px;
            max-width: 300px;
            display: none;
        }

        #cart-items h3 {
            margin-top: 20;
        }

        #cart-items ul {
            list-style-type: none;
            padding: 0;
        }

        #cart-items li {
            margin-bottom: 30px;
        }

        #cart-items button {
            background-color: #4CAF50;
            border: none;
            color: white;
            padding: 5px 10px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            margin-left: 10px;
            cursor: pointer;
            border-radius: 4px;
        }
	
	</style>
	<script >
	
	
	let cartItems = [];
	function addToCart(productName, price) {
        // Create an object representing the product
        const item = {
            name: productName,
            price: price,
            quantity: 1
        };
        // Push the item to the cartItems array
        cartItems.push(item);
        // Update the cart icon
        updateCartIcon();
    }
	
	 // Function to update cart icon
    function updateCartIcon() {
        // Get the cart icon element
        const cartIcon = document.getElementById('cart-icon');
        // Set the text content to the number of items in the cart
        cartIcon.textContent = cartItems.length;
    }
	 
    // Function to generate bill
    function generateBill() {
        let total = 0;
        let billDetails = '';
        // Loop through each item in the cart
        cartItems.forEach(item => {
            total += item.price * item.quantity;
            billDetails += `${item.name} - $${item.price} x ${item.quantity}\n`;
        });
        // Display the bill details to the user
        alert(`Bill Details:\n${billDetails}\nTotal: $${total.toFixed(2)}`);
    }
	
	// Function to display cart items
    function displayCart() {
        // Get the cart items display element
        const cartItemsDiv = document.getElementById('cart-items');
        // Clear previous content
        cartItemsDiv.innerHTML = '';
        // Add heading
        const heading = document.createElement('h3');
        heading.textContent = 'Cart Items';
        cartItemsDiv.appendChild(heading);
        // Create list of items
        const itemList = document.createElement('ul');
        cartItems.forEach(item => {
            const listItem = document.createElement('li');
            listItem.textContent = `${item.name} - $${item.price} x ${item.quantity}`;
            itemList.appendChild(listItem);
        });
        cartItemsDiv.appendChild(itemList);
        // Add checkout button
        const checkoutButton = document.createElement('button');
        checkoutButton.textContent = 'Checkout';
        checkoutButton.onclick = function() {
            window.location.href = 'form.jsp';
        };
        cartItemsDiv.appendChild(checkoutButton);
        // Display the cart items
        cartItemsDiv.style.display = 'block';
    }
	
 // Event listener for "Add to Cart" buttons
    document.addEventListener('DOMContentLoaded', function() {
        const addToCartButtons = document.querySelectorAll('.add-to-cart');
        addToCartButtons.forEach(button => {
            button.addEventListener('click', function() {
                const productName = button.dataset.productName;
                const price = parseFloat(button.dataset.price);
                addToCart(productName, price);
            });
        });

        // Event listener for cart icon
        const cartIcon = document.getElementById('cart-icon');
        cartIcon.addEventListener('click', displayCart);
    });

	
	</script>
</head>
<script src="script.js"></script>

<body>
	<!--  Header Start -->

	<header>
		<div class="nav">
			<input type="checkbox" id="check">
			<label for="check" class="checkbtn">
				<i class="fa fa-bars"></i>
			</label>

			<label for="" class="logo">Sm<span>all</span>&nbsp; Basket</label>

			<ul>
				<li><a href="#home">Home</a></li>
				<li><a href="#about">About</a></li>
				<li><a href="#services">Services</a></li>
				<li><a href="#products">Products</a></li>
				<li><a href="#contact">Contact</a></li>
				<li><a href="login.html"><i class="fa fa-user"></i></a>&nbsp;Login</li>
				<li><div id="cart-icon"><i class="fa fa-shopping-cart"></i></div></li>
				
				
			</ul>
			<div id="cart-items"></div>
		</div>
	</header>

	<!-- = Header End = -->

	<div id="home">
		<section class="image-slider">
			<div class="captions">
				<h1 class="wow animate__animated animate__fadeInUp" data-wow-delay=".3s">Give a Hoot! Eat More Fruit
				</h1>
				<p class="wow animate__animated animate__fadeInUp" data-wow-delay=".8s">A pearl of health hidden in a
					fruit. A jewel of health, <br>
					hidden in a vegetable. Eat fruit to be cute.</p>
				<div class="button wow animate__animated animate__fadeInUp" data-wow-delay="1s">
					
						<button type="button" class="btn-1"><a href="#products">Products</a></button>
					
					
						<button type="button" class="btn-2"><a href="#services">Services</a></button>
					
				</div>
			</div>

			<div class="myslider">
				<img src="img/slider1.png" width="100%">
				<img src="img/slider2.png" width="100%">
				<img src="img/slider3.png" width="100%">
			</div>
		</section>
	</div>
	<div id="about">
		<div class="main-content">
			<div class="column">
				<div class="col1">
					<img src="img/girl.jpg" alt="" class="wow animate__animated animate__fadeInLeft"
						data-wow-delay=".3s">
				</div>
				<div class="col1 about wow animate__animated animate__fadeInRight" data-wow-delay=".3s">
					<h1>Best Organic Fruits And Vegetables</h1>
					<p>Welcome to <b>Small Basket!</b> We take pride in providing the finest selection of organic fruits
						and vegetables. Our commitment to quality, sustainability, and health is at the core of
						everything we do. We work directly with local farmers and trusted suppliers to ensure that you
						receive the freshest and most nutritious produce available.</p>
					<p>Juicy Apples Handpicked from our partner orchards, these apples are bursting with flavor and
						packed with vitamins.
						Sweet Strawberries Our succulent strawberries are free from harmful chemicals, making them a
						guilt-free treat for your taste buds.Nutrient-packed Spinach Our organic spinach is packed with
						iron and other essential vitamins, promoting overall health.
						Flavorful TomatoesSavor the rich taste of our vine-ripened, organic tomatoes, perfect for salads
						or sauces.</p>
					<div class="button">
						<button type="button" class="btn-1 read_more">Read More</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="services">
		<section class="features" style="background-image: url(img/bg-icon.png);">
			<div class="h-container">
				<div class="header wow animate__animated animate__fadeInUp" data-wow-delay=".1s">
					<h1>Our Features</h1>
					<p>We provide the best quality of fruits and vegitables that is naturally ripped.</p>
				</div>
			</div>
			<div class="container">
				<div class="container-inner">
					<div class="box wow animate__animated animate__fadeInUp" data-wow-delay=".1s">
						<div class="b-content">
							<img src="img/icon-1.png" alt="">
							<p>Best fruits and vegitables originated form the farmes fields.</p>
							<button type="button" class="r-more">Read More</button>
						</div>
					</div>

					<div class="box wow animate__animated animate__fadeInUp" data-wow-delay=".3s">
						<div class="b-content">
							<img src="img/icon-2.png" alt="">
							<p>Keeps in the best enviroment so that there is no harm and rotten issue produce.</p>
							<button type="button" class="r-more">Read More</button>
						</div>
					</div>

					<div class="box wow animate__animated animate__fadeInUp" data-wow-delay=".5s">
						<div class="b-content">
							<img src="img/icon-3.png" alt="">
							<p>Keeps safe from the insect that cause to destroy the food.</p>
							<button type="button" class="r-more">Read More</button>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	<div id="products">
		<div class="products">
			<section class="products">
				<div class="p-container">
					<div class="p-header wow animate__animated animate__fadeInUp" data-wow-delay=".1s">
						<h1>Our Products</h1>
						<p>These are our products that is available in our store you can check price!</p>
					</div>
				</div>
				<div class="container">
					<div class="container-inner">
						<div class="box pbox wow animate__animated animate__fadeInUp" data-wow-delay=".1s">
							<div class="p-content">
								<img src="img/product-1.jpg" alt="">
								<div class="product">
									<div class="new">New</div>
									<h2>Strawberries</h2>
									<p>Rs16.00 <span>Rs22.00</span></p>
									<button class="add-to-cart" data-product-name="Product 1" data-price="10">Add to Cart</button>
									<button type="button" class="p-btn add-card"><i class="fa fa-shopping-cart"></i> Shop
											Now</button>
									</div>
							</div>
						</div>

						<div class="box pbox wow animate__animated animate__fadeInUp" data-wow-delay=".3s">
							<div class="p-content">
								<img src="img/product-2.jpg" alt="">
								<div class="new">New</div>
								<h2>Cucumber</h2>
								<p>Rs18.00 <span>Rs28.00</span></p>
								<form action="CucumberShop.jsp">
								<button type="button" class="p-btn view-details"><i class="fa fa-eye"></i> View
									details</button>
								<button type="button" class="p-btn add-card"><i class="fa fa-shopping-cart"></i> Shop
									Now</button>
								</form>
							</div>
						</div>

						<div class="box pbox wow animate__animated animate__fadeInUp" data-wow-delay=".5s">
							<div class="p-content">
								<img src="img/product-3.jpg" alt="">
								<div class="new">New</div>
								<h2>Chillies</h2>
								<p>Rs10.00 <span>Rs20.00</span></p>
								<form action="ChilliesShop.jsp" method="post">
								<button type="button" class="p-btn view-details"><i class="fa fa-eye"></i> View
									details</button>
								<button type="submit" class="p-btn add-card"><i class="fa fa-shopping-cart"></i> Shop
									Now</button>
									</form>
							</div>
						</div>

						<div class="box pbox wow animate__animated animate__fadeInUp" data-wow-delay=".7s">
							<div class="p-content">
								<img src="img/product-4.jpg" alt="">
								<div class="new">New</div>
								<h2>Tomato</h2>
								<p>Rs36.00 <span>Rs42.00</span></p>
								<form action="TomatoShop.jsp" method="post">
								<button type="button" class="p-btn view-details"><i class="fa fa-eye"></i> View
									details</button>
								<button type="submit" class="p-btn add-card"><i class="fa fa-shopping-cart"></i> Shop
									Now</button>
									</form>
							</div>
						</div>

						<div class="box pbox wow animate__animated animate__fadeInUp" data-wow-delay=".1s">
							<div class="p-content">
								<img src="img/product-5.jpg" alt="">
								<div class="new">New</div>
								<h2>Pineapple</h2>
								<p>Rs160.00 <span>Rs220.00</span></p>
								<form action="PineappleShop.jsp">
								<button type="button" class="p-btn view-details"><i class="fa fa-eye"></i> View
									details</button>
								<button type="submit" class="p-btn add-card"><i class="fa fa-shopping-cart"></i> Shop
									Now</button>
									</form>
							</div>
						</div>

						<div class="box pbox wow animate__animated animate__fadeInUp" data-wow-delay=".3s">
							<div class="p-content">
								<img src="img/product-6.jpg" alt="">
								<div class="new">New</div>
								<h2>Fresh Fruit</h2>
								<p>Rs16.00 <span>Rs20.00</span></p>
								<form action="FreshShop.jsp">
								<button type="button" class="p-btn view-details"><i class="fa fa-eye"></i> View
									details</button>
								<button type="submit" class="p-btn add-card"><i class="fa fa-shopping-cart"></i> Shop
									Now</button>
								</form>
							</div>
						</div>

						<div class="box pbox wow animate__animated animate__fadeInUp" data-wow-delay=".5s">
							<div class="p-content">
								<img src="img/product-7.jpg" alt="">
								<div class="new">New</div>
								<h2>Potato</h2>
								<p>Rs19.00 <span>Rs22.00</span></p>
								<form action="PotatoShop.jsp">
								<button type="button" class="p-btn view-details"><i class="fa fa-eye"></i> View
									details</button>
								<button type="Submit" class="p-btn add-card"><i class="fa fa-shopping-cart"></i> Shop
									Now</button>
								</form>
							</div>
						</div>

						<div class="box pbox wow animate__animated animate__fadeInUp" data-wow-delay=".7s">
							<div class="p-content">
								<img src="img/product-8.jpg" alt="">
								<div class="new">New</div>
								<h2>Banana</h2>
								<p>Rs17.00 <span>Rs29.00</span></p>
								<form action="Shop.jsp" method="post">
									<button type="button" class="p-btn view-details"><i class="fa fa-eye"></i> View
										details</button>
									<button type="submit" class="p-btn add-card"><i class="fa fa-shopping-cart"></i>
										Shop Now</button>
								</form>
							</div>
						</div>
					</div>
				</div>
		</div>
		<div class="p-button wow animate__animated animate__fadeInUp" data-wow-delay=".1s">
			<button type="button" class="btn">Browse More Products</button>
		</div>
	</div>
	</section>



	<section class="call-to-action" style="background-image: url(img/bg-icon.png);">
		<div class="container">
			<div class="container-inner">
				<div class="box wow animate__animated animate__fadeIn" data-wow-delay=".2s">
					<h1>Visit Our Store</h1>
					<p>Experience the Small Basket's fruits and vegetables today! Simply add your favorite items to the
						cart and enjoy the convenience of doorstep delivery. Join us in promoting a healthier planet,
						one delicious bite at a time..</p>
				</div>
				<div class="box visit wow animate__animated animate__fadeIn" data-wow-delay=".2s">
					<button type="button" class="action-btn">Visit Now</button>
				</div>
			</div>
		</div>
	</section>



	<section class="testimonial" style="background-image: url(img/bg-icon.png);">
		<div class="p-container">
			<div class="p-header wow animate__animated animate__fadeInUp" data-wow-delay=".1s">
				<h1>Customer Review</h1>
				<p>Thsese are some best customer review that each customer has Experienced.</p>
			</div>
		</div>
		<div class="container">
			<div class="container-inner">
				<div class="owl-carousel owl-theme wow animate__animated animate__fadeInUp" data-wow-delay=".1s">
					<div class="box item">
						<div class="item-content">
							<i class="fa fa-quote-left fa-2x"></i>
							<p> I ordered fruits from this website and that was great experience thank you Small Basket
								!.</p>

							<div class="photo">
								<div class="img">
									<img src="img/testimonial-1.jpg" alt="">
								</div>
								<div class="photo-content">
									<h2> anandi</h2>
									<span>Teacher</span>
								</div>
							</div>
						</div>
					</div>

					<div class="box item">
						<div class="item-content">
							<i class="fa fa-quote-left fa-2x"></i>
							<p>Great experience ever i recommend everyone to buy fromt this site.</p>

							<div class="photo">
								<div class="img">
									<img src="img/testimonial-2.jpg" alt="">
								</div>
								<div class="photo-content">
									<h2>Rajat </h2>
									<span>Student</span>
								</div>
							</div>
						</div>
					</div>

					<div class="box item">
						<div class="item-content">
							<i class="fa fa-quote-left fa-2x"></i>
							<p>Level of quality is the best and i want to give an opinion plese increase the delivery
								timing.</p>

							<div class="photo">
								<div class="img">
									<img src="img/testimonial-3.jpg" alt="">
								</div>
								<div class="photo-content">
									<h2>Manish</h2>
									<span>journlist</span>
								</div>
							</div>
						</div>
					</div>

					<div class="box item">
						<div class="item-content">
							<i class="fa fa-quote-left fa-2x"></i>
							<p>Thank you Small Basket for providing me the best quality of vegitables.</p>

							<div class="photo">
								<div class="img">
									<img src="img/testimonial-4.jpg" alt="">
								</div>
								<div class="photo-content">
									<h2>Radha</h2>
									<span>Housewife</span>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
		<div class="btns wow animate__animated animate__fadeInUp" data-wow-delay=".4s">
			<div class="customNextBtn"><i class="fa fa-chevron-right"></i></div>
			<div class="customPreviousBtn"><i class="fa fa-chevron-left"></i></div>
		</div>
	</section>



	<section class="blog">
		<div class="p-container">
			<div class="p-header wow animate__animated animate__fadeInUp" data-wow-delay=".1s">
				<h1>Latest Blog</h1>
				<p>These are the some blogs about this site .</p>
			</div>
		</div>
		<div class="container">
			<div class="container-inner">
				<div class="box wow animate__animated animate__fadeInUp" data-wow-delay=".1s">
					<div class="p-content">
						<img src="img/blog-1.jpg" alt="">
						<h2>
							<a href="#">Sweet potatoes and other red or orange fruits and vegetables are typically high
								in vitamin A, </a>
						</h2>
						<div class="muted">
							<i class="fa fa-user"></i> <span>Admin</span>
							<i class="fa fa-calendar"></i> <span>15-Jul-2023</span>
						</div>
					</div>
				</div>

				<div class="box wow animate__animated animate__fadeInUp" data-wow-delay=".3s">
					<div class="p-content">
						<img src="img/blog-2.jpg" alt="">
						<h2>
							<a href="#">How to originatae fruits and vegetables in own firm</a>
						</h2>
						<div class="muted">
							<i class="fa fa-user"></i> <span>Admin</span>
							<i class="fa fa-calendar"></i> <span>15-Jul-2023</span>
						</div>
					</div>
				</div>

				<div class="box wow animate__animated animate__fadeInUp" data-wow-delay=".5s">
					<div class="p-content">
						<img src="img/blog-3.jpg" alt="">
						<h2>
							<a href="#">How to produce organic fruits and vegetables in own firm</a>
						</h2>
						<div class="muted">
							<i class="fa fa-user"></i> <span>Admin</span>
							<i class="fa fa-calendar"></i> <span>15-Jul-2023</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<div id="contact">
		<section class="footer wow animate__animated animate__fadeIn" data-wow-delay=".2s"
			style="background-image: url(img/bg-icon.png);">
			<div class="container">
				<div class="container-inner">
					<div class="box">
						<label for="" class="logo">Sma<span>ll</span>Basket</label>
						<p>This is the website where everyone can buy online vegitablesanf froots this will be best
							choice ever this webiste
							provide the best quality natural food.
						</p>
					</div>
					<div class="box">
						<h1>Address</h1>
						<div class="address">
							<i class="fa fa-location-arrow"></i> <a>802215 Sasaram, Rohtas, INDIA</a><br>
							<i class="fa fa-phone"></i> <a>6204922383</a><br>
							<i class="fa fa-envelope"></i> <a>MSDhoni@gmail.com</a>
						</div>
					</div>
					<div class="box">
						<h1>Quick Links</h1>
						<div class="links">
							<a href="#home"><i class="fa fa-chevron-right"></i> About Us</a>
							<a href="#about"><i class="fa fa-chevron-right"></i> Contact Us</a>
							<a href="#services"><i class="fa fa-chevron-right"></i> Our Services</a>
							<a href=""><i class="fa fa-chevron-right"></i> T & C Apply</a>
							<a href=""><i class="fa fa-chevron-right"></i> Support</a>
						</div>
					</div>
					<div class="box">
						<h1>Follow Us</h1>
						<div class="follow">
							<i class="fa fa-twitter"><a href="#"></a></i>
							<i class="fa fa-facebook"></i>
							<i class="fa fa-whatsapp"></i>
							<i class="fa fa-linkedin"></i><br>
							<button type="submit" class="signup" action="signup.html"><i class="fa fa-chevron-right"></i>SignUp</button>
						</div>
					</div>
					<div>

						<!-- <form action="https://formsubmit.co/adiunofficial0193@gmail.com" method="POST">
                      <label for="fname"></label>
                      <input type="text" id="fname" name="firstname" placeholder="Your name..">
                  
                      <label for="lname"></label>
                      <input type="email" id="lname" name="EMAIL" placeholder="Email..">
                  
                      <label for="country"></label>
                      <select id="country" name="country">
                        <option value="australia">PATNA</option>
                        <option value="canada">U.P</option>
                        <option value="usa">JHASRKHAND</option>
                      </select>
                      <textarea name="message" rows="5" cols="31" placeholder="message" required></textarea>
                    
                      <input type="submit" value="Submit">
                    </form> -->

					</div>
				</div>
			</div>

			<div class="copyright">
				<a href="#" class="sitename">
					<i class="fa fa-copyright"></i>
					Small Basket, <span>All Rights Reserved.</span>
				</a>
			</div>
		</section>
	</div>


	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.2/jquery.min.js"
		integrity="sha512-tWHlutFnuG0C6nQRlpvrEhE4QpkG1nn2MOUMWmUeRePl4e3Aki0VB6W1v3oLjFtd0hVOtRQ9PHpSfN6u6/QXkQ=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"
		integrity="sha512-XtmMtDEcNz2j7ekrtHvOVR4iwwaD6o/FUJe6+Zq+HgcCsk3kj4uSQQR8weQ2QVj1o0Pk6PwYLohm206ZzNfubg=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"
		integrity="sha512-bPs7Ae6pVvhOSiIcyUClR7/q2OAsRiovw4vAkX+zJbw3ShAeeqezq50RIIcIURq7Oa20rW2n2q+fyXBNcU9lrw=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.min.js"
		integrity="sha512-Eak/29OTpb36LLo2r47IpVzPBLXnAMPAVypbSZiZ4Qkf8p/7S/XRG5xp7OKWPPYfJT6metI+IORkR5G8F900+g=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>

	<!-- ============= js end ===================== -->
	<script type="text/javascript">
		$('.myslider').slick({
			infinite: true,
			speed: 1000,
			slidesToShow: 1,
			autoplay: true,
			autoplaySpeed: 4000,
			adaptiveHeight: false,
			fade: true,
			cssEase: 'linear',
		});

		// ========== Testimonial carousel start =======//
		$(document).ready(function () {
			var owl = $('.owl-carousel').owlCarousel({
				loop: true,
				margin: 22,
				nav: false,
				autoplay: true,
				autoplayTimeout: 4000,
				smartSpeed: 500,
				dots: false,
				responsive: {
					0: {
						items: 1
					},
					760: {
						items: 2
					},
					1100: {
						items: 3
					}
				}
			})
			// ======== custom button ======== //

			$('.customNextBtn').click(function () {
				owl.trigger('next.owl.carousel');
			});
			$('.customPreviousBtn').click(function () {
				owl.trigger('prev.owl.carousel');
			});

		});

		// wow js initialization //

		new WOW().init();
		
		
		
	</script>

</body>

</html>