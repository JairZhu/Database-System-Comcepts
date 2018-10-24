SELECT custkey, name
FROM Customer
WHERE custkey IN (
	SELECT O.custkey
	FROM Orders O, Lineitem L, PartSupp PS, Part P
	WHERE O.orderkey = L.orderkey AND
		L.partkey = PS.partkey AND
		L.suppkey = PS.suppkey AND
		PS.partkey = P.partkey AND
		P.mfgr = '���������칫' AND P.name = '�豾LB125T��5B����Ħ�г�');

SELECT custkey, name
FROM Customer
WHERE custkey IN (
	SELECT O.custkey
	FROM Orders O, Lineitem L, Part P
	WHERE O.orderkey = L.orderkey AND
		L.partkey = P.partkey AND
		P.mfgr = '���������칫' AND P.name = '�豾LB125T��5B����Ħ�г�');

SELECT custkey, name
FROM Customer C
WHERE NOT EXISTS (SELECT O.custkey
	FROM Orders O, Lineitem L, PartSupp PS, Part P
	WHERE C.custkey = O.custkey AND
		O.orderkey = L.orderkey AND
		L.partkey = PS.partkey AND
		L.suppkey = PS.suppkey AND
		PS.partkey = P.partkey AND
		P.mfgr = '���������칫' AND P.name = '�豾LB125T��5B����Ħ�г�');

SELECT CA.name
FROM Customer CA
WHERE NOT EXISTS(
	SELECT *
	FROM Customer CB, Orders OB, Lineitem LB
	WHERE CB.custkey = OB.custkey AND
		OB.orderkey = LB.orderkey AND
		CB.name = '����' AND
		NOT EXISTS(
			SELECT *
			FROM Orders OC, Lineitem LC
			WHERE CA.custkey = OC.custkey AND
				OC.orderkey = LC.orderkey AND
				LB.suppkey = LC.suppkey AND
				LB.partkey = LC.partkey));

SELECT C.*
FROM Customer C, (SELECT custkey
    FROM Orders
    GROUP BY custkey
    HAVING AVG(totalprice) > 10000) B, Nation N
WHERE C.custkey = B.custkey AND C.nationkey = N.nationkey AND N.name = '�й�';

SELECT P.*
FROM Customer C, Orders O, Lineitem L, PartSupp PS, Part P
WHERE C.custkey = O.custkey AND O.orderkey = L.orderkey AND
    L.suppkey = PS.suppkey AND L.partkey = PS.partkey AND
    PS.partkey = P.partkey AND C.name = '�ܲ�'
INTERSECT
SELECT P.*
FROM Customer C, Orders O, Lineitem L, PartSupp PS, Part P
WHERE C.custkey = O.custkey AND O.orderkey = L.orderkey AND
    L.suppkey = PS.suppkey AND L.partkey = PS.partkey AND
    PS.partkey = P.partkey AND C.name = '������'

SELECT P.*
FROM Customer C, Orders O, Lineitem L, PartSupp PS, Part P
WHERE C.custkey = O.custkey AND O.orderkey = L.orderkey AND
    L.suppkey = PS.suppkey AND L.partkey = PS.partkey AND
    PS.partkey = P.partkey AND C.name = '�ܲ�'
UNION
SELECT P.*
FROM Customer C, Orders O, Lineitem L, PartSupp PS, Part P
WHERE C.custkey = O.custkey AND O.orderkey = L.orderkey AND
    L.suppkey = PS.suppkey AND L.partkey = PS.partkey AND
    PS.partkey = P.partkey AND C.name = '������'

SELECT P.*
FROM Customer C, Orders O, Lineitem L, PartSupp PS, Part P
WHERE C.custkey = O.custkey AND O.orderkey = L.orderkey AND
    L.suppkey = PS.suppkey AND L.partkey = PS.partkey AND
    PS.partkey = P.partkey AND C.name = '�ܲ�'
EXCEPT
SELECT P.*
FROM Customer C, Orders O, Lineitem L, PartSupp PS, Part P
WHERE C.custkey = O.custkey AND O.orderkey = L.orderkey AND
    L.suppkey = PS.suppkey AND L.partkey = PS.partkey AND
    PS.partkey = P.partkey AND C.name = '������'