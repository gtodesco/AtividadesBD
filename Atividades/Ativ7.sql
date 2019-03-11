/*A*/
SELECT e.ENAME 'Nome', e.DEPTNO 'Departamento', e.JOB 'Atividade', d.LOC 'Localização'
FROM EMP e, DEPT d
WHERE e.DEPTNO = d.DEPTNO AND d.LOC = (SELECT LOC
										FROM DEPT
										WHERE DEPTNO = 20);

/*B*/
SELECT empno 'Número', ename 'Nome', sal 'Salário'
FROM emp
WHERE sal < (SELECT AVG(sal)
			from emp)
ORDER BY sal DESC;

/*C*/
SELECT ename 'Nome', sal 'Salário'
from emp
where mgr = (select empno
			from emp
            where ename = 'KING');

/*D*/
SELECT ename 'Nome'
From emp
where sal = (SELECT max(sal)
			from emp);

/*E*/
SELECT e.ename 'Nome', d.dname 'Departamento', d.LOC 'Localização'
From emp e, dept d
where e.deptno = d.deptno AND sal > (SELECT avg(sal)
									from emp);

/*F*/
SELECT d.DNAME 'Departamento', COUNT(*) 'Empregados'
FROM DEPT d, EMP e
WHERE COUNT(*) > ALL (SELECT COUNT(*)
					from dept, emp);
