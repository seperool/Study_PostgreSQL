/* BANCO DE DADOS - data_science */

/*Estatisticas*/

/* Mostrando uma quantidade limitada de linhas */
select * from funcionarios
limit 10;


/* Qual o gasto total de salario pago pela empresa? */
select sum(salario) from funcionarios;


/* Qual o montante total que cada departamento recebe de salario */
select departamento, sum(salario)
from funcionarios
group by departamento;


/* Por departamento, qual o total e a média paga para
os funcionarios? */

select sum(salario), avg(salario)
from funcionarios;

select departamento, sum(salario), avg(salario)
from funcionarios
group by departamento;

/*ordenando*/
select departamento, sum(salario), avg(salario)
from funcionarios
group by departamento
order by 3;

select departamento, sum(salario), avg(salario)
from funcionarios
group by departamento
order by 3 ASC;

select departamento, sum(salario), avg(salario)
from funcionarios
group by departamento
order by 3 DESC;