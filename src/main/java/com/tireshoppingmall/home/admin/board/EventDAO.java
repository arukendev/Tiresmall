package com.tireshoppingmall.home.admin.board;

import java.io.File;
import java.math.BigDecimal;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Service
public class EventDAO {

	@Autowired
	private SqlSession ss;

	@Autowired
	private EventOption eo;

	private int allEventCount;

	@Autowired
	private ServletContext servletContext;

	public int getAllEventCount() {
		return allEventCount;
	}

	public void setAllEventCount(int allEventCount) {
		this.allEventCount = allEventCount;
	}

	public void calcAllEventCount() {
		SearchDTO sSel = new SearchDTO("", "", null, null, "", "");
		allEventCount = ss.getMapper(AdminBoardMapper.class).getEventCount(sSel);
		System.out.println(allEventCount);
	}

	public void getEvent(int pageNo, HttpServletRequest req) {
		int count = eo.getEventCountPerPage();
		int start = (pageNo - 1) * count + 1;
		int end = start + (count - 1);

		SearchDTO search = (SearchDTO) req.getSession().getAttribute("searchDTO");
		int eventCount = 0;

		if (search == null) {
			search = new SearchDTO();
			search.setStart(new BigDecimal(start));
			search.setEnd(new BigDecimal(end));
			eventCount = allEventCount;
		} else {
			search.setStart(new BigDecimal(start));
			search.setEnd(new BigDecimal(end));
			eventCount = ss.getMapper(AdminBoardMapper.class).getEventCount(search);
		}
		System.out.println(eventCount);
		System.out.println(pageNo);
		List<EventDTO> event = ss.getMapper(AdminBoardMapper.class).getEvent(search);
		int pageCount = (int) Math.ceil(eventCount / (double) count);
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("events", event);
		req.setAttribute("curPage", pageNo);
	}

	public void searchEvent(SearchDTO SearchDTO, HttpServletRequest req) {
		req.getSession().setAttribute("searchDTO", SearchDTO);
	}

	public int switchPopup(EventDTO eventDTO) {
		if (ss.getMapper(AdminBoardMapper.class).switchPopup(eventDTO) == 1) {
			return eventDTO.getE_popup();
		} else {
			return -1;
		}
	}

	public void eventDetail(EventDTO eventDTO, HttpServletRequest req) {
		eventDTO = ss.getMapper(AdminBoardMapper.class).eventDetail(eventDTO);
		req.setAttribute("detailImges", eventDTO.getE_detailimg().split("!"));
		req.setAttribute("event", eventDTO);
	}

	public int updateEvent(EventDTO eventDTO) {
		System.err.println(eventDTO.toString());
		return ss.getMapper(AdminBoardMapper.class).eventUpdate(eventDTO);
	}

	public String updateImg(MultipartHttpServletRequest mf, EventDTO eventDto) {
		Iterator<String> files = mf.getFileNames();
		String path = servletContext.getRealPath("resources/upload-event/");

		String mainimg_old = eventDto.getE_mainimg();
		String detailimg_old = eventDto.getE_detailimg();
		StringBuilder sb = new StringBuilder();
		while (files.hasNext()) {
			String uploadFile = files.next();
			MultipartFile mFile = mf.getFile(uploadFile);
			String extension =	"." + mFile.getOriginalFilename().substring(mFile.getOriginalFilename().lastIndexOf(".") + 1);
			UUID uuid = UUID.randomUUID();
			String[] uuids = uuid.toString().split("-");
			String uniqueName = uuids[0] + uuids[1] + uuids[2];
			try {
				mFile.transferTo(new File(path + uniqueName + extension));
				sb.append(uniqueName + extension + "!");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		String type = mf.getParameter("e_type");
		if (type.equals("main-btn")) {
			eventDto.setE_mainimg(sb.toString().replace("!", ""));
		} else {
			eventDto.setE_mainimg(null);
			eventDto.setE_detailimg(sb.toString());
		}

		System.out.println(sb.toString());
		System.out.println(eventDto.toString());
		if (ss.getMapper(AdminBoardMapper.class).eventUpdate(eventDto) == 1) {
			if (type.equals("main-btn")) {
				new File(path + mainimg_old).delete();
				return eventDto.getE_mainimg();
			} else {
				String[] dio = detailimg_old.split("!");
				for (String d : dio) {
					new File(path + d).delete();
				}
				return eventDto.getE_detailimg();
			}
		}
		return null;

	}

	public int deleteEvent(EventDTO eventDto, HttpServletRequest req) {
		eventDetail(eventDto, req);
		System.out.println(eventDto.toString());
		eventDto = (EventDTO) req.getAttribute("event");
		System.out.println(eventDto.toString());

		String path = servletContext.getRealPath("resources/upload-event/");
		new File(path + eventDto.getE_mainimg()).delete();
		String[] detailFiles = eventDto.getE_detailimg().split("!");
		for (int i = 0; i < detailFiles.length; i++) {
			new File(path + detailFiles[i]).delete();
		}
		allEventCount--;
		return ss.getMapper(AdminBoardMapper.class).eventDelete(eventDto);
	}

	/*
	public void regEvent(MultipartFile mainimg, List<MultipartFile> detailimg, EventDTO eventDto) {
	 */
	public void regEvent(MultipartFile mainimg, List<MultipartFile> detailimg, EventDTO eventDto) {
		String e_content = eventDto.getE_content();
		eventDto.setE_content(e_content.replace("\r\n", "<br>"));
		
		String path = servletContext.getRealPath("resources/upload-event/");
		UUID uuid = UUID.randomUUID();
		String[] uuids = uuid.toString().split("-");
		String extension =	"." + mainimg.getOriginalFilename().substring(mainimg.getOriginalFilename().lastIndexOf(".") + 1);
		try {
		String saveFileName = uuids[0] + uuids[1] + uuids[2];
		System.out.println(saveFileName);
		eventDto.setE_mainimg(saveFileName + extension);
			mainimg.transferTo(new File(path + saveFileName + extension));
		StringBuilder sb = new StringBuilder();
		String saveFileName2 = null;
		String extension2 = null;
		for (MultipartFile mf : detailimg) {
			System.out.println(mf.getOriginalFilename());
			extension2 = "." + mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf(".") + 1);
			uuid = UUID.randomUUID();
			uuids = uuid.toString().split("-");
			saveFileName2 = uuids[0] + uuids[1] + uuids[2];
			System.out.println(saveFileName2);
			sb.append(saveFileName2 + extension2 + "!");
			mf.transferTo(new File(path + saveFileName2 + extension2));
		}
		eventDto.setE_detailimg(sb.toString());
		System.out.println(eventDto.toString());
		
		if(ss.getMapper(AdminBoardMapper.class).eventReg(eventDto)==1) {
			System.out.println("등록성공");
			allEventCount++;
		}else {
			File mainFile = new File(path + saveFileName + extension);
			if(mainFile.exists()) {
				mainFile.delete();
			}
			String detailFiles[] = sb.toString().split("!");
			for (String df : detailFiles) {
			File detailFile = new File(path + df + extension2);
			if(detailFile.exists()) {
				detailFile.delete();
			}
				
				
			}
		}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
}