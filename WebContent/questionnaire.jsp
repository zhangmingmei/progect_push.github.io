<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path1 = request.getContextPath();
	String basePathindex = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path1 + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<link rel="stylesheet" href="<%=basePathindex%>css/bootstrap.min.css">
<link rel="stylesheet" href="<%=basePathindex%>css/questionnaire.css">
<script type="text/javascript" src="<%=basePathindex%>js/jquery-1.12.0.min.js"></script>
<%-- <script type="text/javascript"
	src="<%=basePathindex%>js/bootstrap.min.js"></script> --%>
<script type="text/javascript"
	src="<%=basePathindex%>js/questionnaire.js"></script>
<script type="text/javascript" src="<%=basePathindex%>js/jquery.tmpl.js"></script>
<script type="text/javascript">
	var baseUrl = '<%=basePathindex%>';
	/* data-type：1（textarea），2(radio),3(checkbox) */
	$(function() {

	});
</script>
<title></title>
</head>
<body>
	<div id="survey-page" class="wrapper has-bottom">
		<div class="page">
			<form id="answer" name="answer" method="POST">

				<script id="formatTMuban" type="text/x-jquery-tmpl"> 
				<div class="question" id="position\${alterPosition_id()}" data-id="\${id}"
					data-num="\${alterData_num()}" data-type="t">
					<div name="notDo">
					<div class="question-title">
						<div class="question-code">Q\${alterIndex()}.</div>
						<div class="question-text clearfix"><span>\${title}</span>
							<span name="required" title="必答" style="display: none;">*</span>
						</div>
					</div>
					<div class="question-answer format4">
						<div class="answer-text">
							<textarea id="" name="textarea1" class="form-text"></textarea>
						</div>
					</div>
					</div>
				</div>
				</script>

				<script id="formatMMuban" type="text/x-jquery-tmpl">
				<div class="question" id="position\${alterPosition_id()}" data-id="\${id}"
					data-num="\${alterData_num()}" data-type="m">
					<div name="notDo">
						<div class="question-title">
						<div class="question-code">Q\${alterIndex()}.</div>
						<div class="question-text clearfix"><span>以下这些品牌您知道哪些？</span>
							<span name="required" title="必答" style="display: none;">*</span>
						</div>
					</div>
					<div class="question-answer format1">
						<div class="answer-multiple">

							{{each answerlist}}

							<div class="answer-checkbox">
								<input type="checkbox" id="\${\$index+1 }"
									name="checkbox\${getcheckName()}"
									value="\${getManswer()}">
								<div class="answer-icon"></div>
								<label for="a8ce7b20462c84ebc2ab9e37a09c3a921408">\${a} </label>
							</div>

							{{/each}}

							<div class="answer-checkbox">
								<input type="checkbox" id="0"
									name="checkbox\${getRadioName()}"
									value="mElse">
								<div class="answer-icon"></div>
								<label for="6c054db934698ecf0d97d5e0eecdd4471537">其他 <input
									type="text" name="else" class="form-other">
								</label>
							</div>

						</div>
					</div>
					</div>
				</div>
				</script>

				<script id="formatSMuban" type="text/x-jquery-tmpl">
				<div class="question" id="position\${alterPosition_id()}" data-id="\${id}"
					data-num="\${alterData_num()}" data-type="s" data-mandatory="1">
					<div name="notDo">
						<div class="question-title">
						<div class="question-code">Q\${alterIndex()}.</div>
						<div class="question-text clearfix"><span>\${title}</span>
							<span name="required" title="必答" style="display: none;">*</span>
						</div>
					</div>
					<div class="question-answer format1">
						<div class="answer-single">
						
							{{each answerlist}}
							<div class="answer-radio">
								<input type="radio" id="\${\$index+1 }"
									name="radio\${getRadioName()}"
									value="\${getSanswer()}">
								<div class="answer-icon"></div>
								<label for="6c054db934698ecf0d97d5e0eecdd4471532">\${a}</label>
							</div>
							{{/each}}

							<div class="answer-radio">
								<input type="radio" id="0"
									name="radio\${getRadioName()}"
									value="sElse">
								<div class="answer-icon"></div>
								<label for="6c054db934698ecf0d97d5e0eecdd4471537">其他 <input
									type="text" name="else" class="form-other">
								</label>
							</div>
						</div>
					</div>
					</div>
				</div>
				</script>

				<script id="formatDMuban" type="text/x-jquery-tmpl">
				<div class="question" id="position\${alterPosition_id()}" data-id="\${id}"
					data-num="\${alterData_num()}" data-type="d">
					<div name="notDo">
						<div class="question-title">
						<div class="question-code">Q\${alterIndex()}.</div>
						<div class="question-text clearfix"><span>您的工作是否是有意义的？
							请使用1-10分的尺度进行打分，其中10分代表非常有意义，1分代表毫无意义, 6 f分代表有意义顶顶顶顶顶顶顶</span>
							<span name="required" title="必答" style="display: none;">*</span>
						</div>
					</div>
					<div class="question-answer">
						<table class="main-table answer-table">
							<tbody>
								<tr class="mandatory">
									<th>&nbsp;</th>
									<th><div class="table-col-text">1</div>
									</th>
									<th><div class="table-col-text">2</div>
									</th>
									<th><div class="table-col-text">3</div>
									</th>
									<th><div class="table-col-text">4</div>
									</th>
									<th><div class="table-col-text">5</div>
									</th>
									<th><div class="table-col-text">6</div>
									</th>
									<th><div class="table-col-text">7</div>
									</th>
									<th><div class="table-col-text">8</div>
									</th>
									<th><div class="table-col-text">9</div>
									</th>
									<th><div class="table-col-text">10</div>
									</th>
								</tr>
								<tr data-mandatory="1"
									data-group="a51ec7e9b7f00f9b384cdf158f32285b">
									<td data-child="1"><div class="table-question-text">请选择</div>
									</td>
									<td><div class="answer-table-radio"
											style="height: 35px; line-height: 35px;">
											<input type="radio" value="1" name="table-radio\${getTable_RadioName()}">
											<div class="answer-icon"></div>
											<label for="a51ec7e9b7f00f9b384cdf158f32285b1777"></label>
										</div>
									</td>
									<td><div class="answer-table-radio"
											style="height: 35px; line-height: 35px;">
											<input type="radio" value="2"
												 value="2" name="table-radio\${getTable_RadioName()}">
											<div class="answer-icon"></div>
											<label for="a51ec7e9b7f00f9b384cdf158f32285b1778"></label>
										</div>
									</td>
									<td><div class="answer-table-radio"
											style="height: 35px; line-height: 35px;">
											<input type="radio"  value="3" name="table-radio\${getTable_RadioName()}">
											<div class="answer-icon"></div>
											<label for="a51ec7e9b7f00f9b384cdf158f32285b1779"></label>
										</div>
									</td>
									<td><div class="answer-table-radio"
											style="height: 35px; line-height: 35px;">
											<input type="radio" value="4" name="table-radio\${getTable_RadioName()}">
											<div class="answer-icon"></div>
											<label for="a51ec7e9b7f00f9b384cdf158f32285b1780"></label>
										</div>
									</td>
									<td><div class="answer-table-radio"
											style="height: 35px; line-height: 35px;">
											<input type="radio" value="5" name="table-radio\${getTable_RadioName()}">
											<div class="answer-icon"></div>
											<label for="a51ec7e9b7f00f9b384cdf158f32285b1781"></label>
										</div>
									</td>
									<td><div class="answer-table-radio"
											style="height: 35px; line-height: 35px;">
											<input type="radio" value="6" name="table-radio\${getTable_RadioName()}">
											<div class="answer-icon"></div>
											<label for="a51ec7e9b7f00f9b384cdf158f32285b1782"></label>
										</div>
									</td>
									<td><div class="answer-table-radio"
											style="height: 35px; line-height: 35px;">
											<input type="radio" value="7" name="table-radio\${getTable_RadioName()}">
											<div class="answer-icon"></div>
											<label for="a51ec7e9b7f00f9b384cdf158f32285b1783"></label>
										</div>
									</td>
									<td><div class="answer-table-radio"
											style="height: 35px; line-height: 35px;">
											<input type="radio" value="8" name="table-radio\${getTable_RadioName()}">
											<div class="answer-icon"></div>
											<label for="a51ec7e9b7f00f9b384cdf158f32285b1784"></label>
										</div>
									</td>
									<td><div class="answer-table-radio"
											style="height: 35px; line-height: 35px;">
											<input type="radio" value="9" name="table-radio\${getTable_RadioName()}">
											<div class="answer-icon"></div>
											<label for="a51ec7e9b7f00f9b384cdf158f32285b1785"></label>
										</div>
									</td>
									<td><div class="answer-table-radio"
											style="height: 35px; line-height: 35px;">
											<input type="radio" value="10" name="table-radio\${getTable_RadioName()}">
											<div class="answer-icon"></div>
											<label for="a51ec7e9b7f00f9b384cdf158f32285b1786"></label>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				</div>
				</script>
			</form>
			
			<!-- 模态框（Modal）-暂停 -->
	<div class="modal fade" id="myModal" style="display:none" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				 <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                <h4 class="modal-title" id="myModalLabel">模态框（Modal）标题</h4>
	            </div> 
				<div class="modal-body">
					<div class="rest">
						<img alt="" src="<%=basePathindex%>static/student/images/rest.png">
					</div>
				</div>
				<div class="modal-footer">
					<!-- <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button> -->
					<button type="button" class="btn btn-info" data-dismiss="modal"
						onclick="start();">继续做题</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
			
		</div>
	</div>
</body>
</html>