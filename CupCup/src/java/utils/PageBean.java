package utils;

import java.util.ArrayList;
import java.util.List;

public class PageBean<T> {
	private int pageNum = 1; // ��ǰ��ʾ��ҳ��
	private int totalPages = 1; // ��ҳ������������ģ�
	private int pageSize = MyConstant.PAGE_SIZE; // ÿҳ��¼����������ֵ��
	private int totalRecords = 0; // �ܼ�¼��������count(*)�õ���
	private boolean havePrePage = false; // �Ƿ�����һҳ
	private boolean haveNextPage = false; // �Ƿ�����һҳ
	private List<T> pageDatas = new ArrayList<T>();// ÿҳ��ʾ������

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getTotalPages() {
		return totalPages;
	}


	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
		this.totalPages = totalRecords % pageSize == 0 ? totalRecords
				/ pageSize : totalRecords / pageSize + 1;
	}

	public boolean isHavePrePage() {//�ж��Ƿ�����һҳ���������Բ���getter
		if(this.pageNum>1)
			return true;
		else 
			return false;
	}

	public boolean isHaveNextPage() {//�ж��Ƿ�����һҳ
		if(this.pageNum <this.totalPages)
			return true;
		else
			return false;
	}


	public List<T> getPageDatas() {
		return pageDatas;
	}

	public void setPageDatas(List<T> pageDatas) {
		this.pageDatas = pageDatas;
	}

	public PageBean() {
		super();
	}

}
