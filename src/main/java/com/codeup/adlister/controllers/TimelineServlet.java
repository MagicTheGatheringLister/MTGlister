package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.TimelineServlet", urlPatterns = "/timeline")
public class TimelineServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
/*        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }*/
        request.setAttribute("allUsers", DaoFactory.getUsersDao().all());
        request.setAttribute("ads", DaoFactory.getAdsDao().all());
        request.setAttribute("cards", DaoFactory.getCardsDao().all());
//        request.setAttribute("cards", DaoFactory.getCardsDao().all());
        request.getRequestDispatcher("/WEB-INF/ads/timeline.jsp").forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        response.sendRedirect("/ads");
    }
}
