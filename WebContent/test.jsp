<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style type="text/css">
	.dv_pic_item{  
    width: 200px;  
    height: 260px;  
    margin: 5px 5px;  
    float: left;  
}  
.btn_add_pic{  
    width: 80px;  
    height: 30px;  
    border-radius: 6px;  
    outline: none;  
    border: none;  
    background-color: #00BCD4;  
    color: #fff;  
    cursor: pointer;  
    margin-top: 20px;  
    margin-bottom: 20px;  
}  
.input_file_style{  
    width: 200px;  
    height: 20px;  
}  
.img_style{  
    width: 200px;  
    height: 240px;  
    display: block;  
    background-size: 100% auto;  
}  
</style>
<script src="<%=basePath%>/js/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
var btnCount=0;  
$(function() {
	$(".btn_add_pic").click(function(){  
        btnCount++;  
        var t='<div class="dv_pic_item">';  
        t+='<img src="" alt="" class="img_style" id="img_'+btnCount+'"/>';  
        t+='<input   type="file" class="input_file_style"    value="img_'+btnCount+'" id="file_'+btnCount+'"/>';  
        t+='</div>';  
        $(".dv_pic_box").append(t);  
        $(".input_file_style").change(function(e){  
            console.log($(this).attr("id"));  
            var img=document.getElementById($(this).attr("value"));  
            var obj=document.getElementById($(this).attr("id"));  
            if(obj && obj[0]){  
                img.src = window.URL.createObjectURL(obj.files[0]);  
            }else{  
                obj.select();  
                //ie9以上版本需加上blur  
                obj.blur();  
               // var imgSrc = document.selection.createRange().text; 
                	 var imgSrc = document.getSelection();
                	 if (window.getSelection) { //如果是Firefox、Chrome、Safari、Opera
                		 var imgSrc = document.getSelection();
                		 } else if (document.selection && document.selection.createRange) { //如果是IE 
                			 var imgSrc = document.selection.createRange().text;
                		 }
                //图片异常的捕捉，防止用户修改后缀来伪造图片  
                try{  
                    img.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";  
                    img.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;  
                }  
                catch(e)  
                {  
                    alert("上传的图片格式不正确，请重新选择");  
                    return false;  
                }  
                document.selection.empty();  
            }  
        });  
    });  
})
    
</script>
</head>
<body>
<div class="dv_info_box">  
    <div class="dv_pic_box">  
  
  
        </div>  
    <button class="btn_add_pic">添加图片</button>  
</div>  
</body>
</html>