--
-- Afficher la liste des hôtels avec leur station
--

CREATE VIEW v_hotels_stations
AS
SELECT hotel.hot_nom, station.sta_nom
FROM hotel
JOIN station
ON hotel.hot_sta_id = station.sta_id



--
-- Afficher la liste des chambres et leur hôtel
--

CREATE VIEW v_chambres_hotels
AS
SELECT chambre.cha_numero, chambre.cha_capacite, hotel.hot_nom
FROM chambre
JOIN hotel
ON chambre.cha_hot_id = hotel.hot_id



--
-- Afficher la liste des réservations avec le nom des clients
--

CREATE VIEW v_reservations_clients
AS
SELECT reservation.res_date, reservation.res_date_debut, reservation.res_date_fin, reservation.res_prix, reservation.res_arrhes, client.cli_nom
FROM reservation
JOIN client
ON reservation.res_cli_id = client.cli_id



--
-- Afficher la liste des chambres avec le nom de l'hôtel et le nom de la station
--

CREATE VIEW v_chambres_hotels_stations
AS
SELECT chambre.cha_numero, chambre.cha_capacite, hotel.hot_nom, station.sta_nom
FROM chambre
JOIN hotel
ON chambre.cha_hot_id = hotel.hot_id
JOIN station
ON hotel.hot_sta_id = station.sta_id



--
-- Afficher les réservations avec le nom du client et le nom de l'hôtel
--

CREATE VIEW v_reservations_clients_hotels
AS
SELECT reservation.res_date, reservation.res_date_debut, reservation.res_date_fin, reservation.res_prix, reservation.res_arrhes, client.cli_nom, hotel.hot_nom
FROM reservation
JOIN client
ON reservation.res_cli_id = client.cli_id
JOIN chambre
ON reservation.res_cha_id = chambre.cha_id
JOIN hotel
ON chambre.cha_hot_id = hotel.hot_id




