package com.codeup.adlister.dao;

import com.codeup.adlister.models.Card;
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

    @Override
    public void deleteDeck(long deckId) {
        try{
            foreignKey(0);
            String q = "DELETE FROM deck WHERE deck_id = ?";
            PreparedStatement stmt = connection.prepareStatement(q, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, deckId);
            stmt.executeUpdate();
            foreignKey(1);
            ResultSet rs = stmt.getGeneratedKeys();
            /*rs.next();*/
        }catch (SQLException e) {
            throw new RuntimeException("Error Deleteing a Deck");
        }
    }
    //disables foreign key -> then re-asigns it so that the delete could work;
    private void foreignKey(long key) {
        try{
            String q = "SET foreign_key_checks = ?";
            PreparedStatement s = connection.prepareStatement(q,Statement.RETURN_GENERATED_KEYS);
            s.setLong(1, key);
            s.executeUpdate();
            s.getGeneratedKeys();
        } catch (SQLException e) {
            throw new RuntimeException("Error Foreign Key");
        }
    }

    private Deck extractAd(ResultSet rs) throws SQLException {
        return new Deck(
                rs.getLong("deck_id"),
                rs.getString("deck_name"),
                rs.getLong("user_id"),
                rs.getString("date_created"),
                rs.getString("description")
                );
    }

    private List<Deck> createAdsFromResults(ResultSet rs) throws SQLException {
        List<Deck> Deck = new ArrayList<>();
        while (rs.next()) {
            Deck.add(extractAd(rs));
        }
        return Deck;
    }

    public Deck findDeck(String deckName) {
        String query = "SELECT * FROM deck WHERE deck_name = ? LIMIT 1";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, deckName);
            return extractAd(stmt.executeQuery());
        } catch (SQLException e) {
            throw new RuntimeException("Error finding a deck from decks", e);
        }
    }
}
