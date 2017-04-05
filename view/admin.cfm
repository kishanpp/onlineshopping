<link href="../assets/css/admin.css" rel="stylesheet">
<cfinclude template="headertemplate.cfm">
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