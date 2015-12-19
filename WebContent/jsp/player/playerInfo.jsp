<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/I18ntag.tld" prefix="tt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<body class="" style="overflow-x:hidden;background-color:#FFF !important;">

	<div class="modal-dialog modal-wide">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
				<h4 class="modal-title"><tt:i18n name="playerInfo"/></h4>
			</div>
			<div class="modal-body">
				<div class="row-fluid">
					<div class="page-container" style="margin: 0px">
						<div class="row">
							<div class="col-md-12">
								<div class="portlet-body form">
									<form class="form-horizontal" action="" method="" style="margin:0 0 0 0">
										<div class="form-body">
											<div class="form-group">
												<label class="control-label col-md-2"><tt:i18n name="playerId"/></label>
												<div class="col-md-4"><input type="text" class="form-control" value="${result.player.id }" readonly /></div>
												<label class="control-label col-md-2"><tt:i18n name="plat"/></label>
												<div class="col-md-4"><input type="text" class="form-control" value="${result.account.plat }" readonly /></div>
											</div>
											<div class="form-group">
												<label class="control-label col-md-2"><tt:i18n name="channel"/></label>
												<div class="col-md-4"><input type="text" class="form-control" value="${result.account.channel }" readonly /></div>
												<label class="control-label col-md-2"><tt:i18n name="device"/></label>
												<div class="col-md-4"><input type="text" class="form-control" value="${result.account.device }" readonly /></div>
											</div>
											<div class="form-group">
												<label class="control-label col-md-2"><tt:i18n name="nameInPlat"/></label>
												<div class="col-md-4"><input type="text" class="form-control" value="${result.account.nameInPlat }" readonly /></div>
												<label class="control-label col-md-2"><tt:i18n name="cupNum"/></label>
												<div class="col-md-4"><input type="text" class="form-control" value="${result.player.playerStatistics.cupNum }" readonly /></div>
											</div>
											<div class="form-group">
												<label class="control-label col-md-2"><tt:i18n name="level"/></label>
												<div class="col-md-4"><input type="text" class="form-control" value="${result.player.level }" readonly /></div>
												<label class="control-label col-md-2"><tt:i18n name="exp"/></label>
												<div class="col-md-4"><input type="text" class="form-control" value="${result.player.exp }" readonly /></div>
											</div>
											<div class="form-group">
												<label class="control-label col-md-2"><tt:i18n name="gold"/></label>
												<div class="col-md-4"><input type="text" class="form-control" value="${result.player.gold }" readonly /></div>
												<label class="control-label col-md-2"><tt:i18n name="cash"/></label>
												<div class="col-md-4"><input type="text" class="form-control" value="${result.player.cash }" readonly /></div>
											</div>
											<div class="form-group">
												<label class="control-label col-md-2"><tt:i18n name="registerTime"/></label>
												<div class="col-md-4"><input type="text" class="form-control" value="${result.account.t }" readonly /></div>
												<label class="control-label col-md-2"><tt:i18n name="lastSignInTime"/></label>
												<div class="col-md-4"><input type="text" class="form-control" value="${result.player.lastSignInTime }" readonly /></div>
											</div>
											<div class="form-group">
												<label class="control-label col-md-2"><tt:i18n name="onLine"/></label>
												<div class="col-md-4"><input type="text" class="form-control" value="${result.player.onLine eq '0'?'离线':'在线' }" readonly /></div>
												<label class="control-label col-md-2"><tt:i18n name="onLineTime"/></label>
												<div class="col-md-4"><input type="text" class="form-control" value="${result.player.onLineTime }" readonly /></div>
											</div>
											<div class="form-group">
												<label class="control-label col-md-2"><tt:i18n name="pushUri"/></label>
												<div class="col-md-4"><input type="text" class="form-control" value="${result.player.pushUri }" readonly /></div>
												<label class="control-label col-md-2"><tt:i18n name="protectEndTime"/></label>
												<div class="col-md-4"><input type="text" class="form-control" value="${result.player.protectEndTime }" readonly /></div>
											</div>
											<div class="form-group">
												<label class="control-label col-md-2"><tt:i18n name="pvpBeatRobotCount"/></label>
												<div class="col-md-4"><input type="text" class="form-control" value="${result.player.playerStatistics.pvpBeatRobotCount }" readonly /></div>
												<label class="control-label col-md-2"><tt:i18n name="letCount"/></label>
												<div class="col-md-4"><input type="text" class="form-control" value="${result.player.playerStatistics.letCount }" readonly /></div>
											</div>
											<div class="form-group">
												<label class="control-label col-md-2"><tt:i18n name="pvpAttackSummary"/></label>
												<div class="col-md-4"><input type="text" class="form-control" value="${result.player.playerExtendData.pvpAttackCount }战${result.player.playerExtendData.pvpAttackWinCount }胜，获胜率${result.player.playerExtendData.pvpAttackWinRate }" readonly /></div>
												<label class="control-label col-md-2"><tt:i18n name="pvpAttackTruePlayerSummary"/></label>
												<div class="col-md-4"><input type="text" class="form-control" value="${result.player.playerExtendData.pvpAttackTruePlayerCount }战${result.player.playerExtendData.pvpAttackTruePlayerWinCount }胜，获胜率${result.player.playerExtendData.pvpAttackTruePlayerWinRate }" readonly /></div>
											</div>
											<div class="form-group">
												<label class="control-label col-md-2"><tt:i18n name="pvpDefenceSummary"/></label>
												<div class="col-md-4"><input type="text" class="form-control" value="${result.player.playerExtendData.pvpDefenceCount }战${result.player.playerExtendData.pvpDefenceWinCount }胜，获胜率${result.player.playerExtendData.pvpDefenceWinRate }" readonly /></div>
												<label class="control-label col-md-2"><tt:i18n name="pveMaxPoint"/></label>
												<div class="col-md-4"><input type="text" class="form-control" value="${result.player.playerExtendData.maxPointId }关卡${result.player.playerExtendData.pointStar }星" readonly /></div>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
	
</body>
<!-- END BODY -->
</html>