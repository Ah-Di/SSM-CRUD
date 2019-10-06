<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

    <title>员工列表</title>

    <script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-3.3.1.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
</head>

<body>
<!-- 添加用户模态框 -->
<div class="modal fade" id="add_empl_Modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">添加员工</h4>
            </div>
            <div class="modal-body">
                <!-- 表单 -->
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">员工姓名</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="empName_add" placeholder="empName"
                                   name="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="email_add" placeholder="mail" name="mail">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-4">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="radio1" value="男" checked="true"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="radio2" value="女"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId" id="dept_select_data">
                                <!-- 显示部门 -->
                            </select>
                        </div>
                    </div>

                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="save_empl">保存</button>
            </div>
        </div>
    </div>
</div>

<!-- 修改用户模态框 -->
<div class="modal fade" id="update_empl_Modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="update_empl_label">修改员工</h4>
            </div>
            <div class="modal-body">
                <!-- 表单 -->
                <form class="form-horizontal">
                    <input type="hidden" id="empId_update" name="empId">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">员工姓名</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="empName_update" placeholder="empName"
                                   name="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="email_update" placeholder="mail" name="mail">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-4">
                            <label class="radio-inline">
                                <input type="radio" name="gender" value="男" checked="true"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" value="女"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId" id="dept_update_data">
                                <!-- 显示部门 -->
                            </select>
                        </div>
                    </div>

                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="update_empl">保存</button>
            </div>
        </div>
    </div>
</div>


<div class="container">
    <!-- 第一行：显示标题 -->
    <div class="row" style="padding-bottom: 50px ;">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>

    <!-- 第二行：添加删除按钮 -->
    <div class="row" style="padding-bottom: 10px ;">
        <div class="col-md-4  col-md-offset-8">
            <button class="btn btn-primary" id="add_empl_btn">新增</button>
            <button class="btn btn-danger" id="del_empl_btn">删除</button>
        </div>
    </div>

    <!-- 第三行：显示数据表格 -->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="empl_table">
                <thead>
                <tr>
                    <th><input type="checkbox" id="check_all"></th>
                    <th>#</th>
                    <th>姓名</th>
                    <th>性別</th>
                    <th>邮箱</th>
                    <th>部门</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>

    <!-- 第四行：分页 -->
    <div class="row">
        <!-- 显示分页数据 -->
        <div class="col-md-6">
            <span class="label label-primary" id="page_data"></span>
        </div>
        <!-- 显示分页页码 -->
        <div class="col-md-6">

            <nav aria-label="Page navigation">
                <ul class="pagination" id="page_nav_ul">
                    <%-- 页码导航 --%>
                </ul>
            </nav>
        </div>
    </div>

</div>
</body>

