package Service;

import DAO.TestDAO;
import DTO.MemberDTO;

public class MemberUpdateService {

	public MemberDTO mupdate(String mid) {
		MemberDTO mDTO = new MemberDTO();
		
		TestDAO tDAO = new TestDAO();
		tDAO.dbConnection();
		mDTO = tDAO.memberUpdate(mid);
		tDAO.dbClose();
		return mDTO;
	}

}
