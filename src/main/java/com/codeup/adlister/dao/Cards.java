package com.codeup.adlister.dao;

import com.codeup.adlister.models.Card;
import com.codeup.adlister.models.Deck;

import java.util.List;

public interface Cards {
    Card searchCards(String cardName);
    Card searchCardsByCat(String cardCat);
    List<Card> all();
    Long insert(Card card);

    List<Card> DisplayCard(long deckId);
//    Card DisplayCard(long deckId);
}
