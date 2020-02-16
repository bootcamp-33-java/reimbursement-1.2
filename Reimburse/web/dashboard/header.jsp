
<style>
    .sidebar {
        height: 100%;
        width: 0;
        position: fixed;
        z-index: 1;
        top: 10px;
        left: 0;
        background:#333333;
        overflow-x: hidden;
        transition: 0.5s;
        padding-top: 60px;
    }

    .sidebar a {
        padding: 8px 8px 8px 32px;
        text-decoration: none;
        font-size: 20px;
        font-family: Candara;
        color: #818181;
        display: block;
        transition: 0.3s;
    }

    .sidebar a:hover {
        color: #f1f1f1;
    }



    .openbtn {
        font-size: 20px;
        cursor: pointer;
        background-color: #140114;
        color: white;
        padding: 0px 15px 0px 10px;
        border: none;
    }

    .openbtn:hover {
        background-color: #444;
    }
   


    #main {
        transition: margin-left .5s;
        padding: 16px;
    }

    /* On smaller screens, where height is less than 450px, change the style of the sidenav (less padding and a smaller font size) */
    @media screen and (max-height: 450px) {
        .sidebar {padding-top: 15px;}
        .sidebar a {font-size: 18px;}
    }

</style>
<div id="mySidebar" class="sidebar">
    <!--<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">×</a>-->
    <a href="#">Employee</a>
    <a href="#">Account</a>
    <a href="#">Job</a>
    <a href="#">Region</a>
    <a href="#">Department</a>
    <a href="#">Location</a>
    <a href="#">Country</a>

</div>
<div style="margin-bottom: 90px"></div>
<nav class="navbar navbar-expand-sm navbar-dark fixed-top " style="background: #140114" >
    <button class="openbtn myBtn" id="myBtn"> <span class="navbar-toggler-icon"></span></button>
    <a class="navbar-brand" href="#" style="font-family: futura md bt">CRUD</a>
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" href="#">Employee</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">Account</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">Job</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="region.jsp">Region</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">Department</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">Location</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">Country</a>
        </li>
    </ul>
</nav>


<script>
    document.getElementById("myBtn").addEventListener("click", toggleNav);
    function toggleNav() {
        navSize = document.getElementById("mySidebar").style.width;
        if (navSize === "250px") {
            return close();
        }
        return open();
    }

    function open() {
        document.getElementById("mySidebar").style.width = "250px";
        document.getElementById("main").style.marginRigth = "250px";
    }

    function close() {
        document.getElementById("mySidebar").style.width = "0";
        document.getElementById("main").style.marginRigth = "0";
    }
</script>


