create database QUANLYBANHANG;
use QUANLYBANHANG;
create table customer(
cID int primary key auto_increment,
cName varchar(25),
cAGE int
);
insert into customer(cName, cAGE) value ('minh quan',10);
insert into customer(cName, cAGE) value ('ngoc oanh',20);
insert into customer(cName, cAGE) value ('hong hoa',50);

create table oder(
oID int primary key auto_increment,
cID int,
oDate datetime,
oTotalPrice int,
foreign key (cID) references customer(cID)
);
insert into oder(cID,oDate,oTotalPrice) value(1,'2006-3-21',10);
insert into oder(cID,oDate,oTotalPrice) value(2,'2006-3-23',20);
insert into oder(cID,oDate,oTotalPrice) value(1,'2006-3-16',30);
create table product(
pID int primary key auto_increment,
pName varchar(255),
pPrice int
);
insert into product(pName,pPrice) value('may giat',3);
insert into product(pName,pPrice) value('tu lanh',5);
insert into product(pName,pPrice) value('dieu hoa',7);
insert into product(pName,pPrice) value('quat',1);
insert into product(pName,pPrice) value('bep dien',2);

create table orderDetail(
oID int,
pID int,
odQTY int,
foreign key (oID) references oder(oID),
foreign key (pID) references product(pID)
);
insert into orderDetail(oID,pID,odQTY) value (1,1,3);
insert into orderDetail(oID,pID,odQTY) value (1,3,7);
insert into orderDetail(oID,pID,odQTY) value (1,4,2);
insert into orderDetail(oID,pID,odQTY) value (2,1,1);
insert into orderDetail(oID,pID,odQTY) value (3,1,8);
insert into orderDetail(oID,pID,odQTY) value (2,5,4);
insert into orderDetail(oID,pID,odQTY) value (2,3,3);

-- sắp xếp thời gian mua hàng của khách theo thứ tự giảm dần 
select * from oder order by oDate desc;
-- tìm người mua giá trị hàng hóa cao nhất 
select * from product where pPrice = (select max(pPrice) from product);
-- hiển thị danh sách các khách đã mua hàng và danh sách sản phẩm đã được mua 
select pName, name from orderDetail o1
join oder o2 on o1.oID = o2.oID
join customer c on o2.oID = c.cID
join product p on p.pID = o1.pID;
-- hiển thị danh sách khách không mua hàng 
select name from customer o1
left join oder o on o.cID = o1.cID
where o.cID is null;
-- hiển thị chi tiết từng hóa đơn (chưa hoạt động)
select o.oID, o1.oDate, o.odQTY, p.pName, p.pPrice from orderDetail o 
join oder o1 on o1.oID = o.oID
join product p on p.pID = o.pID;
-- hiển thị mã hóa đơn , ngày bán và giá tiền của từng hóa đơn 
select oder.oID , oder.oDate , sum(orderDetail.odQTY * product.pPrice) as oTotalPrice from orderDetail
join oder on orderDetail.oID = oder.oID
join product on orderDetail.pID = product.pID
group by orderDetail
	