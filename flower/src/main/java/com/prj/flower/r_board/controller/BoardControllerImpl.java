package com.prj.flower.r_board.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.prj.flower.common.base.BaseController;
import com.prj.flower.common.file.FileDownloadController;
import com.prj.flower.member.vo.MemberVO;
import com.prj.flower.r_board.service.BoardService;
import com.prj.flower.r_board.vo.ReviewVO;

import net.coobird.thumbnailator.Thumbnails;



@Controller("r_boardController")
@RequestMapping(value="/review")
public class BoardControllerImpl  extends BaseController  implements BoardController {
	private static final String REVIEW_IMAGE = "C:\\shopping\\review_image";
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private ReviewVO reviewVO;
	
	

	//리뷰목록
	@Override
	@RequestMapping(value= "/reviewList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView listReviews(@RequestParam(required = false) Map<String, String> dateMap,HttpServletRequest request, HttpServletResponse response,@RequestParam(required = false)String review_star) throws Exception {
		System.out.println(review_star);
		
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		

		
		if(review_star==null || review_star.equals(0) || Integer.parseInt(review_star)==0) {
			String _section = request.getParameter("section");
			String _pageNum = request.getParameter("pageNum");
			int section = Integer.parseInt(((_section == null) ?"1" :_section));
			int pageNum = Integer.parseInt(((_pageNum == null) ?"1" :_pageNum));
			
		
			Map pagingMap = new HashMap();
			
			pagingMap.put("section", section);
			pagingMap.put("pageNum", pageNum);
			
			Map reviewsMap = boardService.listReviews(pagingMap);
			
			reviewsMap.put("section",section);
			reviewsMap.put("pageNum", pageNum);
			
			mav.addObject("reviewsMap",reviewsMap);
			
		
			
			
		}else {
			List<ReviewVO> reviewsList = boardService.selectReviewStar(review_star);
			mav.addObject("reviewsList", reviewsList);
		}
		//리뷰 스타 값이 널일경우 모든 리뷰 리스트를 반환 하고 
		//리뷰 스타 값이 있을경우는 리뷰 스타 숫자만큼의 리스트를 반환
		//mav.addObject("memberInfo",login);
		
		
		
		
		
		return mav;
	}

