use tripRouletteDB;

/* Table1. Area (테이블1. 지역) */					
-- # primary key: 코드(A00N)
-- 코드				행정구역				하위 행정구역			하부 조직			행정구역 간략			하위 행정구역 간략		여행 상태
-- a_code			a_first				a_second			a_third			a_first_sp			a_second_sp			a_state
-- char(4) / NN		varchar(10) / NN	varchar(10) / NN	varchar(10)		varchar(10) / NN	varchar(10) / NN	boolean / NN
-- A001(A00N)		서울특별시				강남구				장안구			서울					강남					0
create table tbl_area(
	a_code char(4) not null default 0,
    a_first varchar(10) not null,
    a_second varchar(10) not null,
    a_third varchar(10),
    a_first_sp varchar(10) not null,
    a_second_sp varchar(10) not null,
    a_state boolean not null default 0,
    primary key (a_code)
);
select * from tbl_area;
drop table tbl_area;

create table tbl_area_seq(
	a_code int not null auto_increment primary key
);
select * from tbl_area_seq;
drop table tbl_area_seq;

DELIMITER $$
create trigger tg_tbl_area
before insert on tbl_area
for each row
begin
	insert into tbl_area_seq values(null);
    set new.a_code = concat('A', lpad(last_insert_id(), 3, '0'));
end $$
DELIMITER ;tbl_area