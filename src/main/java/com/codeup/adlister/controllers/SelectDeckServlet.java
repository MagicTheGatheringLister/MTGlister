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
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;

@WebServlet(name = "controllers.SelectDeckServlet", urlPatterns = "/deck")
public class SelectDeckServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }
        request.getRequestDispatcher("WEB-INF/profile")
                .forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
/*        long deckId = Long.parseLong(request.getParameter("deck_selected"));*/
    /*    request.setAttribute("deckId", request.getParameter("deck_selected"));*/
        HttpSession session = request.getSession();
        session.setAttribute("deckId", request.getParameter("deck_selected"));

        response.sendRedirect("/");
    }
}