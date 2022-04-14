package com.codeup.adlister.models;

public class Card {
    private long cardId;
    private String cardName;
    private String cardImage;
    private long cardDeckId;

    public long getCardDeckId() {
        return cardDeckId;
    }

    public void setCardDeckId(long cardDeckId) {
        this.cardDeckId = cardDeckId;
    }

    public Card(long cardId, String cardName, String cardImage, long cardDeckId){
        this.cardId = cardId;
        this.cardName = cardName;
        this.cardImage = cardImage;
        this.cardDeckId = cardDeckId;
    }

    public Card(String cardName, String cardImage, long cardDeckId) {
        this.cardName = cardName;
        this.cardImage = cardImage;
        this.cardDeckId = cardDeckId;
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

