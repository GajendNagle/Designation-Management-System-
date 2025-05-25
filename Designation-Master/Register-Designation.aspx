<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register-Designation.aspx.cs" Inherits="Designation_Master_Register_Designation" %>

<!DOCTYPE html>
<html lang="en">

<!------ Include the above in your HEAD tag ---------->

<head>
    <title></title>
    <style>
        label {
            font-weight: 600;
            color: #666;
        }

        body {
            background: #f1f1f1;
        }

        .box8 {
            box-shadow: 0px 0px 5px 1px #999;
        }

        .mx-t3 {
            margin-top: -3rem;
        }
    </style>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css" />

</head>
<body>
    <div class="container mt-3">
        <form id="form1" runat="server">
            <div class="row jumbotron box8">
                <div class="col-sm-12 mx-t3 mb-4">
                    <h2 class="text-center text-info">New Designation</h2>
                </div>
                
                <!-- College Selection -->
                <div class="col-sm-12 col-md-4 form-group">
                    <label for="ddlCollege">College</label>
                    <asp:DropDownList ID="ddlCollege" runat="server" CssClass="form-control">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvCollege"  ValidationGroup="RegBtnValid"  runat="server" ControlToValidate="ddlCollege"
                        ErrorMessage="College is required" CssClass="text-danger" InitialValue="0"></asp:RequiredFieldValidator>
                </div>
                
                <!-- Designation Code -->
                <div class="col-sm-12 col-md-4 form-group">
                    <label for="txtDesignationCode">Designation Code</label>
                    <asp:TextBox ID="txtDesignationCode" runat="server" CssClass="form-control" 
                        placeholder="Enter designation code"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvDesignationCode" runat="server" ControlToValidate="txtDesignationCode"
                        ErrorMessage="Designation code is required"  ValidationGroup="RegBtnValid"  CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>
                
                <!-- Designation Acronym -->
                <div class="col-sm-12 col-md-4 form-group">
                    <label for="txtDesignationAcronym">Designation Acronym</label>
                    <asp:TextBox ID="txtDesignationAcronym" runat="server" CssClass="form-control" 
                        placeholder="Enter designation acronym"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvDesignationAcronym" runat="server" ControlToValidate="txtDesignationAcronym"
                        ErrorMessage="Designation acronym is required"  ValidationGroup="RegBtnValid"  CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>
                
                <!-- Designation Name -->
                <div class="col-sm-12 col-md-4 form-group">
                    <label for="txtDesignationName">Designation Name</label>
                    <asp:TextBox ID="txtDesignationName" runat="server" CssClass="form-control" 
                        placeholder="Enter full designation name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvDesignationName" runat="server" ControlToValidate="txtDesignationName"
                        ErrorMessage="Designation name is required" CssClass="text-danger"  ValidationGroup="RegBtnValid" ></asp:RequiredFieldValidator>
                </div>
                
                <!-- Stream Selection -->
                <div class="col-sm-12 col-md-4 form-group">
                    <label for="ddlStream">Stream</label>
                    <asp:DropDownList ID="ddlStream" runat="server" CssClass="form-control">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvStream" runat="server" ControlToValidate="ddlStream"
                        ErrorMessage="Stream is required" CssClass="text-danger"  ValidationGroup="RegBtnValid"  InitialValue="0"></asp:RequiredFieldValidator>
                </div>
                
                <!-- Role & Responsibilities -->
                <div class="col-sm-12 col-md-4 form-group">
                    <label for="txtRoleResponsibilities">Role & Responsibilities</label>
                    <asp:TextBox ID="txtRoleResponsibilities" runat="server" CssClass="form-control" 
                        TextMode="MultiLine" Rows="3" placeholder="Enter roles and responsibilities"></asp:TextBox>
                </div>
                
                <!-- Status Message -->
                <div class="col-sm-12 col-md-4 form-group">
                    <asp:Label ID="lblMessage" runat="server" CssClass="text-danger"></asp:Label>
                </div>
                
                <!-- Submit Button -->
                <div class="col-sm-12 col-md-4 form-group mb-0">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary float-right" 
                        OnClick="btnSubmit_Click" ValidationGroup="RegBtnValid" />
                   
                </div>
            </div>
        </form>
    </div>
</body>
</html>
