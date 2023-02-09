import data.Coordinates;
import data.CoordinatesList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "ClearTableServlet", value = "/cleaner")
public class ClearTableServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Object collection = getServletContext().getAttribute("list");
        Coordinates coordinates = (Coordinates) getServletContext().getAttribute("last");
        if(coordinates != null){
            coordinates.clear();
        }
        if (collection != null){
            CoordinatesList coordinatesList = (CoordinatesList)collection;
            coordinatesList.clear();
            getServletContext().setAttribute("list", coordinatesList);
        }
    }
}
