// JavaScript Document
$(document).ready(function(e) {
    $('.record ul>li').click(function(){
		$(this).toggleClass('hover').siblings().removeClass('hover')
	})
});




//js获取项目根路径，如： http://localhost:8083/uimcardprj
function getRootPath(){
    //获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
    var curWwwPath=window.document.location.href;
    //获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
    var pathName=window.document.location.pathname;
    var pos=curWwwPath.indexOf(pathName);
    //获取主机地址，如： http://localhost:8083
    var localhostPath=curWwwPath.substring(0,pos);
    //获取带"/"的项目名，如：/uimcardprj
    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
    console.log('绝对路径为：'+localhostPath+projectName);
    //如果部署路径为tomcat根路径，即localhost:8080即可访问项目，则直接返回localhostPath即可，
    //如部署路径为localhost:8080/MZ形式，则需要加上projectName
    return(localhostPath+projectName);
}

