REM customer(cust_id, cust_name, address, phone)
REM pizza (pizza_id, pizza_type, unit_price)
REM orders(order_no, cust_id, order_date ,delv_date, total_amt)
REM order_list(order_no, pizza_id, qty)

REM 2. Write a PL/SQL block to calculate the total amount, discount and billable amount
REM (Amount to be paid) as given below:
REM For total amount > 2000 and total amount < 5000: Discount=5%
REM For total amount > 5000 and total amount < 10000: Discount=10%
REM For total amount > 10000: Discount=20%
REM Calculate the billable amount (after the discount) and update the same in orders table.
REM Bill Amount = Total – Discount.

CREATE OR REPLACE PROCEDURE calcBill
	(ord_id IN VARCHAR2) AS
	
	discount NUMBER(3,2);
	disc_amt NUMBER(7,2);
	billable_amt NUMBER(7,2);
	tot_amt NUMBER(7,2);

	CURSOR ord_cur IS
		SELECT ol.qty,p.unit_price
		FROM pizza p JOIN order_list ol ON p.pizza_id=ol.pizza_id 
		     JOIN orders o ON o.order_no=ol.order_no
		WHERE o.order_no=ord_id;
BEGIN
	tot_amt:=0;
	
	FOR x IN ord_cur LOOP
		tot_amt := tot_amt + (x.qty * x.unit_price);
	END LOOP;
	
	IF tot_amt > 10000 THEN
		discount := 0.20;
	ELSIF tot_amt > 5000 THEN
		discount := 0.10;
	ELSIF tot_amt > 2000 THEN
		discount := 0.05;
	ELSE
		discount := 0.0;
	END IF;
		
	disc_amt := discount * tot_amt;
	billable_amt := tot_amt - disc_amt;
	
	UPDATE orders
	SET total_amt = tot_amt,discount=discount,billable_amt=billable_amt
	WHERE order_no=ord_id;
	
	dbms_output.put_line('Total Amount: '||tot_amt);
	dbms_output.put_line('Discount: '||discount);
	dbms_output.put_line('Discount Amount: '||disc_amt);
	dbms_output.put_line('Billable Amount: '||billable_amt);
END;
/

DECLARE
	ord_id VARCHAR2(10);
BEGIN
	ord_id:='&ord_id';
	calcBill(ord_id);	
END;
/
