package com.codeup.adlister.dao;

import com.codeup.adlister.models.Card;

public class DaoFactory {
    private static Ads adsDao;
    private static Users usersDao;
    private static Cards cardsDao;
    private static Config config = new Config();

    public static Ads getAdsDao() {
        if (adsDao == null) {
            adsDao = new MySQLAdsDao(config);
        }
        return adsDao;
    }

    public static Users getUsersDao() {
        if (usersDao == null) {
            usersDao = new MySQLUsersDao(config);
        }
        return usersDao;
    }

    public static Cards getCardsDao() {
        if(cardsDao == null) {
            cardsDao = new MySQLCardsDao(config);
        }
        return cardsDao;
    }


}