	//리뷰작성
	@Override
	@RequestMapping(value="/addNewReview.do" ,method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addNewReview(MultipartHttpServletRequest multipartRequest,HttpServletResponse response) throws Exception{
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String,Object> reviewMap = new HashMap<String, Object>();
		Enumeration enu=multipartRequest.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			reviewMap.put(name,value);
			System.out.println(name +": "+ value);
		}
		
		String fileName= uploadImage(multipartRequest);
		reviewMap.put("fileName", fileName);
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		String member_id = memberVO.getMember_id();
		
		String message;
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int review_no = boardService.addNewReview(reviewMap);
			//파일이름이 널이 아니거나 길이가 0이 아닐때 --> 사진올림  500적립
			//0일떄는 적립 X
			if(fileName!=null && fileName.length()!=0) {
				File srcFile = new 
				File(REVIEW_IMAGE+ "\\" + "temp"+ "\\" + fileName);
				File destDir = new File(REVIEW_IMAGE+"\\"+review_no);
				FileUtils.moveFileToDirectory(srcFile, destDir,true);
			}
				
			//boardService.addPoint(review_no);
			message = "<script>";
			message += " alert('새글을 추가했습니다.');";
			message += " location.href='"+multipartRequest.getContextPath()+"/review/reviewList.do'; ";
			message +=" </script>";
		    resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}catch(Exception e) {
			File srcFile = new File(REVIEW_IMAGE+"\\"+"temp"+"\\"+fileName);
			srcFile.delete();
			
			message = " <script>";
			message +=" alert('오류가 발생했습니다. 다시 시도해 주세요');');";
			message +=" location.href='"+multipartRequest.getContextPath()+"/review/addNewReviewForm.do'; ";
			message +=" </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}
	
	
	//리뷰보기 
	@RequestMapping(value="/viewReview.do" ,method = RequestMethod.GET)
	public ModelAndView viewReview(@RequestParam("review_no") int review_no,
                                    HttpServletRequest request, HttpServletResponse response) throws Exception{
        
		String viewName = (String)request.getAttribute("viewName");
		reviewVO=boardService.viewReview(review_no);
		
		String userId = (String) request.getSession().getAttribute("userId");
		String reviewId = review_no + "-" + userId;

		
		String id = "review_" + review_no;
	    Cookie[] cookies = request.getCookies();
	    boolean exists =false;
	    //쿠기 값이 존재할때는 true로 만든다. 밑의조건을 안탄다.
	    if(cookies != null) {
	        for(Cookie cookie : cookies) {
	            if(cookie.getName().equals(reviewId)) {
	                exists = true;
	                break;
	            }
	        }
	    }
	    if(!exists) {
	    	//쿠키 값이 존재 하지 않으면 조회수 올리고 
	    	boardService.updatecnt(review_no);
	        Cookie cookie = new Cookie(reviewId, "viewed");
	        cookie.setMaxAge(24 * 60 * 60); // 1 day
	        response.addCookie(cookie);
	    }
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("review", reviewVO);
		return mav;
	}
	
    //리뷰수정
    @RequestMapping(value="/modReview.do" ,method = {RequestMethod.POST,RequestMethod.GET})
    @ResponseBody
    public ResponseEntity modReview(MultipartHttpServletRequest multipartRequest,  
    HttpServletResponse response) throws Exception{
    multipartRequest.setCharacterEncoding("utf-8");
	Map<String,Object> reviewMap = new HashMap<String, Object>();
	Enumeration enu=multipartRequest.getParameterNames();
	while(enu.hasMoreElements()){
		String name=(String)enu.nextElement();
		String value=multipartRequest.getParameter(name);
		reviewMap.put(name,value);
		System.out.println(reviewMap.toString());
	}
	String imageFileName= uploadImage(multipartRequest);
	reviewMap.put("imageFileName", imageFileName);
	
	String review_no=(String)reviewMap.get("review_no");
	String message;
	ResponseEntity resEnt=null;
	HttpHeaders responseHeaders = new HttpHeaders();
	responseHeaders.add("Content-Type", "text/html; charset=utf-8");
    try {
       boardService.modReview(reviewMap);
       
       if(imageFileName!=null && imageFileName.length()!=0) {
         File srcFile = new File(REVIEW_IMAGE+"\\"+"temp"+"\\"+imageFileName);
         File destDir = new File(REVIEW_IMAGE+"\\"+review_no);
         FileUtils.moveFileToDirectory(srcFile, destDir, true);
         
         String originalFileName = (String)reviewMap.get("originalFileName");
         File oldFile = new File(REVIEW_IMAGE+"\\"+review_no+"\\"+originalFileName);
         oldFile.delete();
       }	
       message = "<script>";
	   message += " alert('글을 수정했습니다.');";
	   message += " location.href='"+multipartRequest.getContextPath()+"/review/reviewList.do';";
	   message +=" </script>";
       resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
    }catch(Exception e) {
      File srcFile = new File(REVIEW_IMAGE+"\\"+"temp"+"\\"+imageFileName);
      srcFile.delete();
      message = "<script>";
	  message += " alert('오류가 발생했습니다.다시 수정해주세요');";
	  message += " location.href='"+multipartRequest.getContextPath()+"/review/reviewList.do';";
	  message +=" </script>";
      resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
    }
    return resEnt;
  }
  
    //리뷰삭제
    @Override
    @RequestMapping(value="/removeReview.do" ,method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity  removeReview(@RequestParam("reviewNO") int reviewNO,
                              HttpServletRequest request, HttpServletResponse response) throws Exception{
    	System.out.println("삭제 ");
    	System.out.println(reviewNO);
    	response.setContentType("text/html; charset=UTF-8");
		String message;
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			boardService.removeReview(reviewNO);
			File destDir = new File(REVIEW_IMAGE+"\\"+reviewNO);
			FileUtils.deleteDirectory(destDir);
			
			message = "<script>";
			message += " alert('글을 삭제했습니다.');";
			message += " location.href='"+request.getContextPath()+"/review/reviewList.do';";
			message +=" </script>";
		    resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		       
		}catch(Exception e) {
			message = "<script>";
			message += " alert('작업중 오류가 발생했습니다.다시 시도해 주세요.');";
			message += " location.href='"+request.getContextPath()+"/review/reviewList.do';";
			message +=" </script>";
		    resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		    e.printStackTrace();
		}
		return resEnt;
	  }  
    
    /*
	@RequestMapping("/download")
	protected void download(@RequestParam("fileName") String fileName,
		                 	@RequestParam("goods_id") String goods_id,
			                 HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String filePath=REVIEW_IMAGE+"\\"+goods_id+"\\"+fileName;
		File image=new File(filePath);

		response.setHeader("Cache-Control","no-cache");
		response.addHeader("Content-disposition", "attachment; fileName="+fileName);
		FileInputStream in=new FileInputStream(image); 
		byte[] buffer=new byte[1024*8];
		while(true){
			int count=in.read(buffer); 
			if(count==-1)  
				break;
			out.write(buffer,0,count);
		}
		in.close();
		out.close();
	}
	
	
	@RequestMapping("/thumbnails.do")
	protected void thumbnails(@RequestParam("fileName") String fileName,
                            	@RequestParam("goods_id") String goods_id,
			                 HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String filePath=REVIEW_IMAGE+"\\"+goods_id+"\\"+fileName;
		File image=new File(filePath);
		
		if (image.exists()) { 
			Thumbnails.of(image).size(400,400).outputFormat("png").toOutputStream(out);
		}
		byte[] buffer = new byte[1024 * 8];
		out.write(buffer);
		out.close();
	}
  */

	//한개 이미지 업로드하기
	private String uploadImage(MultipartHttpServletRequest multipartRequest) throws Exception{
		String imageFileName= null;
		Iterator<String> fileNames = multipartRequest.getFileNames();
		
		while(fileNames.hasNext()){
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			imageFileName=mFile.getOriginalFilename();
			File file = new File(REVIEW_IMAGE +"\\"+"temp"+"\\" + fileName);
			if(mFile.getSize()!=0){ //File Null Check
				if(!file.exists()){ //경로상에 파일이 존재하지 않을 경우
					file.getParentFile().mkdirs();  //경로에 해당하는 디렉토리들을 생성
					mFile.transferTo(new File(REVIEW_IMAGE +"\\"+"temp"+ "\\"+imageFileName)); //임시로 저장된 multipartFile을 실제 파일로 전송
				}
			}
			
		}
		return imageFileName;
	}
	
	@RequestMapping(value = "/*Form.do", method =  RequestMethod.GET)
	private ModelAndView form(@RequestParam(value= "result", required=false) String result,
			  @RequestParam(value= "action", required=false) String action,HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		HttpSession session = request.getSession();
		session.setAttribute("action", action);
		String str = (String)session.getAttribute("action");
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",result);
		System.out.println(result);
		System.out.println(action);
		mav.setViewName(viewName);
		return mav;
	}
	
	
	/*
	 * reviewsList
	*/
	//goods_id로 리뷰조회
	@Override
	@ResponseBody
	@RequestMapping(value = "/selectGoodsid.do" ,method = RequestMethod.POST,produces = "application/json")
	public  List selectGoodsid(@RequestParam("goods_id")int goods_id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		System.out.println("selectGoodsid 컨트롤러  : " + goods_id);
		List<ReviewVO> reviewsList = boardService.selectGoodsid(goods_id);
		System.out.println(reviewsList.toString());
		return reviewsList;
}
	
	
}