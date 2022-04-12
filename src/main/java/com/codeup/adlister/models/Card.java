package com.codeup.adlister.models;

public class Card {
    private long cardId;
    private String cardName;

    public Card(long cardId, String cardName){
        this.cardId = cardId;
        this.cardName = cardName;
    }

    public Card(String cardName) {
        this.cardName = cardName;
    }

    public long getCardId() {
        return cardId;
    }

    public void setCardId(long cardId) {
        this.cardId = cardId;
    }

    public String getCardName() {
        return cardName;
    }

    public void setCardName(String cardName) {
        this.cardName = cardName;
    }
}

