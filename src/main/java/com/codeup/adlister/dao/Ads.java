package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.Deck;

import java.util.List;

public interface Ads {
    void deleteDeck(long deckName);
    Deck findDeck(String deckName);
    // get a list of all the ads
    List<Deck> all();
    // insert a new ad and return the new ad's id
    Long insert(Deck deck);
}
