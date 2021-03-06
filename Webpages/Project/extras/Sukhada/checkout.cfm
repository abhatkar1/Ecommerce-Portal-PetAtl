<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>DemoKart | Checkout</title>
    <!--<link href="images/favicon.ico" rel="SHORTCUT ICON" />-->
    <!--<link rel="stylesheet" href="css/font.css">-->
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/global.css">
	<CFQUERY NAME="ShippingAddress" DATASOURCE="UnivDB" DBTYPE="ODBC">
		SELECT a.STREET, a.CITY, a.STATE, a.ZIPCODE, ci.FIRSTNAME, ci.LASTNAME
		FROM ADDRESS2 a, CUSTOMERINFO ci  WHERE a.ADDRESSTYPE = 'Ship' AND ci.IDCUSTOMER = #URL.custId#
	</CFQUERY>
	<CFQUERY NAME="PaymentDetails" DATASOURCE="UnivDB" DBTYPE="ODBC">
	    SELECT SUBSTR(cardnumber, (length(cardnumber)-3), length(cardnumber)) as CardNumber FROM CreditCardInfo WHERE IDCUSTOMER = #URL.custId#
	</CFQUERY>
</head>

<body>
    <header>
        <div class="sub-header"><span><a href="user-profile.cfm">#FIRSTNAME# #LASTNAME#</a></span>Logout</div>
        <ul class="main-header clearfix">
            <li class="pull-left"><a href="#." class="main-logo white-text">DemoKart</a></li>
            <li><a href="#." class="orders white-text">Orders</a></li>
            <li><a href="#." class="cart white-text">Cart (0)</a></li>
        </ul>
    </header>
    <section>
        <h2>My Cart</h2>
        <ul class="order-id">
            <li>Order Date: <span>October 3, 2017</span></li>
            <li>Order Id: <span>054M6546K9857</span></li>
        </ul>
        <div class="order-details clearfix">
            <div class="shipping-address">
                <h4 class="bold-text">Shipping Address</h4>
				<CFOUTPUT query="ShippingAddress">
                <p>#FIRSTNAME# #LASTNAME#</p>
                <p>#STREET#</p>
                <p>#CITY# #STATE# #ZIPCODE#</p>
				<p>United State</p>
				</CFOUTPUT>
            </div>
            <div class="order-card-details">
                <h4 class="bold-text">Payment Method</h4>
				<CFOUTPUT query="PaymentDetails">
                <p>**** **** **** #CardNumber#</p>
				</CFOUTPUT>
            </div>
            <div class="gift-card-section">
                <h4 class="bold-text">Apply Gift Card</h4>
                <input type="text" class="form-control">
                <button type="button" class="btn btn-primary">Apply</button>
            </div>
            <div class="order-payment-summary">
                <h4 class="bold-text">Order Summary</h4>
                <p><span>Item(s) Subtotal:</span><span>$55.23</span></p>
                <p><span>Shipping &amp; Handling:</span><span>$5.00</span></p>
                <p><span>Free Shipping:</span><span>-$5.00</span></p>
                <p><span>Total before tax:</span><span>55.23</span></p>
                <p><span>Estimated tax to be collected:</span><span>$4.02</span></p>
                <hr />
                <p class="bold-text"><span>Grand Total:</span><span>$59.25</span></p>
            </div>
        </div>
        <div class="ordered-products">
            <div class="product-wrapper clearfix">
                <div class="image"><img src="images/10.png"></div>
                <div class="details">
                    <h3 class="name">DemoName</h3>
                    <h4 class="price">$9.99</h4>
                    <p class="decription">Demo demo demo demo demo demo demo demo demo demo demo demo demo demo demo demo demo demo demo demo demo
                        demo demo</p>
                </div>
                <div class="edit-section">
                    <label for="quantity">Quantity: </label> <input type="number" id="quantity" min="1" max="10" maxlength="2"
                        placeholder="Qty">
                    <button type="button" class="btn btn-secondary">Delete</button>
                </div>
            </div>
            <div class="product-wrapper clearfix">
                <div class="image"><img src="images/9.png"></div>
                <div class="details">
                    <h3 class="name">DemoName</h3>
                    <h4 class="price">$9.99</h4>
                    <p class="decription">Demo demo demo demo demo demo demo demo demo demo demo demo demo demo demo demo demo demo demo demo demo
                        demo demo</p>
                </div>
                <div class="edit-section">
                    <label for="quantity">Quantity: </label> <input type="number" id="quantity" min="1" max="10" maxlength="2"
                        placeholder="Qty">
                    <button type="button" class="btn btn-secondary">Delete</button>
                </div>
            </div>
            <div class="product-wrapper clearfix">
                <div class="image"><img src="images/3.png"></div>
                <div class="details">
                    <h3 class="name">DemoName</h3>
                    <h4 class="price">$9.99</h4>
                    <p class="decription">Demo demo demo demo demo demo demo demo demo demo demo demo demo demo demo demo demo demo demo demo demo
                        demo demo</p>
                </div>
                <div class="edit-section">
                    <label for="quantity">Quantity: </label> <input type="number" id="quantity" min="1" max="10" maxlength="2"
                        placeholder="Qty">
                    <button type="button" class="btn btn-secondary">Delete</button>
                </div>
            </div>
        </div>
        <div class="button-wrapper clearfix">
            <button type="button" class="btn btn-primary pull-right">Place Order</button>
        </div>
    </section>
    <footer>
        <p class="copyright-text">Copyright 2017 demokart.com</p>
    </footer>
</body>

</html>