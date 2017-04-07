<!--- 
filename 		: admin.cfm
function 		: This file display option to perform by the admin.
date created 	: ‎Friday, ‎03 ‎March, ‎2017, ‏‎2:10:49 PM

--->
<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<link href="../assets/css/admin.css" rel="stylesheet">
	<cfinclude template="headertemplate.cfm">
</head>
<body>
	<cfset SESSION.admin = FALSE />
	<div class="dropdown">
		<button class="dropbtn">Dropdown</button>
		<div class="dropdown-content">
			<a href="additem.cfm">Add Items</a>
			<a href="updateitem.cfm">Update Items</a>
			<a href="deleteitem.cfm">Delete Items</a>
		</div>
	</div>
	<script src="../assets/js/admin.js"></script>
</body>
</html>