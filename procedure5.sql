CREATE OR REPLACE PROCEDURE SearchPropertyForRent(city_name IN VARCHAR2)
IS
    p_row Property%ROWTYPE;
    n number;
BEGIN

    SELECT COUNT(*) INTO n
    FROM Property 
    WHERE city = city_name;
    
    dbms_output.put_line('There are ' || n || ' properties in ' || city_name);
    dbms_output.put_line('----------------------------------------');
    dbms_output.put_line('Property Detials:');
    dbms_output.put_line('----------------------------------------');
    FOR p_row IN (SELECT * FROM Property WHERE city = city_name)
    LOOP
        dbms_output.put_line('Property ID: ' || p_row.property_ID);
        dbms_output.put_line('Rent: ' || p_row.rent);
        dbms_output.put_line('% hike in rent: ' || p_row.percentage_hike_in_rent);
        dbms_output.put_line('Number of Floors: ' || p_row.number_of_floors);
        dbms_output.put_line('Year of Construction: ' || p_row.year_of_construction);
        dbms_output.put_line('Start Date: ' || p_row.start_date);
        dbms_output.put_line('End Date: ' || p_row.end_date);
        dbms_output.put_line('Total Area: ' || p_row.total_area);
        dbms_output.put_line('Plinth Area: ' || p_row.plinth_area);
        dbms_output.put_line('City: ' || p_row.city);
        dbms_output.put_line('Address: ' || p_row.address);
        dbms_output.put_line('---------------------------------------');
    END LOOP;
END;
/