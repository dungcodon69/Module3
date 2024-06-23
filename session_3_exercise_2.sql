use quanlybanhang;

select oID, oDate, oTotalPrice from orders;

select cName, pName from customer inner join orders on  customer.cID = orders.cID inner join orderdetail on orderdetail.oID = orders.oID
inner join product on orderdetail.pID = product.pID;

select customer.cID, customer.cName from customer left join orders on orders.cID = customer.cID where orders.oID is null;

select orders.oID, orders.oDate, sum(orderdetail.odQty * product.pPrice) as 'Total price'
from orders inner join orderdetail on orders.oID = orderdetail.oID
inner join product on product.pID = orderdetail.pID
group by orders.oID,orders.oDate; 