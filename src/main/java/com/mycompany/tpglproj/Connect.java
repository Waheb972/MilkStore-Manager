/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.tpglproj;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author pc
 */
public class Connect {
    public Connection con;
    
    public Connection connect() throws SQLException, ClassNotFoundException {
        
           con = DriverManager.getConnection("jdbc:mysql://localhost:3306/finalegldb?zeroDateTimeBehavior=CONVERT_TO_NULL","root","Stophacking22_");
        
        return con;
    }
    
 
}
