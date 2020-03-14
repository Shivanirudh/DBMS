REM ****** 4. Display the total number of orders that contains one pizza type, two pizza type and so on.

DECLARE
    ptype_count NUMBER(3);
    counter NUMBER(3);
    max_count NUMBER(4);
    order_no orders.order_no % TYPE;
    
    CURSOR type_counter IS
        SELECT order_no FROM order_list GROUP BY order_no HAVING COUNT(order_no) = counter;

BEGIN
	counter := 0;
	SELECT COUNT(DISTINCT pizza_type) INTO max_count FROM pizza;

        dbms_output.put_line('Number of Orders that contain: ');

        WHILE counter < max_count LOOP

          	ptype_count := 0;
          	counter := counter + 1;
			
		FOR order_no IN type_counter LOOP
			ptype_count:=ptype_count+1;
		END LOOP;
            
           	dbms_output.put_line(counter||' Pizza Type: '||ptype_count);
       		
	END LOOP;
END;
/

REM ****** @Z:/A5/pizza_plsql4.sql