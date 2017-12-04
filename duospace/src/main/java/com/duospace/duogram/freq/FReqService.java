package com.duospace.duogram.freq;

import java.util.List;
import java.util.Map;

public interface FReqService {
	public int insertFResp(FReq dto);
	public List<FReq> listFReq(Map<String, Object> map);
	public int fReqDataCount(Map<String, Object> map);
	public FReq readFReq(Map<String, Object> map);
	public int deleteFReq(FReq dto);
	
	public int insertFReq(FReq dto);
	public int deleteFResp(FReq dto);
	public int deleteFreind(FReq dto);
}
