package com.codeup.adlister.dao;


import com.codeup.adlister.models.Deck;

import java.util.ArrayList;
import java.util.List;

public class ListAdsDao implements Ads {
    private List<Deck> ads;

    public List<Deck> all() {
        if (ads == null) {
            ads = generateAds();
        }
        return ads;
    }

    public Long insert(Deck ad) {
        // make sure we have ads
        if (ads == null) {
            ads = generateAds();
        }
        // we'll assign an "id" here based on the size of the ads list
        // really the dao would handle this
        ad.setDeckId((long) ads.size());
        ads.add(ad);
        return ad.getDeckId();
    }

    private List<Deck> generateAds() {
        List<Deck> ads = new ArrayList<>();
        ads.add(new Deck(
            1,
            "the almighty",
            "playstation for sale",
            "This is a slightly used playstation"
        ));
        ads.add(new Deck(
            2,
            "name dos",
            "Super Nintendo",
            "Get your game on with this old-school classic!"
        ));
        ads.add(new Deck(
            3,
            "juicy",
            "Junior Java Developer Position",
            "Minimum 7 years of experience required. You will be working in the scripting language for Java, JavaScript"
        ));
        ads.add(new Deck(
            4,
            "11 quid",
            "JavaScript Developer needed",
            "Must have strong Java skills"
        ));
        return ads;
    }
}
