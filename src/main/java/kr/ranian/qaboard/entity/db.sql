create table tblBoard (

	idx int not null,
	memID varchar(20) not null,
	title varchar(100) not null,
	content varchar(2000) not null,
	writer varchar(30) not null,
	indate datetime default now(),
	count int default 0,
	
	boardGroup int,
	boardSequence int,
	boardLevel int,
	boardAvailable int,
	
	primary key(idx)

);

create table tblMember (

	memID varchar(50) not null,		-- 회원 ID
	memPwd varchar(50) not null,	-- 회원 비번
	memName varchar(50) not null,	-- 회원 이름 
	memPhone varchar(50) not null,	-- 회원 전화번호
	memAddr varchar(50),			-- 회원 주소 
	latitude decimal(13,10),		-- 현재 위치 위도
	longitude decimal(13,10),		-- 현재 위치 경도 
	
	primary key(memID)

);

insert into tblMember(memID, memPwd, memName, memPhone) values ('test01', 'test01', '관리자', '010-1111-1111');
insert into tblMember(memID, memPwd, memName, memPhone) values ('test02', 'test02', '아이유', '010-2222-2222');
insert into tblMember(memID, memPwd, memName, memPhone) values ('test03', 'test03', '유재석', '010-3333-3333');

select * from tblMember;
select * from tblBoard;

-- JUnit 목록 보기 - Mapper 테스트
-- 게시물 PK 최대값 구하기
select IFNULL(max(idx) + 1, 1) from tblBoard;
-- 게시물 그룹 최대값 구하기 
select IFNULL(max(boardGroup) + 1, 0) from tblBoard;
-- 게시물 추가 (관리자)
insert into tblBoard
select
	IFNULL(max(idx) + 1, 1), 
    'test01', '게시판 연습1', '게시판 연습1', '관리자', now(), 0, 
    IFNULL(max(boardGroup) + 1, 0),
    0, 0, 1
from tblBoard;

insert into tblBoard
select
	IFNULL(max(idx) + 1, 1), 
    'test02', '게시판 연습2', '게시판 연습2', '아이유', now(), 0, 
    IFNULL(max(boardGroup) + 1, 0),
    0, 0, 1
from tblBoard;

insert into tblBoard
select
	IFNULL(max(idx) + 1, 1), 
    'test03', '게시판 연습3', '게시판 연습3', '유재석', now(), 0, 
    IFNULL(max(boardGroup) + 1, 0),
    0, 0, 1
from tblBoard;

select * from tblBoard;



