<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DesignationReport.aspx.cs" Inherits="Report_DesignationReport" %>

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
                    <h2 class="text-center text-info">Designation Report</h2>
                </div>

                <!-- College Selection -->
                <div class="col-sm-12 col-md-4 form-group">
                    <label for="ddlCollege">College Name</label>
                    <asp:DropDownList ID="ddlCollege" runat="server" CssClass="form-control">
                    </asp:DropDownList>
                </div>
                <!-- Designation Name -->
                <div class="col-sm-12 col-md-4 form-group">
                    <label for="txtDesignationName">Designation Name</label>
                    <asp:TextBox ID="txtDesignationName" runat="server" CssClass="form-control"
                        placeholder="Enter full designation name"></asp:TextBox>
                </div>
                <!-- Submit Button -->
                <div class="col-sm-12 col-md-2 form-group mt-4">
        <asp:Button ID="btnSubmit" runat="server" Text="Go" CssClass="btn btn-primary float"
        OnClick="btnSubmit_Click" ValidationGroup="RegBtnValid" />
        </div>
        <div class="col-sm-12 col-md-2 form-group mt-4">
            <a class="btn btn-primary float" href="../Designation-Master/Register-Designation.aspx">Add New</a>
        </div>
            </div>
            <hr />
            <div class="row">
                <div class="col-sm-12 col-md-12 ">
                    <div class="table-responsive">
                        <asp:GridView runat="server" CssClass="table table-bordered table-striped" ID="grdDesignationRcrd" AutoGenerateColumns="false">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="DesignationAcronym">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("DesignationAcronym") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="DesignationName">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("DesignationName")  %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField><asp:TemplateField HeaderText="Priority" >
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%#  Eval("Priority")  %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField><asp:TemplateField HeaderText="Role & Responsibilities">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Eval("RoleResponsibilities") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </form>
    </div>
</body>
</html>
