package com.codeup.adlister.dao;

import com.codeup.adlister.models.Card;
import com.codeup.adlister.models.User;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLCardsDao implements Cards {
    private Connection connection = null;

    public MySQLCardsDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                    config.getUrl(),
                    config.getUser(),
                    config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }

    public List<Card> all() {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM cards");
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all Cards.", e);
        }
    }

    @Override
    public Long insert(Card card) {
        try {
            String insertQuery = "INSERT INTO cards(card_id, card_name, card_image, card_deck_id) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, card.getCardId());
            stmt.setString(2, card.getCardName());
            stmt.setString(3, card.getCardImage());
            stmt.setLong(4, card.getCardDeckId());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new Card.", e);
        }
    }

    @Override
    public Card searchCards(String cardName) {
        try{
            String q = "SELECT * FROM cards WHERE card_name LIKE ?";
            PreparedStatement stmt = connection.prepareStatement(q, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, cardName);
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            return extractAd(rs);
        }catch (SQLException e) {
            throw new RuntimeException("error Searching cards", e);
        }
    }

    @Override
    public Card searchCardsByCat(String cardCatagory) {
        try{
            String q = "SELECT * FROM cards WHERE catagory = ? ";
            PreparedStatement stmt = connection.prepareStatement(q, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, cardCatagory);
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            return extractAd(rs);
        }catch (SQLException e) {
            throw new RuntimeException("error Searching cards by cat", e);
        }
    }

    private Card extractAd(ResultSet rs) throws SQLException {
        return new Card(
                rs.getLong("card_id"),
                rs.getString("card_name"),
                rs.getString("card_image"),
                rs.getLong("card_deck_id")
                );
    }

    private List<Card> createAdsFromResults(ResultSet rs) throws SQLException {
        List<Card> Card = new ArrayList<>();
        while (rs.next()) {
            Card.add(extractAd(rs));
        }
        return Card;
    }



}
