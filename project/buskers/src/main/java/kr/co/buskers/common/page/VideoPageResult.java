package kr.co.buskers.common.page;

public class VideoPageResult {
	private int pageNo;
	private int count;
	private int beginPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	public VideoPageResult(int pageNo, int count) {
		this.pageNo = pageNo;
		this.count = count;
		setPageInfo();
	}
	
	private void setPageInfo() {
		int lastPage = (count % 6 == 0) ? count / 6
				                         : count / 6 + 1;
		int tabSize = 6;
		int currTab = (pageNo -1) / tabSize + 1; 
		
		beginPage = (currTab -1) * tabSize + 1;
		endPage = (currTab * tabSize > lastPage) ? lastPage 
				                                     : currTab * tabSize;
		prev = beginPage != 1;
		next = endPage != lastPage;
	}

	public int getPageNo() {
		return pageNo;
	}

	public int getCount() {
		return count;
	}

	public int getBeginPage() {
		return beginPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public boolean isNext() {
		return next;
	}
}











