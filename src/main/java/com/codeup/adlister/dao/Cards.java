package com.codeup.adlister.dao;

import com.codeup.adlister.models.Card;

import java.util.List;

public interface Cards {
    Card searchCards(String cardName);
    Card searchCardsByCat(String cardCat);
    Long insert(Card card);
}
