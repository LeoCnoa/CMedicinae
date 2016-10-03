/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cnncmdb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import msgmerro.*;

/**
 *
 * @author rafaelgs
 */
public class CMDB {

    Erro err = new Erro();
    Sucesso suc = new Sucesso();
    private Connection con;
    private Statement stmt;
    private ResultSet resuls;

    private String url; //"jdbc:mysql://localhost/cmdb";
    private String user; //"root";
    private String passw; //"toor";
    private String driver = "com.mysql.jdbc.Driver";

    public int CMDB() {
        
        int val = 0;

        try {
            Class.forName(getDriver()).newInstance();
            setCon(DriverManager.getConnection(getUrl(), getUser(), getPassw()));

            suc.Sucesso("Conectado com sucesso!");
            val = 1;
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException e) {
            jfConfServ conf  = new jfConfServ();
            err.Erro("Falha na Conexão com o Danco de Dados");
            val = 0;
            
            conf.setVisible(true);
            conf.setLocationRelativeTo(null);
            conf.setAutoRequestFocus(true);
        }
        
        return val;

    }

    public void CMDB_MAN() {

        try {
            CMDB cmdb = new CMDB();
            cmdb.CMDB();
            setStmt(cmdb.getCon().createStatement());
        } catch (Exception e) {
            err.Erro("Falha na criação do Statement");
        }

    }

    public ResultSet execQuery(String sql) {
        try {
            resuls = stmt.executeQuery(sql);
        } catch (SQLException e) {
            err.Erro("Sintaxe do comando em query errada.");
        }

        return getResuls();
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPassw() {
        return passw;
    }

    public void setPassw(String passw) {
        this.passw = passw;
    }

    public String getDriver() {
        return driver;
    }

    public void setDriver(String driver) {
        this.driver = driver;
    }

    public Connection getCon() {
        return con;
    }

    public void setCon(Connection con) {
        this.con = con;
    }

    public Statement getStmt() {
        return stmt;
    }

    public void setStmt(Statement stmt) {
        this.stmt = stmt;
    }

    public ResultSet getResuls() {
        return resuls;
    }

    public void setResuls(ResultSet resuls) {
        this.resuls = resuls;
    }

}
