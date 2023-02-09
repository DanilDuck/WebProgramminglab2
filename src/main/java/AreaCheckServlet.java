
import data.Coordinates;
import data.CoordinatesList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.List;

import static java.time.temporal.ChronoUnit.MINUTES;

@WebServlet(name = "AreaCheckServlet", value = "/check")
public class AreaCheckServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            CoordinatesList coordinatesList = (CoordinatesList) getServletContext().getAttribute("list");
            long startTime = System.nanoTime();
            String x = req.getParameter("x");
            String y = req.getParameter("y");
            String r = req.getParameter("r");
            double xVal = Double.parseDouble(x);
            double yVal = Double.parseDouble(y);
            double rVal = Double.parseDouble(r);
            if (!validate(xVal, yVal, rVal)) {
                throw new NumberFormatException("can't validate");
            }
            if (coordinatesList == null) {
                coordinatesList = new CoordinatesList();
            }
            int timezone = Integer.parseInt(req.getParameter("timezone"));
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
            String currentTime = formatter.format(LocalDateTime.now().plus(timezone, MINUTES));
            long executeTime = (long) ((System.nanoTime() - startTime) * 0.001);

            Coordinates coordinates = new Coordinates(Double.parseDouble(x), Double.parseDouble(y), Double.parseDouble(r), currentTime, executeTime, isHit(x, y, r));
            coordinatesList.add(coordinates);
            String hitMiss = isHit(x, y, r) ? "            <td class=\"hit\" style=\"color:green\">\n" + "hit" : "            <td class=\"hit\" style=\"color:red\">\n" + "miss";
            getServletContext().setAttribute("list", coordinatesList);
            getServletContext().setAttribute("last", coordinates);
            req.getRequestDispatcher("table.jsp").forward(req,resp);
        }catch (Throwable e){
            getServletContext().getRequestDispatcher("/errorPage.jsp").forward(req, resp);
            throw new NumberFormatException();
        }
    }
    private boolean validate(double x, double y, double r) {
        return  (y >= -2 && y <= 2) &&
                (x >= -5 && x <= 3) &&
                (List.of(1.0, 1.5, 2.0, 2.5, 3.0).contains(r));
    }
    private boolean isHit(String x, String y, String r) {

        double xCoord = Double.parseDouble(x);
        double yCood = Double.parseDouble(y);
        double rCoord = Double.parseDouble(r);
        return ((xCoord >= -rCoord) && (yCood <= rCoord/2) && (yCood >= 0) && (xCoord<=0) && (2 * yCood -xCoord <= rCoord)) ||
                (xCoord >= 0 && xCoord <= rCoord / 2 && yCood <= 0 && yCood >= -rCoord) ||
                ((Math.pow(xCoord, 2) + Math.pow(yCood, 2) <= Math.pow(rCoord / 2, 2)) && (xCoord >= 0) && (yCood >= 0));
    }



}
