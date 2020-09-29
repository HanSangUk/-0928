package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import DB.DBConnection;
import DTO.MemberDTO;
import DTO.BoardDTO;
import DTO.CommentDTO;


public class TestDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public void dbConnection() {
		con = DBConnection.getConnection();
	}

	public void dbClose() {
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void pstmtClose() {
		try {
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void rsClose() {
		try {
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public boolean Login(MemberDTO mDTO) {
		String sql = "SELECT * FROM MEMBER WHERE MID=? AND MPASSWORD=?";
		boolean boo = false;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mDTO.getMid());
			pstmt.setString(2, mDTO.getMpassword());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				boo = true;
			} else {
				boo = false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			pstmtClose();
			rsClose();
		}
		return boo;
	}

	public int Join(MemberDTO mDTO) {
		String sql = "INSERT INTO MEMBER(MFILE, MID, MPASSWORD, MNAME, MGENDER, MPHONE, MEMAIL, MBIRTH, MADDRESS1, MADDRESS2, MADDRESS3, MADDRESS4) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
		int result = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mDTO.getMfile());
			pstmt.setString(2, mDTO.getMid());
			pstmt.setString(3, mDTO.getMpassword());
			pstmt.setString(4, mDTO.getMname());
			pstmt.setString(5, mDTO.getMgender());
			pstmt.setString(6, mDTO.getMphone());
			pstmt.setString(7, mDTO.getMemail());
			pstmt.setDate(8, mDTO.getMbirth());
			pstmt.setString(9, mDTO.getMaddress1());
			pstmt.setString(10, mDTO.getMaddress2());
			pstmt.setString(11, mDTO.getMaddress3());
			pstmt.setString(12, mDTO.getMaddress4());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}  finally {
			pstmtClose();
		}
		return result;
	}

	public int write(BoardDTO bDTO) {
		String sql = "INSERT INTO BOARD(BKATEGORIE,BNUMBER, BTITLE, BWRITER, BCONTENTS, BFILE, BDATE, BHITS, BTAG1, BTAG2) "
				+ "VALUES(?,BOARD_SEQ.nextval,?,?,?,?,SYSDATE,0,?,?)";
		int result = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bDTO.getBkategorie());
			pstmt.setString(2, bDTO.getBtitle());
			pstmt.setString(3, bDTO.getBwriter());
			pstmt.setString(4, bDTO.getBcontents());
			pstmt.setString(5, bDTO.getBfile());
			pstmt.setString(6, bDTO.getBtag1());
			pstmt.setString(7, bDTO.getBtag2());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}  finally {
			pstmtClose();
		}
		return result;
	}
	
	public BoardDTO boardView(int bnumber) {
		String sql = "SELECT * FROM BOARD WHERE BNUMBER=?";
		BoardDTO bDTO = null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bnumber);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bDTO = new BoardDTO();
				bDTO.setBkategorie(rs.getString("BKATEGORIE"));
				bDTO.setBfile(rs.getNString("BFILE"));
				bDTO.setBnumber(rs.getInt("BNUMBER"));
				bDTO.setBwriter(rs.getString("BWRITER"));
				bDTO.setBtitle(rs.getString("BTITLE"));
				bDTO.setBcontents(rs.getString("BCONTENTS"));
				bDTO.setBdate(rs.getDate("BDATE"));
				bDTO.setBhits(rs.getInt("BHITS"));
				bDTO.setBtag1(rs.getString("BTAG1"));
				bDTO.setBtag2(rs.getString("BTAG2"));
				bDTO.setBtag3(rs.getString("BTAG3"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			pstmtClose();
			rsClose();
		}
		return bDTO;
	}

	public void hitsup(int to) {
		String sql = "UPDATE BOARD SET BHITS=BHITS+1 WHERE BNUMBER=?";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, to);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			pstmtClose();
		}
		
	}

	public BoardDTO Update(int bnumber) {
		String sql = "SELECT * FROM BOARD WHERE BNUMBER=?";
		BoardDTO bDTO = null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bnumber);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bDTO = new BoardDTO();
				bDTO.setBkategorie(rs.getString("BKATEGORIE"));
				bDTO.setBfile(rs.getString("BFILE"));
				bDTO.setBnumber(rs.getInt("BNUMBER"));
				bDTO.setBwriter(rs.getString("BWRITER"));
				bDTO.setBtitle(rs.getString("BTITLE"));
				bDTO.setBcontents(rs.getString("BCONTENTS"));
				bDTO.setBdate(rs.getDate("BDATE"));
				bDTO.setBhits(rs.getInt("BHITS"));
				bDTO.setBtag1(rs.getString("BTAG1"));
				bDTO.setBtag2(rs.getString("BTAG2"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			pstmtClose();
		}
		return bDTO;
	}

	public int UpdateProcess(BoardDTO bDTO) {
		String sql = "UPDATE BOARD SET BTITLE=?, BFILE=?, BCONTENTS=?, BTAG1=?, BTAG2=? WHERE BNUMBER=?";
		int result = 0;
		int bnumber = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bDTO.getBtitle());
			pstmt.setString(2, bDTO.getBfile());
			pstmt.setString(3, bDTO.getBcontents());
			pstmt.setString(4, bDTO.getBtag1());
			pstmt.setString(5, bDTO.getBtag2());
			pstmt.setInt(6, bDTO.getBnumber());
			result = pstmt.executeUpdate();
			if(result>0) {
				bnumber = bDTO.getBnumber();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			pstmtClose();
		}
		return bnumber;
	}

	public int Delete(int bnumber) {
		String sql = "DELETE FROM BOARD WHERE BNUMBER=?";
		int result = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bnumber);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			pstmtClose();
		}
		return result;
	}

	public List<BoardDTO> serch(String btitle) {
		String sql = "SELECT * FROM BOARD WHERE BTITLE LIKE ?";
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		BoardDTO bDTO = null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+btitle+"%");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				bDTO = new BoardDTO();
				bDTO.setBnumber(rs.getInt("BNUMBER"));
				bDTO.setBtitle(rs.getString("BTITLE"));
				bDTO.setBhits(rs.getInt("BHITS"));
				bDTO.setBwriter(rs.getString("BWRITER"));
				list.add(bDTO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			pstmtClose();
			rsClose();
		}
		return list;
	}

	// 페이지 번호와 관련된 정보 등을 결정하기 위한 메소드 호출
	public int listCount(String listpaging) {
		String sql = "SELECT COUNT(BNUMBER) FROM BOARDLIST B WHERE BKATEGORIE = ?";
		int listCount = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, listpaging);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				listCount = rs.getInt(1);
				// 처음 조회(SELECT)된 값
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			pstmtClose();
			rsClose();
		}
		return listCount;
	}
	
	// 클릭한 페이지에 필요한 글만 가져오기 위한 메소드 호출
	public List<BoardDTO> boardListPaging(int startRow, int endRow, String listpaging) {
		String sql = "SELECT * FROM (SELECT B.*, ROW_NUMBER() OVER(ORDER BY BNUMBER DESC) AS RN FROM BOARD B WHERE BKATEGORIE = ?) WHERE RN BETWEEN ? AND ?";
		List<BoardDTO> boardList = new ArrayList<BoardDTO>();
		BoardDTO board = null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, listpaging);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				board = new BoardDTO();
				board.setBfile(rs.getString("BFILE"));
				board.setBnumber(rs.getInt("BNUMBER"));
				board.setBwriter(rs.getString("BWRITER"));
				board.setBtitle(rs.getString("BTITLE"));
				board.setBcontents(rs.getString("BCONTENTS"));
				board.setBdate(rs.getDate("BDATE"));;
				board.setBhits(rs.getInt("BHITS"));
				board.setBtag1(rs.getString("BTAG1"));
				board.setBtag2(rs.getString("BTAG2"));
				boardList.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			pstmtClose();
			rsClose();
		}
		return boardList;
	}

	public List<MemberDTO> memberlist() {
		String sql = "SELECT * FROM MEMBER";
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		MemberDTO mDTO = null;
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				mDTO = new MemberDTO();
				mDTO.setMid(rs.getString("MID"));
				mDTO.setMname(rs.getString("MNAME"));
				mDTO.setMgender(rs.getString("MGENDER"));
				list.add(mDTO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			pstmtClose();
			rsClose();
		}
		return list;
	}

	public int memberdelete(String mid) {
		String sql = "DELETE FROM MEMBER WHERE MID=?";
		System.out.println(mid);
		int result = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mid);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			pstmtClose();
		}
		return result;
	}

	public MemberDTO memberUpdate(String mid) {
		String sql = "SELECT * FROM MEMBER WHERE MID=?";
		MemberDTO mDTO = null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				mDTO = new MemberDTO();
				mDTO.setMfile(rs.getString("MFILE"));
				mDTO.setMid(rs.getString("MID"));
				mDTO.setMpassword(rs.getString("MPASSWORD"));
				mDTO.setMname(rs.getString("MNAME"));
				mDTO.setMphone(rs.getString("MPHONE"));
				mDTO.setMemail(rs.getString("MEMAIL"));
				mDTO.setMaddress1(rs.getString("MADDRESS1"));
				mDTO.setMaddress2(rs.getString("MADDRESS2"));
				mDTO.setMaddress3(rs.getString("MADDRESS3"));
				mDTO.setMaddress4(rs.getString("MADDRESS4"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			pstmtClose();
			rsClose();
		}
		return mDTO;
	}

	public int memberupdateprocess(MemberDTO mDTO) {
		String sql = "UPDATE MEMBER SET MFILE=?, MPASSWORD=?, MNAME=?, MPHONE=?, MEMAIL=?, MADDRESS1=?, MADDRESS2=?, MADDRESS3=?, MADDRESS4=? WHERE MID=?";
		int result = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mDTO.getMfile());
			pstmt.setString(2, mDTO.getMpassword());
			pstmt.setString(3, mDTO.getMname());
			pstmt.setString(4, mDTO.getMphone());
			pstmt.setString(5, mDTO.getMemail());
			pstmt.setString(6, mDTO.getMaddress1());
			pstmt.setString(7, mDTO.getMaddress2());
			pstmt.setString(8, mDTO.getMaddress3());
			pstmt.setString(9, mDTO.getMaddress4());
			pstmt.setString(10, mDTO.getMid());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			pstmtClose();
		}
		return result;
	}

	public MemberDTO memberview(String mid) {
		String sql = "SELECT * FROM MEMBER WHERE MID=?";
		MemberDTO view = null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				view = new MemberDTO();
				view.setMfile(rs.getString("MFILE"));
				view.setMid(rs.getString("MID"));
				view.setMname(rs.getString("MNAME"));
				view.setMgender(rs.getString("MGENDER"));
				view.setMphone(rs.getString("MPHONE"));
				view.setMemail(rs.getString("MEMAIL"));
				view.setMaddress1(rs.getString("MADDRESS1"));
				view.setMaddress2(rs.getString("MADDRESS2"));
				view.setMaddress3(rs.getString("MADDRESS3"));
				view.setMaddress4(rs.getString("MADDRESS4"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}  finally {
			pstmtClose();
			rsClose();
		}
		return view;
	}

	public List<BoardDTO> boardPaging(int startRow, int endRow, String btitle, String listpaging) {
		String sql = "SELECT * FROM (SELECT B.*, ROW_NUMBER() OVER(ORDER BY BNUMBER DESC) AS RN FROM BOARD B WHERE BTITLE LIKE ?) WHERE RN BETWEEN ? AND ? AND BKATEGORIE = ?";
		List<BoardDTO> boardList = new ArrayList<BoardDTO>();
		BoardDTO board = null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+btitle+"%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			pstmt.setString(4, listpaging);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				board = new BoardDTO();
				board.setBfile(rs.getString("BFILE"));
				board.setBnumber(rs.getInt("BNUMBER"));
				board.setBwriter(rs.getString("BWRITER"));
				board.setBtitle(rs.getString("BTITLE"));
				board.setBcontents(rs.getString("BCONTENTS"));
				board.setBdate(rs.getDate("BDATE"));;
				board.setBhits(rs.getInt("BHITS"));
				board.setBtag1(rs.getString("BTAG1"));
				board.setBtag2(rs.getString("BTAG2"));
				boardList.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			pstmtClose();
			rsClose();
		}
		return boardList;
	}
	
	// 페이지 번호와 관련된 정보 등을 결정하기 위한 메소드 호출
		public int serchCount(String btitle, String listpaging) {
			String sql = "SELECT COUNT(BNUMBER) FROM BOARDLIST B WHERE BTITLE LIKE ? AND BKATEGORIE = ?";
			int listCount = 0;
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+btitle+"%");
				pstmt.setString(2, listpaging);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					listCount = rs.getInt(1);
					// 처음 조회(SELECT)된 값
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				pstmtClose();
				rsClose();
			}
			return listCount;
		}

		public List<BoardDTO> boardPaging2(int startRow, int endRow, String btitle, String listpaging) {
			String sql = "SELECT * FROM (SELECT B.*, ROW_NUMBER() OVER(ORDER BY BNUMBER DESC) AS RN FROM BOARD B WHERE BWRITER LIKE ?) WHERE RN BETWEEN ? AND ? AND BKATEGORIE = ?";
			List<BoardDTO> boardList = new ArrayList<BoardDTO>();
			BoardDTO board = null;
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+btitle+"%");
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
				pstmt.setString(4, listpaging);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					board = new BoardDTO();
					board.setBfile(rs.getString("BFILE"));
					board.setBnumber(rs.getInt("BNUMBER"));
					board.setBwriter(rs.getString("BWRITER"));
					board.setBtitle(rs.getString("BTITLE"));
					board.setBcontents(rs.getString("BCONTENTS"));
					board.setBdate(rs.getDate("BDATE"));;
					board.setBhits(rs.getInt("BHITS"));
					boardList.add(board);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				pstmtClose();
				rsClose();
			}
			return boardList;
		}

		public int serchCount2(String btitle, String listpaging) {
			String sql = "SELECT COUNT(BNUMBER) FROM BOARDLIST B WHERE BWRITER LIKE ? AND BKATEGORIE = ?";
			int listCount = 0;
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+btitle+"%");
				pstmt.setString(2, listpaging);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					listCount = rs.getInt(1);
					// 처음 조회(SELECT)된 값
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				pstmtClose();
				rsClose();
			}
			return listCount;
		}

		public List<BoardDTO> mainlist() {
			String sql = "SELECT * FROM BOARD ORDER BY BHITS DESC";
			List<BoardDTO> mlist = new ArrayList<BoardDTO>();
			BoardDTO bDTO = null;
			try {
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					bDTO = new BoardDTO();
					bDTO.setBfile(rs.getString("BFILE"));
					bDTO.setBtitle(rs.getString("BTITLE"));
					bDTO.setBwriter(rs.getString("BWRITER"));
					bDTO.setBnumber(rs.getInt("BNUMBER"));
					bDTO.setBtag1(rs.getString("BTAG1"));
					bDTO.setBtag2(rs.getString("BTAG2"));
					mlist.add(bDTO);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				pstmtClose();
				rsClose();
			}
			return mlist;
		}

		public String bkategorie(int bnumber) {
			String sql = "SELECT BKATEGORIE FROM BOARD WHERE BNUMBER=?";
			String bk = null;
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, bnumber);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					bk = rs.getString("BKATEGORIE");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				pstmtClose();
				rsClose();
			}
			return bk;
		}

		public List<MemberDTO> memberListPaging(int startRow, int endRow) {
			String sql = "SELECT * FROM MEMBERLIST WHERE RN BETWEEN ? AND ?";
			List<MemberDTO> memberList = new ArrayList<MemberDTO>();
			MemberDTO member = null;
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					member = new MemberDTO();
					member.setMfile(rs.getString("MFILE"));
					member.setMid(rs.getString("MID"));
					member.setMname(rs.getString("MNAME"));
					member.setMgender(rs.getString("MGENDER"));
					member.setMaddress1(rs.getString("MADDRESS1"));
					member.setMaddress2(rs.getString("MADDRESS2"));
					member.setMaddress3(rs.getString("MADDRESS3"));
					member.setMaddress4(rs.getString("MADDRESS4"));
					member.setMphone(rs.getString("MPHONE"));
					member.setMemail(rs.getString("MEMAIL"));
					memberList.add(member);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				pstmtClose();
				rsClose();
			}
			return memberList;
		}

		public int memberlistCount() {
			String sql = "SELECT COUNT(MID) FROM MEMBERLIST";
			int listCount = 0;
			try {
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					listCount = rs.getInt(1);
					// 처음 조회(SELECT)된 값
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				pstmtClose();
				rsClose();
			}
			return listCount;
		}

		public List<BoardDTO> tagPaging(int startRow, int endRow, String btag) {
			String sql = "SELECT * FROM (SELECT B.*, ROW_NUMBER() OVER(ORDER BY BNUMBER DESC) AS RN FROM BOARD B WHERE BTAG1 = ? OR BTAG2 = ?) WHERE RN BETWEEN ? AND ?";
			List<BoardDTO> boardList = new ArrayList<BoardDTO>();
			BoardDTO board = null;
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, btag);
				pstmt.setString(2, btag);
				pstmt.setInt(3, startRow);
				pstmt.setInt(4, endRow);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					board = new BoardDTO();
					board.setBfile(rs.getString("BFILE"));
					board.setBnumber(rs.getInt("BNUMBER"));
					board.setBwriter(rs.getString("BWRITER"));
					board.setBtitle(rs.getString("BTITLE"));
					board.setBcontents(rs.getString("BCONTENTS"));
					board.setBdate(rs.getDate("BDATE"));;
					board.setBhits(rs.getInt("BHITS"));
					board.setBtag1(rs.getString("BTAG1"));
					board.setBtag2(rs.getString("BTAG2"));
					boardList.add(board);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				pstmtClose();
				rsClose();
			}
			return boardList;
		}

		public int tagCount(String btag) {
			String sql = "SELECT COUNT(BNUMBER) FROM BOARDLIST B WHERE BTAG1 = ? OR BTAG2 = ?";
			int listCount = 0;
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, btag);
				pstmt.setString(2, btag);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					listCount = rs.getInt(1);
					// 처음 조회(SELECT)된 값
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				pstmtClose();
				rsClose();
			}
			return listCount;
		}

		public List<CommentDTO> boardViewComment(int bnumber) {
			String sql = "SELECT * FROM BOARD_COMMENT WHERE BNUMBER=?";
			List<CommentDTO> clist = new ArrayList<CommentDTO>();
			CommentDTO cDTO = null;
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, bnumber);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					cDTO = new CommentDTO();
					cDTO.setCnumber(rs.getInt("CNUMBER"));
					cDTO.setBnumber(rs.getInt("BNUMBER"));
					cDTO.setMid(rs.getString("MID"));
					cDTO.setContent(rs.getString("CONTENT"));
					cDTO.setBdate(rs.getDate("BDATE"));
					clist.add(cDTO);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				pstmtClose();
				rsClose();
			}
			return clist;
		}

		public int commentinsert(CommentDTO cDTO) {
			String sql = "INSERT INTO BOARD_COMMENT(CNUMBER, BNUMBER, MID, BDATE, CONTENT)VALUES(COMMENT_SEQ.NEXTVAL,?,?,SYSDATE,?)";
			int result = 0;
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, cDTO.getBnumber());
				pstmt.setString(2, cDTO.getMid());
				pstmt.setString(3, cDTO.getContent());
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				pstmtClose();
			} 
			return result;
		}

		public int commentdelete(int cnumber) {
			String sql = "DELETE FROM BOARD_COMMENT WHERE CNUMBER=?";
			int result = 0;
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, cnumber);
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				pstmtClose();
			} 
			return result;
		}

}
