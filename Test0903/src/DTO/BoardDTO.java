package DTO;

import java.sql.Date;

public class BoardDTO {
	private int bnumber;
	private String bwriter;
	private String btitle;
	private String bcontents;
	private Date bdate;
	private int bhits;
	private String bkategorie;
	private String btag1;
	private String btag2;
	private String btag3;
	// 파일이름 저장을 위한 필드 추가
	private String bfile;
	private String updatefile;
	
	
	
	public String getUpdatefile() {
		return updatefile;
	}
	public void setUpdatefile(String updatefile) {
		this.updatefile = updatefile;
	}
	public String getBkategorie() {
		return bkategorie;
	}
	public void setBkategorie(String bkategorie) {
		this.bkategorie = bkategorie;
	}
	public String getBtag1() {
		return btag1;
	}
	public void setBtag1(String btag1) {
		this.btag1 = btag1;
	}
	public String getBtag2() {
		return btag2;
	}
	public void setBtag2(String btag2) {
		this.btag2 = btag2;
	}
	public String getBtag3() {
		return btag3;
	}
	public void setBtag3(String btag3) {
		this.btag3 = btag3;
	}
	public String getBfile() {
		return bfile;
	}
	public void setBfile(String bfile) {
		this.bfile = bfile;
	}
	public int getBnumber() {
		return bnumber;
	}
	public void setBnumber(int bnumber) {
		this.bnumber = bnumber;
	}
	public String getBwriter() {
		return bwriter;
	}
	public void setBwriter(String bwriter) {
		this.bwriter = bwriter;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBcontents() {
		return bcontents;
	}
	public void setBcontents(String bcontents) {
		this.bcontents = bcontents;
	}
	
	public Date getBdate() {
		return bdate;
	}
	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}
	public int getBhits() {
		return bhits;
	}
	public void setBhits(int bhits) {
		this.bhits = bhits;
	}
	
	
	public BoardDTO(int bnumber, String bwriter, String btitle, String bcontents, Date bdate, int bhits,
			String bkategorie, String btag1, String btag2, String btag3, String bfile) {
		super();
		this.bnumber = bnumber;
		this.bwriter = bwriter;
		this.btitle = btitle;
		this.bcontents = bcontents;
		this.bdate = bdate;
		this.bhits = bhits;
		this.bkategorie = bkategorie;
		this.btag1 = btag1;
		this.btag2 = btag2;
		this.btag3 = btag3;
		this.bfile = bfile;
	}
	
	@Override
	public String toString() {
		return "BoardDTO [bnumber=" + bnumber + ", bwriter=" + bwriter + ", btitle=" + btitle + ", bcontents="
				+ bcontents + ", bdate=" + bdate + ", bhits=" + bhits + ", bkategorie=" + bkategorie + ", btag1="
				+ btag1 + ", btag2=" + btag2 + ", btag3=" + btag3 + ", bfile=" + bfile + "]";
	}
	public BoardDTO() {
		
	}
}
