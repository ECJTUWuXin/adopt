<%--
  Created by IntelliJ IDEA.
  User: 24255
  Date: 2019/8/22
  Time: 23:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>宠物领养管理后台</title>
    <!-- 引入css样式文件 -->
    <!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- MetisMenu CSS -->
    <link href="${pageContext.request.contextPath}/js/houtai/css/metisMenu.min.css" rel="stylesheet">
    <!-- DataTables CSS -->
    <link href="${pageContext.request.contextPath}/js/houtai/css/dataTables.bootstrap.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/js/houtai/css/sb-admin-2.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="${pageContext.request.contextPath}/js/houtai/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/js/houtai/css/boot-crm.css" rel="stylesheet" type="text/css">
    <style>
        .panel-heading{background-color: #337ab7;border-color: #2e6da4;font-size:14px;padding-left:20px;height:36px;line-height:36px;color:white;position:relative;cursor:pointer;}/*转成手形图标*/
        .panel-heading span{position:absolute;right:10px;top:12px;}
    </style>
</head>
<body>
<div id="wrapper">
    <!-- 导航栏部分 -->
    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <a class="navbar-brand" href="">流浪猫狗管理系统</a>
        </div>
        <!-- 导航栏右侧图标部分 -->
        <!-- 导航栏右侧图标部分 -->
        <ul class="nav navbar-top-links navbar-right">
            <!-- 消息通知 end -->
            <!-- 用户信息和系统设置 start -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="crmclass/list.action#">
                    <i class="fa fa-user fa-fw"></i>
                    <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user ">
                    <li><a href="#"><i class="fa fa-user fa-fw"></i>
                        用户：</a>
                    </li>
                    <li><a href="#"><i class="fa fa-gear fa-fw"></i> 系统设置</a></li>
                    <li class="divider"></li>
                    <li>
                        <a href="logout.action">
                            <i class="fa fa-sign-out fa-fw"></i>退出登录
                        </a>
                    </li>
                </ul>
            </li>
            <!-- 用户信息和系统设置结束 -->
        </ul> <!-- 左侧显示列表部分 start-->
        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <!-- 教学管理  折叠的分组列表 -->
                <div class="panel-heading" id="collapseListGroupHeading3" data-toggle="collapse" data-target="#collapseListGroup3" role="tab">
                    <h4 class="panel-title">
                        后台管理 <span class="fa fa-chevron-up right"></span>
                    </h4>
                </div>
                <div id="collapseListGroup3" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="collapseListGroupHeading3">
                    <ul class="list-group">
                        <li class="list-group-item my_font">
                            <a href="${pageContext.request.contextPath}/animal/admin/user.jsp">
                                <i class="fa fa-flash fa-fw"></i> 用户信息
                            </a>
                        </li>
                        <li class="list-group-item my_font">
                            <a href="${pageContext.request.contextPath}/animal/admin/admin.jsp">
                                <i class="fa fa-flash fa-fw"></i> 管理员信息
                            </a>
                        </li>
                        <li class="list-group-item my_font">
                            <a href="${pageContext.request.contextPath}/animal/admin/pet.jsp">
                                <i class="fa fa-sitemap fa-fw"></i> 宠物管理
                            </a>
                        </li>
                        <li class="list-group-item my_font">
                            <a href="${pageContext.request.contextPath}/animal/admin/adopt.jsp">
                                <i class="fa fa-sitemap fa-fw"></i> 领养管理
                            </a>
                        </li>
                        <li class="list-group-item my_font">
                            <a href="${pageContext.request.contextPath}/animal/admin/comment.jsp">
                                <i class="fa fa-sitemap fa-fw"></i> 评论管理
                            </a>
                        </li>
                        <li class="list-group-item my_font">
                            <a href="${pageContext.request.contextPath}/animal/admin/blog.jsp">
                                <i class="fa fa-sitemap fa-fw"></i> 团队活动管理
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div><!-- 左侧显示列表部分 end-->

    </nav>
    <!-- 班级列表查询部分  start-->
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">用户管理</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="panel panel-default">
            <!-- 搜索部分 -->
            <div class="panel-body">
                <form class="form-inline" method="get" action="">
                    <div class="form-group">
                        <label for="fingByName">用户名称</label>
                        <input type="text" class="form-control" id="fingByName" value="" name="name">
                    </div>
                    <button type="submit" class="btn btn-primary">查询</button>
                </form>
            </div>
        </div>
        <button class="btn btn-primary" id="user_add_modal_btn">新增</button>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">用户信息列表</div>
                    <!-- /.panel-heading -->
                    <table class="table table-bordered table-striped" id="user_table">
                        <thead>
                        <tr>
                            <th>编号</th>
                            <th>用户名</th>
                            <th>性别</th>
                            <th>年龄</th>
                            <th>电话</th>
                            <th>地址</th>
                            <th>有无领养</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                    <div class="row">
                        <!--分页文字信息  -->
                        <div class="col-md-4" id="page_info_area"></div>
                        <!-- 分页条信息 -->
                        <div class="col-md-4" id="page_nav_area">

                        </div>
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
    </div>
    <!-- 用户查询  end-->
</div>
<!-- 创建用户模态框 id newUser form users-->
<div class="modal fade" id="newUsers" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">新建用户信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="new_users_form">
                    <div class="form-group">
                        <label for="new_userName" class="col-sm-2 control-label">
                            用户名字
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="new_userName" placeholder="用户名称" name="userName">
                        </div>
                        <label for="new_password" class="col-sm-2 control-label">
                            用户密码
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="new_password" placeholder="用户密码" name="password">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_sex" class="col-sm-2 control-label">
                            性别
                        </label>
                        <div class="col-sm-4">
                            <select class="form-control" id="new_sex" name="sex">
                                <option value="男">男</option>
                                <option value="女">女</option>
                            </select>
                        </div>
                        <label for="new_age" class="col-sm-2 control-label">
                            电话号码
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="new_age" placeholder="年龄" name="age">
                        </div>

                    </div>
                    <div class="form-group">
                        <label for="new_telephone" class="col-sm-2 control-label">
                            电话号码
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="new_telephone" placeholder="电话" name="telephone">
                        </div>
                        <label for="new_Email" class="col-sm-2 control-label">
                            Email
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="new_Email" placeholder="Email"  name="Email">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_address" class="col-sm-2 control-label">
                            地址
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="new_address" placeholder="地址" name="address">
                        </div>
                        <label for="new_state" class="col-sm-2 control-label">
                            经历
                        </label>
                        <div class="col-sm-4">
                            <select class="form-control" id="new_state" name="state">
                                <option value="0">有领养经历</option>
                                <option value="1">无领养经历</option>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="user_save_btn">创建用户</button>
            </div>
        </div>
    </div>
</div>
<!-- 修改班级模态框 -->
<div class="modal fade" id="editUsers" tabindex="-1" role="dialog" aria-labelledby="myModalLabe">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabe">修改用户信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="edit_user_form">
                    <input type="hidden" id="edit_id" name="id">
                    <div class="form-group">
                        <label for="edit_userName" class="col-sm-2 control-label">
                            用户名称
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit_userName" placeholder="用户名称" value="${user.userName}" name="userName">
                        </div>
                        <label for="edit_password" class="col-sm-2 control-label">
                            用户密码
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit_password" placeholder="用户名称" value="${user.password}" name="password">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_sex" class="col-sm-2 control-label">
                            性别
                        </label>
                        <div class="col-sm-4">
                            <select class="form-control" id="edit_sex" value="${user.sex}" name="sex">
                                <option value="男">男</option>
                                <option value="女">女</option>
                            </select>
                        </div>
                        <label for="edit_telephone" class="col-sm-2 control-label">
                            电话号码
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit_telephone" placeholder="电话" value="${user.telephone}" name="telephone">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_Email" class="col-sm-2 control-label">
                            Email
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit_Email" placeholder="Email" value="${user.email}"  name="Email">
                        </div>
                        <label for="edit_address" class="col-sm-2 control-label">
                            地址
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit_address" placeholder="地址" value="${user.address}" name="address">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_state" class="col-sm-2 control-label">
                            经历
                        </label>
                        <div class="col-sm-4">
                            <select class="form-control" id="edit_state" name="state">
                                <option value="0">有领养经历</option>
                                <option value="1">无领养经历</option>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" class="user_update_btn">保存修改</button>
            </div>
        </div>
    </div>
</div>
<!-- 引入js文件 -->
<!-- jQuery -->
<script src="${pageContext.request.contextPath}/JQuery/jquery-3.4.1.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="${pageContext.request.contextPath}/js/houtai/js/metisMenu.min.js"></script>
<!-- DataTables JavaScript -->
<script src="${pageContext.request.contextPath}/js/houtai/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/js/houtai/js/dataTables.bootstrap.min.js"></script>
<!-- Custom Theme JavaScript -->
<script src="${pageContext.request.contextPath}/js/houtai/js/sb-admin-2.js"></script>
<!-- 编写js代码 -->
<script type="text/javascript">

    var totalRecord,currentPage;

    $(function(){
        to_page(1);
    });
    function to_page(pn){
        $.ajax({
            url:"${pageContext.request.contextPath}/user/users.action",
            data:"pn="+pn,
            type:"GET",
            success:function(result){
                //1、解析并显示员工数据
                build_users_table(result);
                //2、解析并显示分页信息
                build_page_info(result);
                //3、解析显示分页条数据
                build_page_nav(result);
            }
        });
    }

    function build_users_table(result){
        //清空table表格
        $("#user_table tbody").empty();
        //index：下标 user：单个对象
        var users=result.extend.pageInfo.list;
        $.each(users,function(index,user){
            var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
            var userIdTd = $("<td></td>").append(user.id);
            var userNameTd = $("<td></td>").append(user.userName);
            var sexTd = $("<td></td>").append(user.sex);
            var ageTd=$("<td></td>").append(user.age);
            var telephoneTd=$("<td></td>").append(user.telephone);
            var addressTd=$("<td></td>").append(user.address);
            var stateTd=$("<td></td>").append(user.state);

            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("修改");
            //为编辑按钮添加一个自定义的属性，来表示当前员工id
            editBtn.attr("edit-id",user.id);
            var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            //为删除按钮添加一个自定义的属性来表示当前删除的员工id
            delBtn.attr("del-id",user.id);
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
            //var delBtn =
            //append方法执行完成以后还是返回原来的元素
            $("<tr></tr>").append(checkBoxTd)
                .append(userIdTd)
                .append(userNameTd)
                .append(sexTd)
                .append(ageTd)
                .append(telephoneTd)
                .append(addressTd)
                .append(stateTd)
                .append(btnTd)
                .appendTo("#user_table tbody");
        });
    }

    //解析显示分页信息
    function build_page_info(result){
        $("#page_info_area").empty();
        $("#page_info_area").append("当前"+result.extend.pageInfo.pageNum+"页,总"+
            result.extend.pageInfo.pages+"页,总"+
            result.extend.pageInfo.total+"条记录");
        totalRecord = result.extend.pageInfo.total;//最后的数据
        currentPage = result.extend.pageInfo.pageNum;//当前页
    }
    //解析显示分页条，点击分页要能去下一页....
    function build_page_nav(result){
        //page_nav_area
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");

        //构建元素
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if(result.extend.pageInfo.hasPreviousPage == false){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }else{
            //为元素添加点击翻页的事件
            firstPageLi.click(function(){
                to_page(1);
            });
            prePageLi.click(function(){
                to_page(result.extend.pageInfo.pageNum -1);
            });
        }

        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
        if(result.extend.pageInfo.hasNextPage == false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else{
            nextPageLi.click(function(){
                to_page(result.extend.pageInfo.pageNum +1);
            });
            lastPageLi.click(function(){
                to_page(result.extend.pageInfo.pages);
            });
        }

        //添加首页和前一页 的提示
        ul.append(firstPageLi).append(prePageLi);
        //1,2，3遍历给ul中添加页码提示
        $.each(result.extend.pageInfo.navigatepageNums,function(index,item){

            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if(result.extend.pageInfo.pageNum == item){
                numLi.addClass("active");
            }
            numLi.click(function(){
                to_page(item);
            });
            ul.append(numLi);
        });
        //添加下一页和末页 的提示
        ul.append(nextPageLi).append(lastPageLi);

        //把ul加入到nav
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }


    //清空表单样式及内容
    function reset_form(ele){
        $(ele)[0].reset();
        //清空表单样式
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    }





    //清空新建班级窗口中的数据
    function clearCrmclass() {
        $("#new_userName").val("");
        $("#new_password").val("");
        $("#new_sex").val("");
        $("#new_telephone").val("");
        $("#new_Email").val("");
        $("#new_address").val("");
        $("#new_state").val("");

    }
    // 创建用户
    function createcrmclass() {
        $.Post("crmclass/create.action",
            $("#new_crmclass_form").serialize(),function(data){
                if(data =="OK"){
                    alert("班级创建成功！");
                    window.location.reload();
                }else{
                    alert("班级创建失败！");
                    window.location.reload();
                }
            });
    }
    // 通过id获取修改的用户信息
    function editcrmclass(id) {
        $.ajax({
            type:"get",
            url:"crmclass/getcrmclassById.action",
            data:{"id":id},
            success:function(data) {
                $("#edit_id").val(data.id);
                $("#edit_userName").val(data.userName);
                $("#edit_password").val(data.password);
                $("#edit_sex").val(data.sex);
                $("#edit_telephone").val(data.telephone);
                $("#edit_Email").val(data.Email);
                $("#edit_address").val(data.address);
                $("#edit_state").val(data.state);

            }
        });
    }
    // 执行修改用户
    function updateUsers() {
        $.Post("crmclass/update.action",
            $("#edit_crmclass_form").serialize(),
            function(data){
                if(data =="OK"){
                    alert("班级信息更新成功！");
                    window.location.reload();
                }else{
                    alert("班级信息更新失败！");
                    window.location.reload();
                }
            });
    }
    // 删除用户
    function deleteUsers(id) {
        if(confirm('确实要删除该用户吗?')) {
            $.Post("/crmclass/delete.action",{"id":id},
                function(data){
                    if(data =="OK"){
                        alert("用户删除成功！");
                        window.location.reload();
                    }else{
                        alert("用户班级失败！");
                        window.location.reload();
                    }
                });
        }
    }
</script>

</body></html>
