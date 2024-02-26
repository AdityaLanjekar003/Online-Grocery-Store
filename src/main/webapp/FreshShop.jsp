<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        @import url(https://fonts.googleapis.com/css?family=Open+Sans:400italic,400,300,600);

        * {
            margin:0;
            padding:0;
            box-sizing:border-box;
            -webkit-box-sizing:border-box;
            -moz-box-sizing:border-box;
            -webkit-font-smoothing:antialiased;
            -moz-font-smoothing:antialiased;
            -o-font-smoothing:antialiased;
            font-smoothing:antialiased;
            text-rendering:optimizeLegibility;
        }

        body {
            font-family:"Open Sans", Helvetica, Arial, sans-serif;
            font-weight:300;
            font-size: 12px;
            line-height:30px;
            color:#777;
            background:url('img/slider3.png') no-repeat center center fixed;
            background-size: cover;
        }

        .container {
            max-width:400px;
            width:100%;
            margin:0 auto;
            position:relative;
        }

        #contact input[type="text"], #contact input[type="email"], #contact input[type="tel"], #contact input[type="url"], #contact textarea, #contact button[type="submit"] { font:400 12px/16px "Open Sans", Helvetica, Arial, sans-serif; }

        #contact {
            background:rgba(255,255,255,0.8);
            padding:25px;
            margin:50px 0;
            border-radius: 10px;
        }

        #contact h3 {
            color: #F96;
            display: block;
            font-size: 30px;
            font-weight: 400;
        }

        #contact h4 {
            margin:5px 0 15px;
            display:block;
            font-size:13px;
        }

        fieldset {
            border: medium none !important;
            margin: 0 0 10px;
            min-width: 100%;
            padding: 0;
            width: 100%;
        }

        #contact input[type="text"], #contact input[type="email"], #contact input[type="tel"], #contact input[type="url"], #contact textarea {
            width:100%;
            border:1px solid #CCC;
            background:#FFF;
            margin:0 0 5px;
            padding:10px;
        }

        #contact input[type="text"]:hover, #contact input[type="email"]:hover, #contact input[type="tel"]:hover, #contact input[type="url"]:hover, #contact textarea:hover {
            transition:border-color 0.3s ease-in-out;
            border:1px solid #AAA;
        }

        #contact textarea {
            height:100px;
            max-width:100%;
            resize:none;
        }

        #contact button[type="submit"] {
            cursor:pointer;
            width:100%;
            border:none;
            background:#0CF;
            color:#FFF;
            margin:0 0 5px;
            padding:10px;
            font-size:15px;
            border-radius: 5px;
        }

        #contact button[type="submit"]:hover {
            background:#09C;
            transition:background 0.3s ease-in-out;
        }

        #contact button[type="submit"]:active {
            box-shadow:inset 0 1px 3px rgba(0, 0, 0, 0.5);
        }

        #contact input:focus, #contact textarea:focus {
            outline:0;
            border:1px solid #999;
        }

        ::-webkit-input-placeholder {
            color:#888;
        }
        :-moz-placeholder {
            color:#888;
        }
        ::-moz-placeholder {
            color:#888;
        }
        :-ms-input-placeholder {
            color:#888;
        }
        .hidden
        {
            color: red;
        }
    </style>
</head>
<body>
    <div class="container">  
        <form id="contact" action="Fresh.jsp" method="post">
          <h3>FILL UP THE DETAILS</h3>
          <h4>We will deliver your product in 2 hours....</h4>
          <fieldset>
            <input placeholder="Your name" type="text" tabindex="1" name="name" id="name" required autofocus>
          </fieldset>
           
          <fieldset>
            <input placeholder="Your Email Address" type="email" tabindex="3"  required>
          </fieldset>
          <fieldset>
            <input placeholder="Your Phone Number" type="tel" tabindex="4" name="phone" id="phone" required>
          </fieldset>
          <fieldset>
            <input placeholder="Enter the Quantity in (KG's)" type="text" tabindex="5" name="Quantity" id="Quantity" required>
          </fieldset>
          <fieldset>
            <textarea placeholder="Enter Your Residential Address" tabindex="6" required></textarea>
          </fieldset>
          <fieldset>
            <input type="radio" required>&nbsp;&nbsp;I have read and agree to the terms of service.
          </fieldset>
          <div class="hidden">
          <fieldset>
            <input type="hidden">&nbsp;&nbsp;*Only Cash On delivery is now available
          </fieldset>
        </div>
          <fieldset>
            <button name="submit" type="submit" id="contact-submit" data-submit="...Sending">Submit</button>
          </fieldset>
          
        </form>
        
      </div>
</body>
</html>
