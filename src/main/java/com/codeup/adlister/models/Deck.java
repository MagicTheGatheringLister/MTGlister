package com.codeup.adlister.models;

import java.util.Date;

public class Deck {
    private long deckId;
    private long userId;
    private String deckName;
    private String description;
    private String dateCreated;

    public Deck(long deckId, long userId, String deckName, String description, String dateCreated) {
        this.deckId = deckId;
        this.userId = userId;
        this.deckName = deckName;
        this.description = description;
        this.dateCreated = dateCreated;
    }

    public Deck(long userId, String deckName, String description, String dateCreated) {
        this.userId = userId;
        this.deckName = deckName;
        this.description = description;
        this.dateCreated = dateCreated;
    }

    public long getDeckId() {
        return deckId;
    }

    public void setDeckId(long deckId) {
        this.deckId = deckId;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public String getDeckName() {
        return deckName;
    }

    public void setDeckName(String deckName) {
        this.deckName = deckName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDateCreated() {
        return dateCreated;
    }

    public void setDate_created(String dateCreated) {
        this.dateCreated = dateCreated;
    }
}
