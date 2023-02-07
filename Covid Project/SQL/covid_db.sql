use nas;

SHOW GLOBAL VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 'ON';

LOAD DATA LOCAL INFILE 'E:/Covid Project/covid_vac1.csv' INTO TABLE covid_vac
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE 'E:/Covid Project/covid_deaths1.csv' INTO TABLE covid_deaths
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

select * from covid_deaths;
select * from covid_vac;

-- (Known) infection rate
select location,population,max(total_cases),max(total_cases/population)*100 as Infection_Rate
from covid_deaths as cd
group by idx
order by infection_rate DESC;

-- mortality rate
select location,population,max(total_deaths),max(total_deaths/population)*100 as mortality_Rate
from covid_deaths as cd
group by idx
order by mortality_rate DESC;

-- fatality rate
select location,max(total_cases),max(total_deaths),(max(total_deaths)/max(total_cases))*100 as mortality_Rate
from covid_deaths as cd
group by idx
order by mortality_rate DESC;

-- Testing rate for the population 
select  cd.date, cv.location, cd.population, cv.total_tests, (cv.total_tests/cd.population)*100 as Testing_rate
from covid_vac as cv
JOIN covid_deaths as cd ON cv.idx=cd.idx AND cv.date=cd.date
ORDER BY Testing_rate DESC;


-- fetching data about egypt
select *,new_tests,total_tests, total_vaccinations,people_fully_vaccinated from covid_deaths as cd
JOIN covid_vac as cv ON cv.idx=cd.idx AND cv.date=cd.date
WHERE cd.location="Egypt";



