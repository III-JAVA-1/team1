package com.web.pet.mom.controller;

import com.web.pet.mom.Exeption.OrderIsSameMomException;
import com.web.pet.mom.model.req.PetMomOrderReq;
import com.web.pet.mom.service.PetMomOrderService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;

/**
 * @author i19
 */
@AllArgsConstructor
@Controller
@RequestMapping("/mom")
public class PetMomOrderController {
    private static final String CONTENT_TYPE = "text/html; charset=UTF-8";

    private static final String CHARSET_CODE = "UTF-8";

    private final PetMomOrderService petMomOrderService;

    /**
     * 寫入預約資料
     *
     * @param petMomOrder
     * @param response
     * @param request
     * @throws IOException
     */
    @PostMapping(value = "/reservationMom", produces = "application/json; charset=utf-8")
    public void insertPetMomOrder(PetMomOrderReq petMomOrder, HttpServletResponse response, HttpServletRequest request) throws IOException, ParseException {

        //亂碼處理
        request.setCharacterEncoding(CHARSET_CODE);
        response.setContentType(CONTENT_TYPE);

        Integer momId = Integer.valueOf(request.getSession().getAttribute("user").toString());
        petMomOrderService.insertPetMomOrder(petMomOrder , momId);
        PrintWriter out = response.getWriter();
        try {
            out.print("<html>");
            out.print("<body>");
            out.print("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@10'></script>");
            out.print("<script>");
            out.print("Swal.fire({\r\n"
                    + "  icon: 'success',\r\n"
                    + "  title: '預約成功',\r\n"
                    + "  showConfirmButton: false,\r\n"
                    + "  timer: 1500\r\n"
                    + "}).then((result) => {\r\n"
                    + "window.location.href='../mom/extar.jsp';\r\n"
                    + "})");
            out.print("</script>");
            out.print("</body>");
            out.print("</html>");
        }catch (OrderIsSameMomException oe){

        }
    }


}


