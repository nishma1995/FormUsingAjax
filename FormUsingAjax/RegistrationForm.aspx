<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrationForm.aspx.cs" Inherits="FormUsingAjax.RegistrationForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var email = document.getElementById("txtEmail");
            document.getElementById("txtEmail").onblur = function () {
                checkEmailAvailability()

            };
            function checkEmailAvailability() {
                $.ajax({
                    type: "POST",
                    contentType: "application/json",
                    url: "RegistrationForm.aspx/CheckEmail",
                    data: "{email:'" + email.value + "'}",
                    dataType: "json",
                    success: function (AjaxResponse) {
                        //document.getElementById("Label1").innerHTML = AjaxResponse.d;
                        alert(AjaxResponse.d);
                    },
                    error: function (error) {
                        alert("error");
                    }
                });
            }

            $("#btnSubmit").click(function () {
                var firstname = document.getElementById("txtFirst");
                var lastname = document.getElementById("TxtLast");
                var email = document.getElementById("txtEmail");
                var phone = document.getElementById("txtPhone");
                var gender = document.getElementById("txtGender");
                if (firstname.value== "" || lastname.value == "" || phone.value == "" || email.value == "") {
                    alert("please enter all fields");
                }
                
                $.ajax({
                    type: "POST",
                    contentType: "application/json",
                    url: "RegistrationForm.aspx/SaveData",
                    data: "{'firstname':'" + firstname.value + "','lastname':'" + lastname.value + "','email':'" + email.value + "','phone':'" + phone.value + "','gender':'" + gender.value + "'}",
                   dataType: "json",
                   success: function (data) {
                       //Show_data();
                       alert("submit successfully");
                      // ClearField()
                    },
                   error: function (error) {
                       alert("error");
                       //console.log(JSON.stringify(error));
                    }
               });
            });
            

        });
    </script>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 398px;
        }
        .auto-style3 {
            width: 398px;
            height: 26px;
        }
        .auto-style4 {
            height: 26px;
        }
        .auto-style5 {
            margin-left: 760px;
        }
        .container{
            margin-left:450px;
            margin-top:100px;
            align-content:center;
            padding:100px;
           background-color:mistyrose;
            padding-left:200px;
             border-radius:10px;
             box-shadow:0px 0px 10px 0px #000;
             width:20%;
             height:50%;


        }
    </style>
    </head>
<body>
<form id="form1" runat="server">
    <div class="container">
    <table class="auto-style1">
        <tr>
            <td class="auto-style2">FirstName</td>
            </tr>
        <tr>
            <td class="auto-style5">
                <asp:TextBox ID="txtFirst" runat="server" OnTextChanged="txtFirst_TextChanged"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">LastName</td>
            </tr>
        <tr>
            <td class="auto-style4">
                <asp:TextBox ID="TxtLast" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Email</td>
            </tr>
        <tr>
            <td>
                <asp:TextBox ID="txtEmail" runat="server" onblur="checkEmailAvailability();"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Phone</td>
            </tr>
        <tr>
            <td>
                <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Gender</td>
            </tr>
        <tr>
            <td>
                <asp:TextBox ID="txtGender" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Button ID="btnSubmit" runat="server" Text="Button" OnClick="btnSubmit_Click" Width="168px" />
            </td>
            <td>
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
        </div>
</form>
    </body>
</html>
<%--<script>--%>
<%--    var email = document.getElementById("txtEmail");
    document.getElementById("txtEmail").onblur = function () {
        checkEmailAvailability()

    };
    function checkEmailAvailability() {
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "RegistrationForm.aspx/CheckEmail",
            data: "{email:'" + email.value + "'}",
            dataType: "json",
            success: function (AjaxResponse) {
                document.getElementById("Label1").innerHTML = AjaxResponse.d;
                alert("submit successfully");
            },
            error: function (error) {
                alert("error");
            }
        });
    }

    
</script>--%>
