<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplicationOrderProcess.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Вход в систему</title>
      <link rel="stylesheet" href="StyleSheet1.css"/>

</head>
<body id="login">
    <form id="form1" runat="server">
       
             <h2> Вход в систему</h2>
            <asp:Panel ID="loginPanel" runat="server">
               
                            <asp:TextBox class ="LoginTextField" ID="UsernameText" runat="server" placeholder="Имя пользователя" />
                            <asp:RequiredFieldValidator ID="UsernameRequiredValidator" runat="server"
                                ErrorMessage="*" ControlToValidate="UsernameText" />
                            <br />
                            <asp:RegularExpressionValidator
                                ID="UsernameValidator" runat="server"
                                ControlToValidate="UsernameText"
                                ErrorMessage="* Некорректное имя пользователя"
                                ValidationExpression="[\w| ]*"/>
                  
                            <asp:TextBox class="LoginTextField" ID="PasswordText" runat="server" TextMode="Password" placeholder="Пароль" />
                            <asp:RequiredFieldValidator ID="PwdRequiredValidator"
                                runat="server" ErrorMessage="*" ControlToValidate="PasswordText" Display="Dynamic" />
                            <br />
                            <asp:RegularExpressionValidator ID="PwdValidator"
                                runat="server" ControlToValidate="PasswordText"
                                ErrorMessage="* Некорректный пароль"
                                ValidationExpression='[\w| !"§$%&amp;/()=\-?\*]*'/>
                   <br />
                   <br />
                <asp:Button ID="LoginAction" runat="server" OnClick="LoginAction_Click" Text="Войти" /><br />
                <asp:Label ID="LegendStatus" runat="server" EnableViewState="false" Text="" />
            </asp:Panel>
        
    </form>
</body>
</html>


