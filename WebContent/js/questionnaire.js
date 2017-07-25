var indexAll = 0,dataNum = 0,positionId = 0,length;
var answeSval = 0,answeMval = 0, radioName = 0,table_radioName = 0,checkName = 0;
var notDo = new Array();//必做题中未做的题目
var required;//"1"必做，0选做,
$(function () {
	
	$.ajax({
		url: 'data.json',
		type:'post',
		dataType:'json',
		async:false,
		success:function(data){
			length = data.questionlist.length;
			for(var i=0; i<length; i++){
				required = data.questionlist[i].required;
				index = i+1;
				if(data.questionlist[i].type=="t"){//简答题
					$("#formatTMuban")
		    		.tmpl( data.questionlist[i] )
		    		.appendTo("#answer");
				}else if(data.questionlist[i].type=="s"){//单选题
						radioName++;
						answeSval = 0;
						
						$("#formatSMuban")
			    		.tmpl( data.questionlist[i] )
			    		.appendTo("#answer");
				}else if(data.questionlist[i].type=="m"){//多选题
						checkName++;
						answeMval = 0;
						
						$("#formatMMuban")
			    		.tmpl( data.questionlist[i] )
			    		.appendTo("#answer");
				}else if(data.questionlist[i].type=="d"){//评分题
					table_radioName++;
					//answeMval = 0;
					
					$("#formatDMuban")
		    		.tmpl( data.questionlist[i] )
		    		.appendTo("#answer");
			}
			
				if(required == "1"){
					$("div[data-num="+index+"]").find("span").addClass("required");
					$("div[data-num="+index+"]").find("span[name=required]").val("1");
				}else{
					$("div[data-num="+index+"]").find("span[name=required]").val("0");
				}
			}
		},
		error:function(XMLHttpRequest, textStatus, errorThrown){
			alert(XMLHttpRequest.status);
            alert(XMLHttpRequest.readyState);
            alert(textStatus);
		}
	});
	
	
	var submitHtml = "<div class='question-page clearfix' style='display: block;'>"+
				"<input type='hidden' name='auth' value='aeec83c09ec26ec70a2227bc7c0428a6'>"+ 
				"<input type='hidden' name='action' value='b34ce9c0ff'>"+
				"<input type='hidden' name='t' value='01fbb59f89f0c5c62a80c859a0cac588'>"+
				"<button id='page-next' type='button' data-toggle='modal'>"+
					"<span style='color: #fff;font-size:16px;'>提交</span>"+
				"</button>"+
				"</div>";
				$('#answer').append(submitHtml);
				var answerTem = "",dataType="",questionId="",anserrT="",anserrS="",anserrM="",anserrMelse="";
				
				//提交试卷,遍历获取答案，每个题都为必做题，如果有未做的题目，在提交时会提示并定位到该题处
				$('#page-next').on('click',function(){
						 for(var i=1; i<=length; i++){
							dataType = $('div[data-num='+i+']').attr("data-type");
							questionId = $('div[data-num='+i+']').attr("data-id");
							required = $('div[data-num='+i+']').find("span[name=required]").val();
							if(dataType == "t"){//简答题——questionID_内容
								 anserrT = $('div[data-num='+i+']').find("textarea").val();
								 if(anserrT == "" && required == "1"){
									 notDo.push($('div[data-num='+i+']').attr("id"));
									 $('div[data-num='+i+']').find("div[name=notDo]").addClass('unDo');
								 }
								answerTem = answerTem + questionId + "_" + anserrT + ";"; 
							}else if(dataType == "s" || dataType == "d"){//单选题——questionID_1
								anserrS = "";
								 $('div[data-num='+i+']').find("input:radio").each(function(){
								 	if($(this).prop("checked")){
								 		if($(this).val() == "sElse"){//如果为其他时——questionID_else_"内容"，
								 			anserrS = "else_" + $('div[data-num='+i+']').find("input[name='else']").val();
								 		}else{
										 	anserrS = $(this).val();
								 		}
								 	}
								 });
								 if(anserrS == "" && required == "1"){
									 notDo.push($('div[data-num='+i+']').attr("id"));
									 $('div[data-num='+i+']').find("div[name=notDo]").addClass('unDo');
								 }
								answerTem = answerTem + questionId + "_" + anserrS + ";"; 
							}else if(dataType == "m"){//多选题——questionID_1，3
								anserrM = "";
								
								 $('div[data-num='+i+']').find("input:checkbox").each(function(){
								 	if($(this).prop("checked")){
								 		if($(this).val() == "mElse"){//如果为其他时——questionID_1，2，else_"内容"，
								 			anserrMelse = "else_" + $('div[data-num='+i+']').find("input[name='else']").val() + ",";
								 		}else{
										 	anserrM += $(this).val() + ",";
								 		}
								 	}
								 });
								 if(anserrM == "" && required == "1"){
									 notDo.push($('div[data-num='+i+']').attr("id"));
									 $('div[data-num='+i+']').find("div[name=notDo]").addClass('unDo');
								 }
								 
								answerTem = answerTem + questionId + "_" + anserrM + anserrMelse + ";"; 
							}
						} 
						/* $('#myModal').modal({backdrop: 'static', keyboard: false});*/
						// alert(answerTem);
						 //alert(notDo);
						 //判断必做题是否全部做完，全部做完才允许提交，否则定位到未做题目
						 if(notDo.length == 0){
							 window.location.href = baseUrl + "complete.jsp";
						 }else{
							 alert("请确保所有内容填写正确，页面将自动定位到第一个不符合要求的题目，请检查！");
							 window.location.hash=notDo[0];
							 answerTem = "";
							 notDo = [];
						 }
				});
				
	
	
	
	
    $(document).keydown(function(e){
        var  keycode = e.which || e.keyCode;
        if(keycode == 13 && e.target.nodeName == "INPUT") {
            return false;
        }
        if(keycode ==13 && e.target.nodeName != 'TEXTAREA'){
            $("#page-next").trigger("click");
        }
    });
    
   /* $(".answer-radio>input:radio").on("change", function () {*/
    $('#answer').on("click",".answer-radio",function () {
	   $(this).closest("div[name=notDo]").removeClass("unDo");
       $(this).addClass("checked").siblings().removeClass("checked");
       $(this).siblings("input:radio").prop("checked", false);
       $(this).find("input:radio").prop("checked", true);
       
       if($(this).find("input:text").is(":focus")){
       	$(this).addClass("checked").find('input:radio').prop("checked", true);
       };
       
       //alert($("input[value='sElse']").is(':checked'));
       if(!($("input[value='sElse']").is(':checked'))){
    	   $(this).parent().find("input:text").val('');
       }
    });
    
    $('#answer').on("click",".answer-checkbox",function () {
    	 $(this).closest("div[name=notDo]").removeClass("unDo");
        if ($(this).find('input:checkbox').prop("checked")) {
        	$(this).removeClass("checked").find('input:checkbox').prop("checked", false);
        } else {
        	$(this).addClass("checked").find('input:checkbox').prop("checked", true);
        }
        
        if($(this).find("input:text").is(":focus")){
        	$(this).addClass("checked").find('input:checkbox').prop("checked", true);
        };
        
        if(!($(this).find("input:text").parent().parent().prop("checked"))){
        	$(this).find("input:text").val('');
        }
    });
    
    $('#answer').on("click",".answer-table-radio",function () {
    	 $(this).closest("div[name=notDo]").removeClass("unDo");
    	$(this).closest(".question").find('.answer-table-radio').removeClass("checked");;
    	
        $(this).addClass("checked");
        $('answer-table-radio').find("input:radio").prop("checked", false);
        $(this).find("input:radio").prop("checked", true);
        
     });
    
    $('#answer').on("click","textarea",function () {
   	 $(this).closest("div[name=notDo]").removeClass("unDo");
    });
    
});



function alterIndex(){
	indexAll++;
	return indexAll;
}
function alterData_num(){
	dataNum++;
	return dataNum;
}
function alterPosition_id(){
	positionId++;
	return positionId;
}


function getSanswer(){
	return ++answeSval;
}

function getManswer(){
	return ++answeMval;
}

function getRadioName(){
	return radioName;
}

function getTable_RadioName(){
	return table_radioName;
}

function getcheckName(){
	return checkName;
}
