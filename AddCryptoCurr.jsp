<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="pack.Dbconn"%>
<%@page import="pack.AESEncryption"%>
<%@page import="javax.crypto.SecretKey"%>

<!DOCTYPE html>
<html lang="en">
		<head>
			<meta charset="utf-8">
			<meta http-equiv="X-UA-Compatible" content="IE=edge">
			<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
			<meta name="description" content="A Bootstrap based app landing page template">
			<meta name="author" content="">
			<link rel="shortcut icon" href="assets/ico/favicon.ico">

			<title>Micro Payment</title>

			<!-- Bootstrap core CSS -->
			<link href="css/bootstrap.min.css" rel="stylesheet">

			<!-- Custom styles for this template -->
			<link href="css/custom.css" rel="stylesheet">
			<link href="css/flexslider.css" rel="stylesheet">
			
			<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
			<link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,300,700' rel='stylesheet' type='text/css'>
			<link href='http://fonts.googleapis.com/css?family=Noto+Sans:400,700' rel='stylesheet' type='text/css'>
			
		</head>

		<body>
           
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
							<li><a href="vuser.jsp">Vendor Details</a></li>
														<li><a href="AddCryptoCurr.jsp">Add Crypto Code</a></li>
                                                        <li><a href="ddetails.jsp">Deposit details</a></li>
                                                        <li><a href="vendor.jsp">Logout</a></li>
						</ul>
					</div><!--/.nav-collapse -->
				</div>
			</div>
                    
			<div id="topWrap" class="jumbotron">
			<div class="container-fluid">
				<div class="col-md-6 col-md-push-6 jumboText">
					<h2>Transaction</h2>
                                        <form style="color:black;"action="AddCryptoCurr.jsp?flag=1" method="post">
                    <label style="font-size: 20px;color:black;">Enter crypto currency code:&nbsp;</label><input type="text" class="textbox" placeholder="" required style="margin-left:" name="cryptocurr"/><br /><br />
                     
                    <centre> <input type="submit" class="btn btn-info" style="margin-left: 150px" value="Add Crypto Currency"/></centre>
                    </form>
                                 </div>
				<div class="col-md-6 col-md-pull-6 hidden-xs">
					<div class="mobile">
						<div class="mobileSlider">
							<ul class="slides">
								<li>
									<img src="assets/img/screen1.jpg"/>
								</li>
								<li>
									<img src="assets/img/screen2.jpg"/>
								</li>
							</ul>
						</div>
					</div>
				</div>
<%
String CCode=request.getParameter("cryptocurr"); 
int i=0;
  Connection con=Dbconn.getConnection();
  Statement st=con.createStatement();
         i=st.executeUpdate("UPDATE transaction SET flag=1 WHERE crypto='"+CCode+"'");
%>
			</div>
			</div>
