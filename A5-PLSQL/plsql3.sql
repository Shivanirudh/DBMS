REM ****** 3. Display the customer name along with the details of pizza type and its quantity ordered for the given order number.
REM ****** Also find the total quantity ordered for the given order number as shown below:

DECLARE
	no_of_orders NUMBER(3);
	order_id CHAR(5);
	c_name customer.cust_name % TYPE;
	p_type pizza.pizza_type % TYPE;
	qty order_list.qty % TYPE;
    
	CURSOR order_details IS
		SELECT pizza_type, qty, cust_name
		FROM pizza p JOIN order_list ol ON p.pizza_id = ol.pizza_id 
		JOIN orders o ON o.order_no=ol.order_no JOIN customer c ON o.cust_id = c.cust_id
		WHERE ol.order_no = order_id;

BEGIN
	order_id := '&order_id';
    
    	OPEN order_details;
    
    	FETCH order_details INTO p_type, qty, c_name;
    
	IF order_details%FOUND = False THEN
		dbms_output.put_line('Specified order does not exist.');
	ELSE
        	dbms_output.put_line('Customer Name: '||c_name||'.');
        	dbms_output.put_line('Has ordered the following Pizza: ');
        	dbms_output.put_line(RPAD('PIZZA TYPE', 13)||RPAD('QTY.', 4));
        	
		WHILE order_details%FOUND LOOP
            		dbms_output.put_line(RPAD(p_type, 13)||RPAD(qty, 4));
            		FETCH order_details INTO p_type, qty,c_name;
        	END LOOP;
        
	END IF;

	CLOSE order_details;
END;
/