<script type="text/javascript">
    //  刷新页面立即调用此方法
    $(function () {
        toPage(1);
    });

    //转到页面
    function toPage(pn) {
        $.ajax({
            url: "${pageContext.request.contextPath}/empl",
            type: "get",
            data: "pn=" + pn,
            success: function (data) {
                build_empl(data);
                build_page_data(data);
                build_page_nav(data);
            }
        })
    };

    //解析并显示员工信息
    function build_empl(msg) {
        //清除之前的员工信息
        $("#empl_table tbody").empty();

        var emps = msg.map.pageInfo.list;
        $.each(emps, function (index, item) {
            var td_checkbox = $("<td></td>").append($("<input type='checkbox' class='check_items'/>"));
            var td_empId = $("<td></td>").append(item.empId);
            var td_empName = $("<td></td>").append(item.empName);
            var td_gender = $("<td></td>").append(item.gender);
            var td_mail = $("<td></td>").append(item.mail);
            var td_department = $("<td></td>").append(item.department.depName);
            var btn_1 = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn").css("margin-right", "3px")
                .append("<span></span>").addClass("glyphicon glyphicon-pencil").append("编辑");
            btn_1.attr("edit_id", item.empId);
            var btn_2 = $("<button></button>").addClass("btn btn-danger btn-sm del_btn")
                .append("<span></span>").addClass("glyphicon glyphicon-trash").append("删除");
            btn_2.attr("del_id", item.empId);
            var td_btn = $("<td></td>").append(btn_1).append(btn_2);

            var tr = $("<tr></tr>").append(td_checkbox).append(td_empId).append(td_empName).append(td_gender)
                .append(td_mail).append(td_department).append(td_btn);//
            $("#empl_table tbody").append(tr);
        })
    };

    //解析并显示分页信息
    function build_page_data(msg) {
        //清除之前的分页信息
        $("#page_data").empty();

        $("#page_data").append("第" + msg.map.pageInfo.pageNum + "页  共" + msg.map.pageInfo.pages
            + "页 总计" + msg.map.pageInfo.total + "条记录");
    };

    //解析并显示分页导航
    function build_page_nav(msg) {
        //清除之前的分页导航
        $("#page_nav_ul").empty();

        var ul = $("#page_nav_ul");
        var firstPage = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
        var prePage = $("<li></li>").append($("<a></a>").attr("href", "#").attr("aria-label", "Previous").append("&laquo;"));
        // 判断是否有前一页
        if (msg.map.pageInfo.hasPreviousPage == false) {
            firstPage.addClass("disabled");
            prePage.addClass("disabled");
        } else {
            //绑定点击事件
            firstPage.click(function () {
                toPage(1);
            });
            //绑定点击事件
            prePage.click(function () {
                toPage(msg.map.pageInfo.pageNum - 1);
            });
        }

        var nextPage = $("<li></li>").append($("<a></a>").attr("href", "#").attr("aria-label", "Previous").append("&raquo;"));
        var lastPage = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));
        // 判断是否有后一页
        if (msg.map.pageInfo.hasNextPage == false) {
            nextPage.addClass("disabled");
            lastPage.addClass("disabled");
        } else {
            //绑定点击事件
            nextPage.click(function () {
                toPage(msg.map.pageInfo.pageNum + 1);
            });
            //绑定点击事件
            lastPage.click(function () {
                toPage(msg.map.pageInfo.pages);
            });
        }
        // 将元素插入到页面
        ul.append(firstPage).append(prePage);
        $.each(msg.map.pageInfo.navigatepageNums, function (index, item) {
            var i = $("<li></li>").append($("<a></a>").append(item).attr("href", "#"));
            ul.append(i);
            if (item == msg.map.pageInfo.pageNum) {
                i.addClass("active");
            }
            //绑定点击事件
            i.click(function () {
                toPage(item);
            });
        });
        ul.append(nextPage).append(lastPage);
    }

    //解析表单下拉列表的部门信息
    function build_dept_option(msg, ele) {
        var dept_select = ele;
        //清空之前部门
        dept_select.empty();
        //构建部门数据
        $.each(msg.map.dept, function (index, item) {
            dept_select.append($("<option></option>").append(item.depName).val(item.depId));
        });
    }

    //新增按钮
    $("#add_empl_btn").click(function () {
        //请求部门
        $.ajax({
            url: "${pageContext.request.contextPath}/dept",
            type: "get",
            success: function (data) {
                build_dept_option(data, $("#dept_select_data"));
            }
        });
        //清除表单内容
        $("#add_empl_Modal form")[0].reset();
        //清空表单样式
        $("#add_empl_Modal div").removeClass("has-error has-success");
        $("#add_empl_Modal form").find(".help-block").text("");
        //打开模态框
        $("#add_empl_Modal").modal({
            backdrop: "static"
        });
    })

    //编辑按钮
    $(document).on("click", ".edit_btn", function () {
        //请求部门
        $.ajax({
            url: "${pageContext.request.contextPath}/dept",
            type: "get",
            success: function (data) {
                build_dept_option(data, $("#dept_update_data"));
            }
        });
        //得到当前选中的id
        var edit_id = $(this).attr("edit_id");
        getEmpl(edit_id);

        //打开模态框
        $("#update_empl_Modal").modal({
            backdrop: "static"
        });
    })

    //删除按钮
    $(document).on("click", ".del_btn", function () {
        //得到点击的id
        var del_id = $(this).attr("del_id");
        //弹出确认框
        if (confirm("是否确认删除！")) {
            //给服务器发送请求
            $.ajax({
                url: "${pageContext.request.contextPath}/deleteEmpl/" + del_id,
                type: "delete",
                success: function (data) {
                    toPage(1);
                }
            })
        }
    })

    //修改保存按钮
    $("#update_empl").click(function () {
        //校验用户名
        var empName = $("#empName_update").val();
        var reg = /(^[a-zA-Z0-9_-]{4,16}$)|(^[\u2E80-\u9FFF]{2,5}$)/;
        if (!reg.test(empName)) {
            show_validata_msg($("#empName_update"), "error", "用户名为4-16英文数字组合或者2-5位中文");
            return false;
        } else {
            show_validata_msg($("#empName_update"), "success", "");
        }
        //校验邮箱
        var email = $("#email_update").val();
        var reg2 = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!reg2.test(email)) {
            show_validata_msg($("#email_update"), "error", "请输入正确邮箱！");
            return false;
        } else {
            show_validata_msg($("#email_update"), "success", "");
        }

        var data = formToJson($("#update_empl_Modal form"));
        $.ajax({
            url: "${pageContext.request.contextPath}/updateEmpl",
            type: "put",
            data: JSON.stringify(data),
            contentType: "application/json;charset=UTF/8",
            success: function (data) {
                //转到第一页
                toPage(1);
                //关闭修改框
                $("#update_empl_Modal").modal("hide");
                alert(data.msg);
            }
        })
    })

    //保存用户按钮
    $("#save_empl").click(function () {
        //校验
        if (!validata_add_form()) return;

        var data = formToJson($("#add_empl_Modal form"));
        $.ajax({
            url: "${pageContext.request.contextPath}/save",
            type: "POST",
            data: JSON.stringify(data),
            contentType: "application/json;charset=UTF/8",
            success: function (data) {
                if (data.code == 100) {
                    //员工保存成功
                    //页面跳转到新增的一页
                    toPage(9999);
                    toPage(9999);
                    //关闭新增对话框
                    $("#add_empl_Modal").modal("hide");
                } else {
                    //失败信息
                    if (!undefined == data.map.errorField.mail) {
                        show_validata_msg($("#email_add"), "error", data.map.errorField.mail);
                    }
                    if (!undefined == data.map.errorField.empName) {
                        show_validata_msg($("#empName_add"), "error", data.map.errorField.empName);
                    }
                }
            }
        });
    })

    //按id得到empl
    function getEmpl(id) {
        $.ajax({
            url: "${pageContext.request.contextPath}/getEmpl/" + id,
            type: "get",
            success: function (data) {
                $("#empId_update").val(data.map.empl.empId);
                $("#empName_update").val(data.map.empl.empName);
                $("#email_update").val(data.map.empl.mail);
                $("#update_empl_Modal input[name=gender]").val([data.map.empl.gender]);

                $("#update_empl_Modal select").val(data.map.empl.dId);
            }
        })
    }

    //服务器校验表单
    $("#empName_add").change(function () {
        var empName = $(this).val();
        $.ajax({
            url: "${pageContext.request.contextPath}/checkName",
            type: "post",
            data: "empName=" + empName,
            success: function (data) {
                if (data.code == 100) {
                    show_validata_msg($("#empName_add"), "success", "");
                } else {
                    show_validata_msg($("#empName_add"), "error", data.map.msg);
                }
            }
        })
    })

    //校验增加员工表单
    function validata_add_form() {
        //校验用户名
        var empName = $("#empName_add").val();
        var reg = /(^[a-zA-Z0-9_-]{4,16}$)|(^[\u2E80-\u9FFF]{2,5}$)/;
        if (!reg.test(empName)) {
            show_validata_msg($("#empName_add"), "error", "用户名为4-16英文数字组合或者2-5位中文");
            return false;
        } else {
            show_validata_msg($("#empName_add"), "success", "");
        }
        //校验邮箱
        var email = $("#email_add").val();
        var reg2 = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!reg2.test(email)) {
            show_validata_msg($("#email_add"), "error", "请输入正确邮箱！");
            return false;
        } else {
            show_validata_msg($("#email_add"), "success", "");
        }
        return true;
    }

    //全选复选框事件
    $("#check_all").click(function () {
        var flag = $(this).prop("checked");
        $(".check_items").prop("checked", flag);
    })

    //单选复选框事件
    $(document).on("click", ".check_items", function () {
        var flag = $(".check_items:checked").length == $(".check_items").length;
        $("#check_all").prop("checked", flag);
    })

    //多选删除按钮
    $("#del_empl_btn").click(function () {
        var data = "";
        $.each($(".check_items:checked"), function () {
            data += $(this).parents("tr").find("td").eq(1).text() + "-";

        });
        var ids = data.substring(0, data.length - 1);
        if(ids != ""){
            if (confirm("是否确认删除多项！")) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/deleteEmpl/" + ids,
                    type: "delete",
                    success: function () {
                        toPage(1);
                    }
                })
            }
        }
    })

    //校验数据提示
    function show_validata_msg(ele, status, msg) {
        //清除当前元素的校验状态
        ele.parent().removeClass("has-error has-success");
        ele.next("span").text("");
        if (status == "success") {
            ele.parent().addClass("has-success");
            ele.next("span").text(msg);
        } else {
            ele.parent().addClass("has-error");
            ele.next("span").text(msg);
        }
    }

    //表单转json
    function formToJson(ele) {
        var data = ele.serialize();
        data = decodeURIComponent(data, true);//防止中文乱码
        data = data.replace(/&/g, "','");
        data = data.replace(/=/g, "':'");
        data = "({'" + data + "'})";
        obj = eval(data);
        return obj;
    }
</script>
</html>