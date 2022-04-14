package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.Card;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.Long;
import java.util.Date;

@WebServlet(name = "controllers.ChooseCardsServlet", urlPatterns = "/ads/add-cards")
public class ChooseCardsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }
        request.getRequestDispatcher("/")
                .forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        long deckId = Long.parseLong((String) session.getAttribute("deckId"));
/*        String deckId = (String) request.getAttribute("deckId");*/
        System.out.println("from deck id");
        System.out.println(deckId);

        String cardName = request.getParameter("hiddenName");
        String cardImg = request.getParameter("hiddenImage");
        Card card = new Card(
                cardName,
                cardImg,
                deckId
        );
        DaoFactory.getCardsDao().insert(card);
        response.sendRedirect("/");
    }
}