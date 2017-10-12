package utils;

import java.util.ArrayList;
import java.util.List;

public class PageBean<T> {
	private int pageNum = 1; // 当前显示的页码
	private int totalPages = 1; // 总页数（计算出来的）
	private int pageSize = MyConstant.PAGE_SIZE; // 每页记录数（常量赋值）
	private int totalRecords = 0; // 总记录数，根据count(*)得到的
	private boolean havePrePage = false; // 是否有上一页
	private boolean haveNextPage = false; // 是否有下一页
	private List<T> pageDatas = new ArrayList<T>();// 每页显示的数据

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

	public boolean isHavePrePage() {//判断是否有上一页这两个属性不用getter
		if(this.pageNum>1)
			return true;
		else 
			return false;
	}

	public boolean isHaveNextPage() {//判断是否有下一页
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
