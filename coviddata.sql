select * from coviddeaths;
select * from covidvaccinations;
select location,date,total_cases,new_cases,total_deaths,population,continent
from coviddeaths;
-- Total_cases vs Total_deaths
select location,date,population,total_cases,new_cases,total_deaths,(total_deaths/total_cases)*100 as Deathpercentage
from coviddeaths
where location = 'Europe';
-- Total_cases vs population
-- shows what percentage of population got covid
select location,date,total_cases,population,new_cases,total_deaths,(total_cases/population)*100 
as percent_population_infected
from coviddeaths
where location = 'Europe';
select * from coviddeaths;
-- Looking at the continent with Highest infection rate compared to population
select location, Max(total_cases)as Highest_count,population,
Max((total_cases/population))*100 as percent_population_infected
from coviddeaths
Group by location,population
order by percent_population_infected desc;
-- showing countries with highest death count per population
select location, Max(total_deaths) as total_death_count
from coviddeaths
Group by location
order by total_death_count desc;

-- Total population vs vaccinations
select dea.location,dea.date, dea.population, vac.new_vaccinations
from coviddeaths dea
join covidvaccinations vac
on dea.location = vac.location
and dea.date = vac.date




