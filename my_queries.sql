-- Inventory of all cars, that are not inactive (ordered by car model name)
SELECT
cars.car_id,
car_brands.brand_name,
car_models.model_name,
car_fuels.fuel_type,
car_colors.color,
car_models.seats,
cars.license_plate,
cars.status
FROM `cars`
INNER JOIN car_models ON car_models.model_id = cars.model_id
INNER JOIN car_brands ON car_brands.brand_id = car_models.brand_id
INNER JOIN car_colors ON car_colors.color_id = cars.color_id
INNER JOIN car_fuels ON car_fuels.fuel_id = car_models.fuel_id
WHERE cars.status != "inactive"
ORDER BY car_models.model_name;


-- Which cars are currently rented to which customers? (car id, cust_id, fname, sname, car_model)
SELECT cars.car_id, customers.cust_id, customers.fname, customers.sname, car_models.model_name FROM cars
INNER JOIN customers ON customers.cust_id = cars.cust_id
INNER JOIN car_models ON car_models.model_id = cars.model_id;


-- How many cars are available at the moment?
SELECT COUNT(car_id) FROM cars WHERE cust_id IS NULL;


-- How many cars are available at the moment in 1150 Vienna? (I pretend not knowing that it is location 1), using subquery
SELECT COUNT(car_id) FROM cars
WHERE cust_id IS NULL AND location_id IN
	(SELECT location_id FROM our_locations WHERE zip="1150");


-- List all customers whose pass has expired
SELECT * FROM `customers` WHERE pass_expire < NOW();

-- LEFT JOIN all rentals on optional rental_extra_fines
SELECT * FROM rentals
LEFT JOIN rental_extra_fines ON rentals.rent_id=rental_extra_fines.rent_id;

-- Show sums of all invoices and extra fees
SELECT SUM(rentals.invoice) FROM rentals WHERE pay_status="paid"
UNION SELECT SUM(rental_extra_fines.refill_bill) FROM rental_extra_fines WHERE pay_status2="paid"
UNION SELECT SUM(rental_extra_fines.extra_bill) FROM rental_extra_fines WHERE pay_status2="paid";