package server.web.system;

import gamecore.AbstractSystem;
import gamecore.db.DaoFactory;
import gamecore.util.Paging;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONArray;

import server.web.bean.BlackPlayer;
import server.web.dao.BlackPlayerDao;

public class BlacklistSystem extends AbstractSystem {
	public static HashSet<Long> addBlacklist;
	public static HashSet<Long> removeBlacklist;

	@Override
	public boolean startup() {
		addBlacklist = new HashSet<>();
		removeBlacklist = new HashSet<>();
		return true;
	}

	@Override
	public void shutdown() {

	}

	/**
	 * 添加黑名单
	 * @param notice
	 */
	public void addBlackPlayer(BlackPlayer blackPlayer) {
		BlackPlayerDao blackPlayerDao = DaoFactory.getInstance().borrowBlackPlayerDao();
		blackPlayerDao.addBlackPlayer(blackPlayer);
		DaoFactory.getInstance().returnBlackPlayerDao(blackPlayerDao);

		addBlacklist.add(blackPlayer.getPlayerId());
	}
	
	/**
	 * 获取完整的黑名单
	 * @return
	 */
	public JSONArray getAllBlacklist(){
		JSONArray array = new JSONArray();
		
		BlackPlayerDao blackPlayerDao = DaoFactory.getInstance().borrowBlackPlayerDao();
		List<Map<String, Object>> list = blackPlayerDao.readBlacklist();
		DaoFactory.getInstance().returnBlackPlayerDao(blackPlayerDao);
		
		if(list != null && !list.isEmpty()){
			for(Map<String, Object> map : list){
				long playerId = ((BigInteger)map.get("player_id")).longValue();
				array.add(playerId);
			}
		}
		
		return array;
	}

	/**
	 * 获取黑名单
	 * @param playerId
	 * @return
	 */
	public BlackPlayer getBlackPlayer(Long playerId) {
		BlackPlayer blackPlayer = null;

		if (playerId == null) {
			return null;
		}

		BlackPlayerDao blackPlayerDao = DaoFactory.getInstance().borrowBlackPlayerDao();
		Map<String, Object> map = blackPlayerDao.readBlackPlayer(playerId);
		DaoFactory.getInstance().returnBlackPlayerDao(blackPlayerDao);

		if (map != null) {
			long t = ((BigInteger) map.get("t")).longValue();

			blackPlayer = new BlackPlayer(playerId, t);
		}

		return blackPlayer;
	}

	/**
	 * 分页获取黑名单
	 * @param begin
	 * @param rowNum
	 * @return
	 */
	public Paging getBlackPlayers(int begin, int rowNum) {
		BlackPlayerDao blackPlayerDao = DaoFactory.getInstance().borrowBlackPlayerDao();
		List<Map<String, Object>> list = blackPlayerDao.readBlacklist(begin - 1, rowNum);
		DaoFactory.getInstance().returnBlackPlayerDao(blackPlayerDao);

		Integer records = null;
		List<Map<String, Object>> rows = new ArrayList<>();
		if (list != null && !list.isEmpty()) {
			for (Map<String, Object> map : list) {
				if (records == null) {
					records = ((Long) map.get("records")).intValue();
				}
				long playerId = ((BigInteger) map.get("player_id")).longValue();
				long t = ((BigInteger) map.get("t")).longValue();

				BlackPlayer blackPlayer = new BlackPlayer(playerId, t);
				rows.add(blackPlayer.toMap());
			}
		}

		Paging paging = new Paging(records, rowNum, begin, rows);

		return paging;
	}

	public void deleteBlackPlayer(Long playerId) {
		BlackPlayerDao noticeDao = DaoFactory.getInstance().borrowBlackPlayerDao();
		noticeDao.deleteBlackPlayer(playerId);
		DaoFactory.getInstance().returnBlackPlayerDao(noticeDao);

		if(addBlacklist.contains(playerId)){
			addBlacklist.remove(playerId);
		}else{
			removeBlacklist.add(playerId);
		}
	}

	public HashSet<Long> takeAddBlacklist() {
		return addBlacklist;
	}

	public void clearAddBlacklist() {
		addBlacklist.clear();
	}
	
	public HashSet<Long> takeRemoveBlacklist() {
		return removeBlacklist;
	}

	public void clearRemoveBlacklist() {
		removeBlacklist.clear();
	}

}
