CREATE DATABASE IF NOT EXISTS proiect_pandele_florin;
USE proiect_pandele_florin;

CREATE TABLE soferi (
    idsofer INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nume VARCHAR(50),
    prenume VARCHAR(50),
    cnp VARCHAR(13)
);

CREATE TABLE vehicule (
    idvehicul INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(50),
    model VARCHAR(50),
    nr_inmatriculare VARCHAR(15)
);
CREATE TABLE performante_vehicule (
    idperfo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    idsofer INT,
    idvehicul INT,
    cai_putere INT,
    cuplu_nm INT,
    greutate_kg INT,
    FOREIGN KEY (idsofer) REFERENCES soferi(idsofer) ON DELETE CASCADE,
    FOREIGN KEY (idvehicul) REFERENCES vehicule(idvehicul) ON DELETE CASCADE
);
