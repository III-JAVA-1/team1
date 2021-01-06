package com.web.pet.mom.controller;

import com.web.pet.mom.Exeption.MomIsExistedException;
import com.web.pet.mom.model.Mom;
import com.web.pet.mom.service.MomService;
import com.web.pet.util.BlobToByteArray;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Blob;
import java.util.List;

/**
 * @author i19
 */
@AllArgsConstructor
@Controller
@RequestMapping("/mom")
public class MomController {

    private static final String CONTENT_TYPE = "text/html; charset=UTF-8";

    private static final String CHARSET_CODE = "UTF-8";

    private final MomService momService;

    /**
     * 寫入註冊資料
     *
     * @param mom
     * @param myPic
     * @param response
     * @param request
     * @throws IOException
     */
    @PostMapping(value = "/insertMom", produces = "application/json; charset=utf-8")
    public void insertMom(Mom mom,
                          @RequestParam(value = "myPic", required = false) MultipartFile myPic,
                          HttpServletResponse response, HttpServletRequest request) throws IOException {

        //亂碼處理
        request.setCharacterEncoding(CHARSET_CODE);
        response.setContentType(CONTENT_TYPE);

//        //取得session
        Integer uId = Integer.valueOf(request.getSession().getAttribute("user").toString());

        //上傳圖片
        if (myPic != null && !myPic.isEmpty()) {
            try {
                byte[] b = myPic.getBytes();
                Blob blob = new SerialBlob(b);
                mom.setPic(blob);

            } catch (Exception e) {
                e.printStackTrace();
                throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
            }
        }
        PrintWriter out = response.getWriter();
        try {
            momService.insertMom(mom, uId);

            out.print("<html>");
            out.print("<body>");
            out.print("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@10'></script>");
            out.print("<script>");
            out.print("Swal.fire({\r\n"
                    + "  icon: 'success',\r\n"
                    + "  title: '註冊成功',\r\n"
                    + "  showConfirmButton: false,\r\n"
                    + "  timer: 1500\r\n"
                    + "}).then((result) => {\r\n"
                    + "window.location.href='../mom/extar.jsp';\r\n"
                    + "})");
            out.print("</script>");
            out.print("</body>");
            out.print("</html>");
        } catch (MomIsExistedException e) {

            out.print("<html>");
            out.print("<body>");
            out.print("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@10'></script>");
            out.print("<script>");
            out.print("Swal.fire({\r\n"
                    + "  icon: 'error',\r\n"
                    + "  title: '"+e.getMessage()+"',\r\n"
                    + "  showConfirmButton: false,\r\n"
                    + "  timer: 1500\r\n"
                    + "}).then((result) => {\r\n"
                    + "window.location.href='../mom/extar.jsp';\r\n"
                    + "})");
            out.print("</script>");
            out.print("</body>");
            out.print("</html>");
        }
    }


    /**
     * 顯示由城市標題查出的保母資料
     *
     * @param country
     * @param title
     * @return
     */
    @RequestMapping("/allMom")
    @ResponseBody
    public List<Mom> allMom(String country, String title) {
        return momService.getAllMoms(country, title);
    }

    /**
     * @param momId
     * @return 顯示預約時由保母ID查出的保母資料
     */
    @RequestMapping("/showReservation")
    @ResponseBody
    public List<Mom> getReservation(Integer momId) {

        return momService.getReservation(momId);
    }


    /**
     * 顯示與momId相符的圖片
     *
     * @param momId
     * @return
     */
    @RequestMapping(value = "/getPic")
    public ResponseEntity<byte[]> getPicture(@RequestParam Integer momId) {

        Mom mom = momService.showPic(momId);
        Blob blob = mom.getPic();
        if (blob == null) {
            return null;
        } else {
            byte[] body = BlobToByteArray.blobToByteArray(blob);
            return new ResponseEntity<>(body, HttpStatus.OK);
        }
    }

//	@GetMapping(value = "/extar.jsp" , produces = "application/json; charset=utf-8")
//	public String list(Model model) {
//		List<Mom> list = momService.getAllMoms();
//		model.addAttribute("mom" , list);
//		return "mom/extar.jsp";
//	}

//	@PostMapping(value = "/reservtionMom" , produces = "application/json; charset=utf-8")
//	public String insertPetMomOrder(@ModelAttribute("user") PetMomOrder petMomOrder) {
//		petMomOrderService.insertPetMomOrder(petMomOrder);


//		return "reservtionMom";			
//	}
}
