-- member sql

--member ���̺����
create table member(
id varchar2(30) not null primary key, -- ���̵�
pwd varchar2(50) not null, -- ��й�ȣ
koreanName varchar2(50) not null, -- �ѱ� �̸�
englishName varchar2(50) not null, --�����̸�
birthday varchar2(30) not null, -- �������
gender varchar2(10) not null,	-- ����
passportNum varchar2(30) not null, -- ���ǹ�ȣ
nation varchar2(20) not null, --����
country varchar2(20) not null, --���� ����
email1 varchar2(15) not null,- �̸��� ���̵�κ�
email2 varchar2(15) not null,- �̸��� �޺κ�
tel1 number not null, -- ������ȣ(82)
tel2 number not null, -- 010
tel3 number not null, -- 1234
tel4 number not null, -- 5678
grade number not null, -- ���
boardingCnt number, --ž��Ƚ��
accumulatedPoint number,--��������Ʈ
usedPoint number, --�������Ʈ
totalPoint number --������Ʈ
);

--ȸ������
INSERT INTO member VALUES(#{id}, #{pwd}, #{koreanName}, #{englishName}, #{birthday}, #{gender}, #{passportNum}, #{nation}, #{country}, #{email1}, #{email2}, #{tel1}, #{tel2}, #{tel3}, #{tel4}, 'silver', 0, 1000, 0, 0)

--ȸ������ ����
UPDATE member SET koreanName=#{koreanName},englishName=#{englishName},birthday=#{birthday},gender=#{gender},passportNum=#{passportNum},nation=#{nation},country=#{country},email1=#{email1},email2=#{email2},tel1=#{tel1},tel2=#{tel2},tel3=#{tel3},tel4=#{tel4}
		WHERE id = #{id}

--ȸ���������
SELECT * FROM member WHERE id = #{id}

--�α���
SELECT * FROM member WHERE id = #{id } and pwd = #{pwd }

--���̵� �ߺ��˻�
select id from member where id = #{id }
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- event sql
--�̺�Ʈ ������ ����
create sequence seq_event nocache nocycle;
--�̺�Ʈ ���̺� ����
create table event (
seq number,
id varchar2(100) not null,
subject varchar2(100) not null,
content varchar2(1000) not null,
image varchar2(100),
hit number,
logtime date);

--�̺�Ʈ �Խù� �ۼ�
INSERT INTO event VALUES(seq_event.nextval,#{id},#{subject},#{content},#{image},0,to_date(sysdate,'YY-MM-DD'))

--�̺�Ʈ �Խù� ����
UPDATE event SET subject=#{subject},content=#{content}	WHERE seq = #{seq}

--�̺�Ʈ �Խù� ����
DELETE FROM event WHERE seq = #{seq}

--�������� �̺�Ʈ �� ����(���� ��¥�κ��� 30�� �̳�)
<![CDATA[SELECT count(*) FROM event where (select to_date(sysdate, 'YY.MM.DD')+1 - to_date(logtime, 'YY.MM.DD') from dual) <= 30]]>

--����� �̺�Ʈ �� ����(���� ��¥�κ��� 30�� ����)
<![CDATA[SELECT count(*) FROM event where (select to_date(sysdate, 'YY.MM.DD')+1 - to_date(logtime, 'YY.MM.DD') from dual) > 30]]>

--�������� �̺�Ʈ ����Ʈ ���
<![CDATA[select seq, id, subject, content, hit, image, to_char(logtime,'YY.MM.DD') as logtime from (select rownum rn, tt. * from (select * from event order by seq desc)tt) where rn>=#{startNum} and rn<=#{endNum} and (select
  		to_date(sysdate, 'YY.MM.DD')+1 - to_date(logtime, 'YY.MM.DD') from dual) <= 30]]>

--����� �̺�Ʈ ����Ʈ ���
<![CDATA[select seq, id, subject, content, hit, image, to_char(logtime,'YY.MM.DD') as logtime from (select rownum rn, tt. * from (select * from event order by seq desc)tt) where (select
  		to_date(sysdate, 'YY.MM.DD')+1 - to_date(logtime, 'YY.MM.DD') from dual) > 30]]>

--�̺�Ʈ ���� ���
SELECT * FROM event WHERE seq=#{seq}

--�̺�Ʈ ����
UPDATE event SET hit=hit+1 WHERE seq=#{seq}

--�̺�Ʈ ��ȸ�� ����
UPDATE event SET hit=hit+1 WHERE seq=#{seq}
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--�������� sql

--�������� ������ ����
create sequence seq_notice nocache nocycle;

--�������� ���̺� ����
create table notice (
seq number,
id varchar2(100),
subject varchar2(1000),
content varchar2(1000),
hit number,
logtime date
);

--�������� �Է�
INSERT INTO notice VALUES(seq_notice.nextval,#{id},#{subject},#{content},0,to_date(sysdate,'YY-MM-DD'))

--�������� ����
UPDATE notice SET subject=#{subject},content=#{content}	WHERE seq = #{seq}

--�������� ����
DELETE FROM notice WHERE seq = #{seq}

--�������� �� ����
<![CDATA[SELECT count(*) FROM notice]]>

--�������� ����Ʈ ���
<![CDATA[select seq, id, subject, content, hit, to_char(logtime,'YY.MM.DD') as logtime from (select rownum rn, tt. * from (select * from notice order by seq desc)tt) where rn>=#{startNum} and rn<=#{endNum}]]>

--�������� ���
SELECT * FROM notice WHERE seq=#{seq}

--�������� ��ȸ�� ����
UPDATE notice SET hit=hit+1 WHERE seq=#{seq}

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------












