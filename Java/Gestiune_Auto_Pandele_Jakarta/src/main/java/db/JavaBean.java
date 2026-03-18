package db;
import java.sql.*;

public class JavaBean {
    private Connection con;
    private String url = "jdbc:mysql://localhost:3306/proiect_pandele_florin";
    private String user = "root";
    private String pass = "bazededate1"; 

    public void connect() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(url, user, pass);
    }

    public void disconnect() throws SQLException {
        if (con != null) con.close();
    }

 
    public ResultSet vedeSoferi() throws SQLException {
        return con.createStatement().executeQuery("SELECT * FROM soferi");
    }
    public ResultSet getSoferById(int id) throws SQLException {
        PreparedStatement pstmt = con.prepareStatement("SELECT * FROM soferi WHERE idsofer = ?");
        pstmt.setInt(1, id); return pstmt.executeQuery();
    }
    public void adaugaSofer(String n, String p, String c) throws SQLException {
        PreparedStatement pstmt = con.prepareStatement("INSERT INTO soferi (nume, prenume, cnp) VALUES (?, ?, ?)");
        pstmt.setString(1, n); pstmt.setString(2, p); pstmt.setString(3, c); pstmt.executeUpdate();
    }
    public void modificaSofer(int id, String n, String p, String c) throws SQLException {
        PreparedStatement pstmt = con.prepareStatement("UPDATE soferi SET nume=?, prenume=?, cnp=? WHERE idsofer=?");
        pstmt.setString(1, n); pstmt.setString(2, p); pstmt.setString(3, c); pstmt.setInt(4, id); pstmt.executeUpdate();
    }
    public void stergeSofer(int id) throws SQLException {
        PreparedStatement pstmt = con.prepareStatement("DELETE FROM soferi WHERE idsofer = ?");
        pstmt.setInt(1, id); pstmt.executeUpdate();
    }

 
    public ResultSet vedeVehicule() throws SQLException {
        return con.createStatement().executeQuery("SELECT * FROM vehicule");
    }
    public ResultSet getVehiculById(int id) throws SQLException {
        PreparedStatement pstmt = con.prepareStatement("SELECT * FROM vehicule WHERE idvehicul = ?");
        pstmt.setInt(1, id); return pstmt.executeQuery();
    }
    public void adaugaVehicul(String m, String mo, String nr) throws SQLException {
        PreparedStatement pstmt = con.prepareStatement("INSERT INTO vehicule (marca, model, nr_inmatriculare) VALUES (?, ?, ?)");
        pstmt.setString(1, m); pstmt.setString(2, mo); pstmt.setString(3, nr); pstmt.executeUpdate();
    }
    public void modificaVehicul(int id, String m, String mo, String nr) throws SQLException {
        PreparedStatement pstmt = con.prepareStatement("UPDATE vehicule SET marca=?, model=?, nr_inmatriculare=? WHERE idvehicul=?");
        pstmt.setString(1, m); pstmt.setString(2, mo); pstmt.setString(3, nr); pstmt.setInt(4, id); pstmt.executeUpdate();
    }
    public void stergeVehicul(int id) throws SQLException {
        PreparedStatement pstmt = con.prepareStatement("DELETE FROM vehicule WHERE idvehicul = ?");
        pstmt.setInt(1, id); pstmt.executeUpdate();
    }

  
    public ResultSet vedePerformante() throws SQLException {
        return con.createStatement().executeQuery("SELECT p.*, s.nume, s.prenume, v.marca, v.model FROM performante_vehicule p JOIN soferi s ON p.idsofer = s.idsofer JOIN vehicule v ON p.idvehicul = v.idvehicul");
    }
    public ResultSet getPerformantaById(int id) throws SQLException {
        PreparedStatement pstmt = con.prepareStatement("SELECT * FROM performante_vehicule WHERE idperfo = ?");
        pstmt.setInt(1, id); return pstmt.executeQuery();
    }
    public void adaugaPerformanta(int ids, int idv, int hp, int nm, int kg) throws SQLException {
        PreparedStatement pstmt = con.prepareStatement("INSERT INTO performante_vehicule (idsofer, idvehicul, cai_putere, cuplu_nm, greutate_kg) VALUES (?, ?, ?, ?, ?)");
        pstmt.setInt(1, ids); pstmt.setInt(2, idv); pstmt.setInt(3, hp); pstmt.setInt(4, nm); pstmt.setInt(5, kg); pstmt.executeUpdate();
    }
    public void modificaPerformanta(int id, int ids, int idv, int hp, int nm, int kg) throws SQLException {
        PreparedStatement pstmt = con.prepareStatement("UPDATE performante_vehicule SET idsofer=?, idvehicul=?, cai_putere=?, cuplu_nm=?, greutate_kg=? WHERE idperfo=?");
        pstmt.setInt(1, ids); pstmt.setInt(2, idv); pstmt.setInt(3, hp); pstmt.setInt(4, nm); pstmt.setInt(5, kg); pstmt.setInt(6, id); pstmt.executeUpdate();
    }
    public void stergePerformanta(int id) throws SQLException {
        PreparedStatement pstmt = con.prepareStatement("DELETE FROM performante_vehicule WHERE idperfo = ?");
        pstmt.setInt(1, id); pstmt.executeUpdate();
    }
}