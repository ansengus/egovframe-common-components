package egovframework.com.cmm.filter;

/**
 * HTMLTagFilter whiteList처리를 위한 Test Class 구현
 * @author 표준프레임워크 신용호
 * @since 2019.01.31
 * @version 3.8
 * @see
 * <pre>
 *
 *  수정일              수정자          수정내용
 *  ----------  --------  ---------------------------
 *  2019.01.31  신용호          최초 생성
 *
 * </pre>
 */

public class TestWhiteListTagV2 {

	// Tag 화이트 리스트 ( 허용할 태그 등록 )
	static private String[] whiteListTag = { "<p>","</p>","<script>","</script>","<a>","</a>" };
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		String paramData = ">Hello world<p>test</p>"
						+"<script type='javascript'>alert('OK');</script>"
						+"<a href='http://www.abc.com'>mypage</a><br>"
						+"<a href='http://www.img.com'><img src='http://test.img.com'></a>"
						+ "Good day~!<";
		System.out.println("paramData = "+paramData);
		String safeParamData = getSafeParamData(paramData);
		System.out.println("safeParamData = "+safeParamData);
		
	}

	static private String getSafeParamData(String value) {
		StringBuffer strBuff = new StringBuffer();

		for (int i = 0; i < value.length(); i++) {
			char c = value.charAt(i);
			switch (c) {
			case '<':
				if ( checkNextWhiteListTag(i, value) == false )
					strBuff.append("&lt;");
				else 
					strBuff.append(c);
				System.out.println("checkNextWhiteListTag = "+checkNextWhiteListTag(i, value));
				break;
			case '>':
				if ( checkPrevWhiteListTag(i, value) == false )
					strBuff.append("&gt;");
				else 
					strBuff.append(c);
				System.out.println("checkPrevWhiteListTag = "+checkPrevWhiteListTag(i, value));
				break;
			//case '&':
			//	strBuff.append("&amp;");
			//	break;
			case '"':
				strBuff.append("&quot;");
				break;
			case '\'':
				strBuff.append("&apos;");
				break;	
			default:
				strBuff.append(c);
				break;
			}
		}
		
		value = strBuff.toString();
		return value;
	}

	static private boolean checkNextWhiteListTag(int index, String data) {
		System.out.println("[checkNextWhiteListTag]---------------------------------------------");
		String extractData = searchTagForward(index, data);
		System.out.println("checkNextWhiteListTag FIND = "+extractData);
		
		int resultIndex = 0;
		String compareString = "";
		for(String whiteListData: whiteListTag) {
		    System.out.println("===>>> whiteListData="+whiteListData);
		    compareString = whiteListData.substring(0, whiteListData.length()-1);
		    System.out.println("===>>> whiteListData compare String ="+compareString);
		    resultIndex = extractData.indexOf(compareString);
		    System.out.println("===>>> resultIndex ="+resultIndex);
			if ( resultIndex == 0 )
		    	return true;
		}
		
		return false;
	}
	
	static private boolean checkPrevWhiteListTag(int index, String data) {
		System.out.println("[checkPrevWhiteListTag]---------------------------------------------");
		String extractData = searchTagBackward(index, data);
		System.out.println("checkPrevWhiteListTag FIND = "+extractData);
		
		int resultIndex = 0;
		String compareString = "";
		for(String whiteListData: whiteListTag) {
		    System.out.println("===>>> whiteListData="+whiteListData);
		    compareString = whiteListData.substring(0, whiteListData.length()-1);
		    System.out.println("===>>> whiteListData compare String ="+compareString);
		    
		    resultIndex = extractData.indexOf(compareString);
		    System.out.println("===>>> resultIndex ="+resultIndex);
			if ( resultIndex == 0 )
		    	return true;
		}
		
		return false;
	}
	
	static private String searchTagForward(int index, String data) {
		int endIndex = data.indexOf(">", index);
		if ( endIndex < 0 )
			System.out.println("===>>> searchTagForward TAG= NOT FOUND");
		else {
			System.out.println("===>>> searchTagForward TAG="+data.substring(index,endIndex+1));
			return data.substring(index,endIndex+1);
		}
		return "";
	}
	
	static private String searchTagBackward(int index, String data) {
		int beginIndex = data.lastIndexOf("<", index);
		if ( beginIndex < 0 )
			System.out.println("===>>> searchTagBackward TAG= NOT FOUND");
		else {
			System.out.println("===>>> searchTagBackward TAG="+data.substring(beginIndex,index+1));
			return data.substring(beginIndex,index+1);
		}
		return "";
	}
	
}
