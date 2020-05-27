/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.parkbnb.utils;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author dimit
 */
public class RentalUtils {
    
    public LocalDateTime[] handleRentalDates(String datetimes){
        String[] dates = datetimes.split("-");
        dates[0]=dates[0].trim();
        dates[1]=dates[1].trim();
        LocalDateTime start  = LocalDateTime.parse(dates[0].trim(), DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm"));
        LocalDateTime end  = LocalDateTime.parse(dates[1].trim(), DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm"));
        LocalDateTime[] localDateTimes = new LocalDateTime[2];
        localDateTimes[0]=start;
        localDateTimes[1]=end;
        return localDateTimes;
    }
}
