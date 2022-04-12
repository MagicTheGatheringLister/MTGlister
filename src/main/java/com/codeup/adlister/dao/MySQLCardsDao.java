package com.codeup.adlister.dao;

import com.codeup.adlister.models.Card;
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
            stmt = connection.prepareStatement("SELECT * FROM card");
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    @Override
    public Long insert(Card card) {
        try {
            String insertQuery = "INSERT INTO card(card_id, card_name) VALUES (?, ?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, card.getCardId());
            stmt.setString(2, card.getCardName());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new Deck.", e);
        }
    }

    private Card extractAd(ResultSet rs) throws SQLException {
        return new Card(
                rs.getLong("card_id"),
                rs.getString("card_name"),
                rs.getString("card_image")
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
