<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrationForm.aspx.cs" Inherits="FormUsingAjax.RegistrationForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
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
                    data: "{'firstname':'" + firstname + "','lastname':'" + lastname + "','email':'" + email + "','phone':'" + phone + "','gender':'" + gender + "'}",
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
    </style>
    </head>
<body>
<form id="form1" runat="server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style2">FirstName</td>
            <td>
                <asp:TextBox ID="txtFirst" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">LastName</td>
            <td class="auto-style4">
                <asp:TextBox ID="TxtLast" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Email</td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Phone</td>
            <td>
                <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Gender</td>
            <td>
                <asp:TextBox ID="txtGender" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td>
                <asp:Button ID="btnSubmit" runat="server" Text="Button" />
            </td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</form>
    </body>
</html>
