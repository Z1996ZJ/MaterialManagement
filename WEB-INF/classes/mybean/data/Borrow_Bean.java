package mybean.data;
public class Borrow_Bean{
	String[] columnname;         //����
	String[][]tablerecord=null; //��ѯ���ļ�¼
		int pagesize=5;       //ÿҳ��ʾ��¼��Ŀ
		int totalpages=1;       //��ҳ����ҳ��
		int currentpage=1;     //��ǰ��ʾҳ
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