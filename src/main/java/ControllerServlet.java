import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "ControllerServlet", value = "/controller")
public class ControllerServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        if(req.getParameter("x") != null && req.getParameter("y") != null
                && req.getParameter("r") != null) {
            req.getRequestDispatcher("/check").forward(req, resp);
        }
        else if (req.getParameter("clear") != null){
            sendToClear(req,resp);
        }
        else {
            getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
        }
    }
    public void sendToClear(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("/cleaner").forward(request, response);
    }
}
