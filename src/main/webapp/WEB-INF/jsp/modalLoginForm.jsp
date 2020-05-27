<!--Modal: Login / Register Form-->
<div class="modal fade" id="modalLRForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog cascading-modal" role="document">
        <!--Content-->
        <div class="modal-content">

            <!--Modal cascading tabs-->
            <div class="modal-c-tabs">

                <!-- Nav tabs -->
                <ul class="nav nav-tabs md-tabs tabs-2 light-blue darken-3" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active btn btn-sm " data-toggle="tab" href="#panel7" role="tab"><i class="fas fa-user mr-1"></i>
                            Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link btn btn-sm " data-toggle="tab" href="#panel8" role="tab"><i class="fas fa-user-plus mr-1"></i>
                            Register</a>
                    </li>
                </ul>

                <!-- Tab panels -->
                <div class="tab-content">
                    <!--Panel 7-->
                    <div class="tab-pane fade in show active" id="panel7" role="tabpanel"></br>

                        <!--Body-->
                        <div class="container-fluid"> 
                            <form>
                                <div class="form-group">
                                    <label for="Username">Username</label>
                                    <input  class="form-control" type="text" id="username"  name="username" >

                                </div>
                                <div class="form-group">
                                    <label for="Password">Password</label>
                                    <input  class="form-control" type="password" id="password"  name="password" >
                                </div>
                                <div class="text-center navbar-buttons mbr-section-btn"> ">
                                    <button type="submit" id="login" class="btn btn-sm btn-primary display-4">Login</button>
                                    <div id="generalErrorMessage" class="error-lbl" style="display:none;"></div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!--/.Panel 7-->

                    <!--Panel 8-->
                    <div class="tab-pane fade" id="panel8" role="tabpanel"> <br>

                        <!--Body-->

                        <div class="container-fluid">

                            <form>
                                <div class="form-group">
                                    <label for="userName">Fisrt Name</label>
                                    <input  class="form-control" type="text" id="userName_reg"  name="userName" >

                                </div>
                                <div class="form-group">
                                    <label for="userName">Last Name</label>
                                    <input  class="form-control" type="text" id="userSurname_reg"  name="userSurname" >

                                </div>


                                <div class="form-group">
                                    <label for="userEmail">E-mail</label>
                                    <input  class="form-control" type="text" id="userEmail_reg"  name="userEmail" >

                                </div>

                                <div class="form-group">
                                    <label for="userUsername">Username</label>
                                    <input  class="form-control" type="text" id="userUsername_reg"  name="userUsername" >

                                </div>

                                <div class="form-group">
                                    <label for="userPassword1">Password</label>
                                    <input  class="form-control" type="password" id="userPassword1_reg"  name="userPassword1" >
                                </div>

                                <div class="form-group">
                                    <label for="userPassword2">Re-type Password</label>
                                    <input  class="form-control" type="password" id="userPassword2_reg"  name="userPassword2" >
                                </div>

                                <div class="text-center navbar-buttons mbr-section-btn"> ">
                                    <button type="submit" id="register" class="btn btn-sm btn-primary display-4">Register</button>
                                    <div id="generalErrorMessage" class="error-lbl" style="display:none;"></div>
                                </div>
                            </form>




                            <%--  <form:form method="POST" action="/addUser" modelAttribute="newUser">
                                  
                                  
                              </form:form>--%>



                        </div>


                    </div>
                    <!--Footer-->
                    <!--                        <div class="modal-footer">
                                                <div class="options text-right">
                                                    <p class="pt-1">Already have an account? <a href="#" class="blue-text">Log In</a></p>
                                                </div>
                                                <button type="button" class="btn btn-outline-info waves-effect ml-auto" data-dismiss="modal">Close</button>
                                            </div>-->
                </div>
                <!--/.Panel 8-->
            </div>

        </div>
    </div>
    <!--/.Content-->
</div>

</div>

