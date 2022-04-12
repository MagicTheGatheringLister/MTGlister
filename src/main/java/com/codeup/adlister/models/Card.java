package com.codeup.adlister.models;

public class Card {
    private long cardId;
    private String cardName;
    private String cardImage;

    public Card(long cardId, String cardName, String cardImage){
        this.cardId = cardId;
        this.cardName = cardName;
        this.cardImage = cardImage;
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

    public String getCardImage() {
        return cardImage;
    }

    public void setCardImage(String cardImage) {
        this.cardImage = cardImage;
    }


}

