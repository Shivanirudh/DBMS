REM customer(cust_id, cust_name, address, phone)
REM pizza (pizza_id, pizza_type, unit_price)
REM orders(order_no, cust_id, order_date ,delv_date, total_amt)
REM order_list(order_no, pizza_id, qty)
REM ****** 1. Write a stored function to display the total number of pizza's ordered by the given order number. 

CREATE OR REPLACE FUNCTION no_order 
	(order_id IN VARCHAR2) 
	RETURN  NUMBER IS
	
	qty NUMBER(3);
    
	CURSOR order_details IS
		SELECT SUM(ol.qty)
		FROM order_list ol 
		WHERE ol.order_no = order_id
		GROUP BY ol.order_no;

BEGIN
    	OPEN order_details;
    
    	FETCH order_details INTO qty;
    
	IF order_details%NOTFOUND THEN
		dbms_output.put_line('Specified order does not exist.');
		
	END IF;

	CLOSE order_details;
	RETURN qty;
END;
/

SELECT no_order('OP100') 
FROM dual;

SELECT no_order('OP300')
FROM dual;

