/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.parkbnb.utils;

/**
 *
 * @author dimit
 */
public class GarageUtils {

    public String[] manageLotLat(String lotLat) {

        String temp = lotLat.replace("(", "").replace(")", "").trim();
        String[] coords = temp.split(",");
        for (String i : coords) {
            i = i.trim();
        }
        return coords;
    }

    public String handleFileName(String fileName) {
        String[] temp = fileName.split("\\.");
        return "." + temp[1];

    }

}
