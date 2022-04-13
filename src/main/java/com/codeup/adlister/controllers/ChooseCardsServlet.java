package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.Card;
import com.codeup.adlister.models.Deck;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

@WebServlet(name = "controllers.ChooseCardsServlet", urlPatterns = "/ads/add-cards")
public class ChooseCardsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }
        request.getRequestDispatcher("/index.jsp")
                .forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User user = (User) request.getSession().getAttribute("user");
        String addedCard = request.getParameter("hiddenName");
        String addedImage = request.getParameter("hiddenImage");
        System.out.println(addedCard);
        System.out.println(addedImage);
        Card card = new Card(
                addedCard,
                addedImage,
                2
        );


        DaoFactory.getCardsDao().insert(card);
        response.sendRedirect("/ads");
    }
}