<script type="text/javascript">
    $(document).ready(function () {

        clearError();

        $('#login').click(function (event) {

            event.preventDefault();

            var data = {}
            data["username"] = $("#username").val();
            data["password"] = $("#password").val();

//		var USERNAME = $("#username").val();
// 		var PASSWORD = $("#password").val();


//		alert(USERNAME);

//               alert(PASSWORD);

            $.ajax({

                type: "POST",
                contentType: "application/json",
                url: "ModalLogin",
                data: JSON.stringify(data),
                dataType: 'json',
//			data : "username=" + USERNAME + "&password=" + PASSWORD,
                success: function (response) {

                    if (response.status == 'FAIL') {
                        showFormError(response.errorMessageList);
                    } else {
                        //everything is O.K. user logged in successfully.
                        $('#modalLRForm').modal('hide');
                        
                        window.location.replace("main");
//                        window.location.reload();
                        
                    }
                },
                error: function (ex) {
                    console.log(ex);
                }
            });
        });

        $('#register').click(function (event) {

            event.preventDefault();

            var data = {}
            data["userNameRegisterForm"] = $("#userName_reg").val();
            data["userSurname"] = $("#userSurname_reg").val();
            data["userEmail"] = $("#userEmail_reg").val();
            data["userUsername"] = $("#userUsername_reg").val();
            data["userPassword1"] = $("#userPassword1_reg").val();
            data["userPassword2"] = $("#userPassword2_reg").val();


//		var USERNAME = $("#username").val();
// 		var PASSWORD = $("#password").val();


//		alert(USERNAME);

//               alert(PASSWORD);

            $.ajax({

                type: "POST",
                contentType: "application/json",
                url: "addUser",
                data: JSON.stringify(data),
                dataType: 'json',

                success: function (response) {

                    if (response.status == 'FAIL') {
                        showFormError(response.errorMessageList);
                    } else {
                        //everything is O.K. user logged in successfully.
                        $('#modalLRForm').modal('hide');
//                        $('.alert').alert();
                        window.location.reload();
                    }
                },
                error: function (ex) {
                    console.log(ex);
                }
            });
        });

        // for tab login
        var PasswordField = $('#password');
        var UsernameField = $('#username');

        //for tab register
        var userName_reg = $("#userName_reg");
        var userSurname_reg = $("#userSurname_reg");
        var userEmail_reg = $("#userEmail_reg");
        var userUsername_reg = $("#userUsername_reg");
        var userPassword1_reg = $("#userPassword1_reg");
        var userPassword2_reg = $("#userPassword2_reg");

        var GeneralErrorField = $('#generalErrorMessage');

        function showFormError(errorVal) {
            //show error messages that comming from backend and change border to red.
            for (var i = 0; i < errorVal.length; i++) {
                if (errorVal[i].fieldName === 'username') {
                    clearForm();
                    UsernameField.attr("placeholder", errorVal[i].message).css("border", " 1px solid red");
                } else if (errorVal[i].fieldName === 'password') {
                    PasswordField.val('');
                    PasswordField.attr("placeholder", errorVal[i].message).css("border", " 1px solid red");
                  }  
                  
                   else if (errorVal[i].fieldName === 'userNameRegisterForm') {
                    userName_reg.val('');
                    userName_reg.attr("placeholder", errorVal[i].message).css("border", " 1px solid red");
                  } 
                   else if (errorVal[i].fieldName === 'userSurname') {
                    userSurname_reg.val('');
                    userSurname_reg.attr("placeholder", errorVal[i].message).css("border", " 1px solid red");
                  } 
                   else if (errorVal[i].fieldName === 'userEmail') {
                    userEmail_reg.val('');
                    userEmail_reg.attr("placeholder", errorVal[i].message).css("border", " 1px solid red");
                  } 
                   else if (errorVal[i].fieldName === 'userUsername') {
                    userUsername_reg.val('');
                    userUsername_reg.attr("placeholder", errorVal[i].message).css("border", " 1px solid red");
                  } 
                   else if (errorVal[i].fieldName === 'userPassword1') {
                    userPassword1_reg.val('');
                    userPassword1_reg.attr("placeholder", errorVal[i].message).css("border", " 1px solid red");
                  } 
                   else if (errorVal[i].fieldName === 'userPassword2') {
                    userPassword2_reg.val('');
                    userPassword2_reg.attr("placeholder", errorVal[i].message).css("border", " 1px solid red");
                  } 
                    
                    
                    
                    
                 else if (errorVal[i].fieldName === 'FORM FAIL') {
                    clearForm();
                    GeneralErrorField.css("display", "block").html(errorVal[i].message);
                }
            }
        }
        //remove error warning tags and change tips
        function clearError() {
            //clear all and return it as default.
            $('#username').focus(function () {
                clearForm();
                UsernameField.css("border", "1px solid lightgrey");
                UsernameField.attr("placeholder", "Username");
            });
            $('#password').focus(function () {
                PasswordField.val('');
                PasswordField.css("border", "1px solid lightgrey");
                PasswordField.attr("placeholder", "Password");
            });
        }
        //clear fields and hide error tag.
        function clearForm() {
            UsernameField.val('');
            PasswordField.val('');
            GeneralErrorField.css("display", "none");
        }

    });
</script>

