package mybean.data;
public class Borrow_Bean{
	String[] columnname;         //列名
	String[][]tablerecord=null; //查询到的记录
		int pagesize=5;       //每页显示记录数目
		int totalpages=1;       //分页后总页数
		int currentpage=1;     //当前显示页
	public void setTablerecord(String[][] s){
			tablerecord=s;
			}
	public String[][] getTablerecord(){
				return tablerecord;
				}
	public void setColumnname(String[] s){
			columnname=s;
			}
	public String[] getColumnname(){
				return columnname;
				}
		public void setPagesize(int s){
			pagesize=s;
			}
		public int  getPagesize(){
				return pagesize;
				}
		public void setTotalpages(int s){
			totalpages=s;
			}
		public int  getTotalpages(){
				return totalpages;
				}
		public void setCurrentpage(int s){
			currentpage=s;
			}
		public int  getCurrentpage(){
				return currentpage;
				}
	
	}