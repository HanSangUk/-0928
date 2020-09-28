package DTO;

import java.sql.Date;

public class MemberDTO {
	private String mfile;
	private String mid;
	private String mpassword;
	private String mname;
	private String mgender;
	private String mphone;
	private String memail;
	private Date mbirth;
	private String maddress1;
	private String maddress2;
	private String maddress3;
	private String maddress4;
	
	
	public String getMfile() {
		return mfile;
	}
	public void setMfile(String mfile) {
		this.mfile = mfile;
	}
	public Date getMbirth() {
		return mbirth;
	}
	public void setMbirth(Date mbirth) {
		this.mbirth = mbirth;
	}
	public String getMaddress1() {
		return maddress1;
	}
	public void setMaddress1(String maddress1) {
		this.maddress1 = maddress1;
	}
	public String getMaddress2() {
		return maddress2;
	}
	public void setMaddress2(String maddress2) {
		this.maddress2 = maddress2;
	}
	public String getMaddress3() {
		return maddress3;
	}
	public void setMaddress3(String maddress3) {
		this.maddress3 = maddress3;
	}
	public String getMaddress4() {
		return maddress4;
	}
	public void setMaddress4(String maddress4) {
		this.maddress4 = maddress4;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpassword() {
		return mpassword;
	}
	public void setMpassword(String mpassword) {
		this.mpassword = mpassword;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMgender() {
		return mgender;
	}
	public void setMgender(String mgender) {
		this.mgender = mgender;
	}
	public String getMphone() {
		return mphone;
	}
	public void setMphone(String mphone) {
		this.mphone = mphone;
	}
	public String getMemail() {
		return memail;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}
	
	@Override
	public String toString() {
		return "MemberDTO [mid=" + mid + ", mpassword=" + mpassword + ", mname=" + mname + ", mgender=" + mgender
				+ ", mphone=" + mphone + ", memail=" + memail + "]";
	}
	public MemberDTO(String mid, String mpassword, String mname, String mgender, String mphone, String memail) {
		super();
		this.mid = mid;
		this.mpassword = mpassword;
		this.mname = mname;
		this.mgender = mgender;
		this.mphone = mphone;
		this.memail = memail;
	}
	
	public MemberDTO() {
		
	}
	
	
}
