<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="pack.Dbconn"%>
<!DOCTYPE html>
	<html lang="en">
		<head>
			<meta charset="utf-8">
			<meta http-equiv="X-UA-Compatible" content="IE=edge">
			<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
			<meta name="description" content="A Bootstrap based app landing page template">
			<meta name="author" content="">
			<link rel="shortcut icon" href="assets/ico/favicon.ico">

			<title>Micro_payment</title>

			<!-- Bootstrap core CSS -->
			<link href="css/bootstrap.min.css" rel="stylesheet">

			<!-- Custom styles for this template -->
			<link href="css/custom.css" rel="stylesheet">
			<link href="css/flexslider.css" rel="stylesheet">
			
			<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
			<link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,300,700' rel='stylesheet' type='text/css'>
			<link href='http://fonts.googleapis.com/css?family=Noto+Sans:400,700' rel='stylesheet' type='text/css'>

			<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
			<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
			<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
			<![endif]-->
		</head>

		<body>
                      <%
            if (request.getParameter("msg") != null) {%>
        <script>alert('transaction done Successfully');</script>
        <%}
            
            
            %>
           <%
                    String name,b;
                    HttpSession session2 = request.getSession(true);
                    name = (String) session2.getAttribute("bank");
b = (String) session2.getAttribute("name");
                    %>
                   
                    
            
                    %>
			<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
				<div class="container-fluid">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
<!--						<a class="navbar-brand" href="#topWrap">
							<span class="fa-stack fa-lg">
								<i class="fa fa-circle fa-stack-2x"></i>
								<i class="fa fa-mobile fa-stack-1x fa-inverse"></i>							</span>
							App<span class="title">Bay</span>
						</a>-->
					</div>
					<div class="collapse navbar-collapse appiNav">
						<ul class="nav navbar-nav">
						<li><a href="userh.jsp">View User</a></li>
                                                        <li><a href="deposit.jsp">Deposit</a></li>
                                                         <li><a href="withdrawal.jsp">Withdrawal </a></li>
                                                         <li><a href="duser.jsp">Deposit details</a></li>
                                                         <li><a href="wuser.jsp">Withdrawal details</a></li>
                                                        <li><a href="user.jsp">Logout</a></li>
                                                </ul>
					</div><!--/.nav-collapse -->
				</div>
                        </div>
                     
                        <div id="topWrap" class="jumbotron">
			<div class="container-fluid">
				<div class="col-md-6 col-md-push-6 jumboText">
				 <%
                        
                        Connection con = Dbconn.getConnection();

                        System.out.println("Database connected");

                        Statement st = con.createStatement();
                        ResultSet rt = st.executeQuery("select *from withdrawals where bname='"+name+"' AND name='"+b+"' ");
                        

   %>
      <div class="htext">
    <h2>Withdrawal details</h2>
                        <table style="border-style: solid;border-collapse: collapse" border="5">
                            <tr style="background-color: burlywood">
                                <td align="center" width="5%">NAME</td><br><td>CARD NO</td><br><td>BANK NAME</td><td>WITHDRAWAL</td><td>STATUS</td>
                            </tr>
                            <%                  while (rt.next()) {
                                    String uname = rt.getString("name");
                                   
                                    String acno = rt.getString("acno");
                                    String bname = rt.getString("bname");
                                    
                                    String deposit = rt.getString("withdrawal");
                                    String status = rt.getString("status");


                            %>
                            <tr>
                                <td><%=uname%></td><td><%=acno%></td><td><%=bname%></td><td><%=deposit%></td><td><%=status%></td>
                                
                            
                            </tr>
                            <%
                                }
                                con.close();
                            %>
                        </table>

      </div>
                                    
                                </div>
				<div class="col-md-6 col-md-pull-6 hidden-xs">
					<div class="mobile">
						<div class="mobileSlider">
							<ul class="slides">
								<li>
									<img src="assets/img/details2.jpg"/>
								</li>
								
							</ul>
						</div>
					</div>
				</div>
				
			</div>
			</div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/flexslider.js"></script>
	
<script type="text/javascript">
$(document).ready(function() {

	$('.mobileSlider').flexslider({
		animation: "slide",
		slideshowSpeed: 3000,
		controlNav: false,
		directionNav: true,
		prevText: "&#171;",
		nextText: "&#187;"
	});
	$('.flexslider').flexslider({
		animation: "slide",
		directionNav: false
	});
		
	$('a[href*=#]:not([href=#])').click(function() {
		if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') || location.hostname == this.hostname) {
			var target = $(this.hash);
			target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
			if ($(window).width() < 768) {
				if (target.length) {
					$('html,body').animate({
						scrollTop: target.offset().top - $('.navbar-header').outerHeight(true) + 1
					}, 1000);
					return false;
				}
			}
			else {
				if (target.length) {
					$('html,body').animate({
						scrollTop: target.offset().top - $('.navbar').outerHeight(true) + 1
					}, 1000);
					return false;
				}
			}

		}
	});
	
	$('#toTop').click(function() {
		$('html,body').animate({
			scrollTop: 0
		}, 1000);
	});
	
	var timer;
    $(window).bind('scroll',function () {
        clearTimeout(timer);
        timer = setTimeout( refresh , 50 );
    });
    var refresh = function () {
		if ($(window).scrollTop()>100) {
			$(".tagline").fadeTo( "slow", 0 );
		}
		else {
			$(".tagline").fadeTo( "slow", 1 );
		}
    };
		
});
</script>
  </body>
</html>
