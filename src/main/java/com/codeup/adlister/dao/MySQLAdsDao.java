package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.Deck;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLAdsDao implements Ads {
    private Connection connection = null;

    public MySQLAdsDao(Config config) {
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

    @Override
    public List<Deck> all() {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM deck");
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    @Override
    public Long insert(Deck deck) {
        try {
            String insertQuery = "INSERT INTO deck(deck_name, user_id, date_created, description) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, deck.getDeckName());
            stmt.setLong(2, deck.getUserId());
            stmt.setString(3, deck.getDateCreated());
            stmt.setString(4, deck.getDescription());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new Deck.", e);
        }
    }

    private Deck extractAd(ResultSet rs) throws SQLException {
        return new Deck(
                rs.getLong("deck_id"),
                rs.getLong("user_id"),
                rs.getString("deck_name"),
                rs.getString("description"),
                rs.getString("date_created")
                );
    }

    private List<Deck> createAdsFromResults(ResultSet rs) throws SQLException {
        List<Deck> Deck = new ArrayList<>();
        while (rs.next()) {
            Deck.add(extractAd(rs));
        }
        return Deck;
    }
}
