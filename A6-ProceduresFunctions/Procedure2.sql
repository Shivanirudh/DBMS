REM customer(cust_id, cust_name, address, phone)
REM pizza (pizza_id, pizza_type, unit_price)
REM orders(order_no, cust_id, order_date ,delv_date, total_amt)
REM order_list(order_no, pizza_id, qty)

REM 3. For the given order number, write a PL/SQL block to print the order as 
REM shown below:


CREATE OR REPLACE PROCEDURE showBill
	(ord_id IN VARCHAR2) AS
	
	ord_no orders.order_no%TYPE;
	ord_date orders.order_date%TYPE;
	cname customer.cust_name%TYPE;
	cphone customer.phone%TYPE;
	
	ptype pizza.pizza_type%TYPE;
	qty order_list.qty%TYPE;
	uprice pizza.unit_price%TYPE;
	
	total_amt orders.total_amt%TYPE;
	
	sno NUMBER(2);
	amt NUMBER(5);

	CURSOR cust_order IS
		SELECT o.order_no,o.order_date,c.cust_name,c.phone
		FROM orders o JOIN customer c ON c.cust_id=o.cust_id
		WHERE o.order_no=ord_id;
	
	CURSOR pizza_order IS
		SELECT p.pizza_type,ol.qty,p.unit_price
		FROM pizza p JOIN order_list ol ON p.pizza_id=ol.pizza_id
		WHERE ol.order_no=ord_id;
BEGIN
	sno:=0;
	OPEN cust_order;
	FETCH cust_order INTO ord_no,ord_date,cname,cphone;
	dbms_output.put_line('************************************************************');
	dbms_output.put_line('Order Number:'||ord_no||CHR(9)||'Customer Name:'||cname);
	dbms_output.put_line('Order Date: '||ord_date ||CHR(9)||'Phone:'||cphone);
	dbms_output.put_line('************************************************************');
	CLOSE cust_order;
	dbms_output.put_line('Sno'||CHR(9)||'Pizza Type'||CHR(9)||'Qty'||CHR(9)||'Price'||CHR(9)||'Amount');

	FOR x in pizza_order LOOP
		sno:=sno+1;
		amt:=x.qty*x.unit_price;
		dbms_output.put_line(sno||CHR(9)||x.pizza_type||CHR(9)||CHR(9)||x.qty||CHR(9)||x.unit_price||CHR(9)||amt);
	END LOOP;
	
	calcBill(ord_id);
	SELECT total_amt INTO total_amt
	FROM orders
	WHERE order_no=ord_id;

	dbms_output.put_line('____________________________________________________________');
	dbms_output.put_line(CHR(9)||'Total - '||CHR(9)||no_order(ord_id)||CHR(9)||CHR(9)||total_amt);
	dbms_output.put_line('____________________________________________________________');
	dbms_output.put_line('Great Offers! Discount up to 25% on DIWALI Festival Day...');
	dbms_output.put_line('************************************************************');
	

END;
/
REM *****************************************************************************
DECLARE
	ord_id VARCHAR2(5);
BEGIN
	ord_id:='&ord_id';
	
	showBill(ord_id);	
END;
/
