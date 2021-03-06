package qna.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import qna.bean.QnaDTO;

@Repository
public class QnaDAO {
	@Autowired
	private SqlSessionTemplate sqlsession;
	
	public int qnaWrite(QnaDTO qnaDTO) {
		return sqlsession.insert("mybatis.qnaMapper.insertQna",qnaDTO);
	}
	
	public List<Object> qnaList(int startNum,int endNum){
		Map<String, Integer> map = new HashMap<String,Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		return sqlsession.selectList("mybatis.qnaMapper.getQnaList",map);
	}
	
	public List<Object> qnaListD(String code2){
		return sqlsession.selectList("mybatis.qnaMapper.getQnaListD");
	}
	
	public int getTotalA(String koreanName) {
		return sqlsession.selectOne("mybatis.qnaMapper.getQnaTotal",koreanName);
	}
	
	public int getTotalC(String koreanName) {
		return sqlsession.selectOne("mybatis.qnaMapper.getQnaTotal",koreanName);
	}
	
	public QnaDTO qnaView(int seq) {
		return sqlsession.selectOne("mybatis.qnaMapper.getQnaOne",seq);
	}
	
	public int qnaDelete(int seq) {
		return sqlsession.delete("mybatis.qnaMapper.deleteQna",seq);
	}
	
	public QnaDTO qnaModifyForm(int seq) {
		return sqlsession.selectOne("mybatis.qnaMapper.getQnaOne",seq);
	}
	
	public int qnaModify(QnaDTO qnaDTO) {
		return sqlsession.update("mybatis.qnaMapper.updateQna",qnaDTO);
	}

}
